/**
* This method returns the number of times the specified letter occurs in the chosen word.
* @author Hanzallah Azim Burney, Abdul Hamid Dabboussi, Khasmamad, Muhammad Raza, Gledis, Supermurat
* @param The character to be checked in the word.
* @return The number of times the letter occurs or else the corresponding error code.
*/
public int tryThis(char letter){
	int count;
	count = 0;
	if (this.usedLetters.indexOf(letter) != -1){
		return -2;
	}
	else if (isGameOver()){
		return -3;
	{
	else if(this.secretWord.indexOf(letter) != -1 ){
		for (int i = 0; i < this.secretWord.length(); i++){
			if (this.secretWord.charAt(i) == letter){
				this.knownSoFar.replace(i,i+1,letter);
				count++;
			}
		}
		usedLetters.append(letter);
		return count;
	}
	else{
		numberOfIncorrectTries++;
		return -1;
	}
}