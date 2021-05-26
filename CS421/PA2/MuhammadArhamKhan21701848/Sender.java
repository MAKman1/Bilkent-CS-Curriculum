import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketTimeoutException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

public class Sender {

	public static int WINDOW_S;
	public static int TIMEOUT;
	public static int PORT;

	public static DatagramSocket receiverSocket;
	public static ArrayList<byte[]> sent = new ArrayList<>();
	public static int lastSent = 1;
	public static int waitingLine = 1;
	public static int lastSeq = 0;
	public static byte[] fileBytes;
	public static InetAddress receiverAddress;

	public static void main(String[] args) throws Exception {

		String File_path = args[0];
		PORT = Integer.parseInt(args[1]);
		WINDOW_S = Integer.parseInt(args[2]);
		TIMEOUT = Integer.parseInt(args[3]);

		fileBytes = Files.readAllBytes(Paths.get("" + File_path));
		lastSeq = (int) Math.ceil((double) fileBytes.length / 1022);

		receiverSocket = new DatagramSocket();
		receiverAddress = InetAddress.getByName("127.0.0.1");

		// running receive thread
		Thread receiver = new Thread(new ReceiverThread());
		receiver.start();

		Thread sender = new Thread(new SenderThread());
		sender.start();

		receiver.join();
		sender.join();
	}

	static void sendEmpty() {
		try {
			short zero = 0;
			byte[] zeroHeader = new byte[2];
			byte byteTemp1 = (byte) (zero);
			byte byteTemp2 = (byte) ((zero >> 8) & 0xff);
			zeroHeader[0] = byteTemp1;
			zeroHeader[1] = byteTemp2;
			DatagramPacket zeroPacket = new DatagramPacket(zeroHeader, zeroHeader.length, receiverAddress, PORT);
			receiverSocket.send(zeroPacket);
		} catch (Exception e) {
			System.out.println("except: " + e.toString());
		}

	}

	static class SenderThread implements Runnable {
		public void run() {
			boolean running = true;
			while (running) {
				try {
					while (lastSent - waitingLine < WINDOW_S && lastSent <= lastSeq) {

						// Array to store part of the bytes to send
						byte[] filePacketBytes = new byte[1024];

						// Copy segment of data bytes to array
						short sn = Integer.valueOf(lastSent).shortValue();
						filePacketBytes[0] = (byte) (sn >> 8);
						filePacketBytes[1] = (byte) sn;
						for (int i = 0; i < 1022 && (lastSent * 1022 + i) < fileBytes.length; i++) {
							filePacketBytes[i + 2] = fileBytes[((lastSent - 1) * 1022) + i];
						}

						// Create the packet
						DatagramPacket packet = new DatagramPacket(filePacketBytes, filePacketBytes.length,
								receiverAddress, PORT);

						// System.out.println("Sending packet with sequence number " + lastSent + " and
						// size "
						// + filePacketBytes.length + " bytes");

						// Add packet to the sent list
						sent.add(filePacketBytes);

						receiverSocket.send(packet);

						lastSent++;
					}
					if ((int) lastSent > lastSeq) {
						running = false;
						return;
					}
					Thread.sleep(TIMEOUT);

				} catch (Exception e) {
					System.out.println("Send Exception: " + e.toString());
				}
			}
		}
	}

	static class ReceiverThread implements Runnable {
		public void run() {
			boolean running = true;
			while (running) {
				try {
					if (receiverSocket != null) {
						byte[] resBytes = new byte[2];
						DatagramPacket responsePacket = new DatagramPacket(resBytes, resBytes.length);

						try {
							receiverSocket.setSoTimeout(TIMEOUT);

							receiverSocket.receive(responsePacket);

							short response = (short) ((responsePacket.getData()[0] << 8)
									+ (responsePacket.getData()[1] & 0xFF));

							// System.out.println("Received ACK for " + response);

							if (response == lastSeq) {
								sendEmpty();
								running = false;
							}
							waitingLine = Math.max(waitingLine, response);

						} catch (SocketTimeoutException e) {

							for (int i = waitingLine - 1; i < lastSent - 1; i++) {

								byte[] sendData = sent.get(i);

								// Create the packet
								DatagramPacket packet = new DatagramPacket(sendData, sendData.length, receiverAddress,
										PORT);

								receiverSocket.send(packet);

								short seqNo = (short) ((sent.get(i)[0] << 8) + (sent.get(i)[1] & 0xFF));

								if (seqNo == waitingLine) {
									waitingLine++;
								}
								if (seqNo == lastSeq) {
									sendEmpty();
									running = false;
								}
							}
						}
					}
				} catch (Exception e) {
					System.out.println("Exception is caught: " + e.toString() + e.getLocalizedMessage());
				}
			}
		}
	}
}