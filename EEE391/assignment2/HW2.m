% Part 4
I =imread("image0part4.jpg");

[rows, cols, width] = size(I);
fprintf('%d by %d by %d\n', rows, cols, width);

xMatrix = [1 0 -1; 2 0 -2; 1 0 -1];
yMatrix = [1 2 1; 0 0 0; -1 -2 -1];

rxConv = conv2( xMatrix, I(:,:, 1));
bxConv = conv2( xMatrix, I(:,:, 2));
gxConv = conv2( xMatrix, I(:,:, 3));

ryConv = conv2( yMatrix, I(:,:, 1));
byConv = conv2( yMatrix, I(:,:, 2));
gyConv = conv2( yMatrix, I(:,:, 3));

Gred = sqrt( ((rxConv .^ 2) + (ryConv .^ 2)));
Gblue = sqrt( ((bxConv .^ 2) + (byConv .^ 2)));
Ggreen = sqrt( ((gxConv .^ 2) + (gyConv .^ 2)));

[r, c] = size(Gred);
fprintf('%d by %d\n', r, c);

out = ones(r, c, width);

out(:,:,1) = Gred;
out(:,:,2) = Gblue;
out(:,:,3) = Ggreen;

out = uint8(out);

imshow(out)



%Part 3
imgray =imread("gray.jpg");
imsaltnoise = imgray;
noisypixels = rand( size(imgray,1), size(imgray,2) );
imsaltnoise( find( noisypixels <= ( 1 / 16 ) ) ) = 255;
imsaltnoise( find( noisypixels >= ( 15 / 16 ) ) ) = 0;

 
out = func2( imsaltnoise, 121);
imshow( out);

function [J] = func2( I, M)
    [rows, cols] = size(I);
    fprintf('%d by %d\n', rows, cols);
    
    J = rand(rows,cols);
    
    N = (sqrt( M) - 1) / 2;
    
    for row=1:rows
        for col=1:cols
            
            %Making a temporary matrix with 0 values
            len = (N * 2) + 1;
            tempMatrix = zeros(len,len);

            if (row - N) < 1; Xstart = 1; else; Xstart = row - N; end
            if (row + N) > rows; Xend = rows; else; Xend = row + N; end
            if (col - N) < 1; Ystart = 1; else; Ystart = col - N; end
            if (col + N) > cols; Yend = cols; else; Yend = col + N; end
            
            xTemp = 1;
            for a=Xstart:Xend
                yTemp = 1;
                for b=Ystart:Yend
                    tempMatrix(xTemp, yTemp) = I(a, b);
                    yTemp = yTemp + 1;
                end
                xTemp = xTemp + 1;
            end
            
            
            %Finding median from temporary matrix
            medRow = double(median( tempMatrix(1:len,1:len)));
            medFinal = median( medRow);
            J(row, col) = double(medFinal) / 255.0;
            
        end
    end
end
 
function [J] = func1( I, M)
    [rows, cols] = size(I);
    fprintf('%d by %d\n', rows, cols);
    
    J = rand(rows,cols);
    
    N = (sqrt( M) - 1) / 2;
    
    for row=1:rows
        for col=1:cols
            
            sumTemp = 0.0;
            for r=(row-N):(row+N)
                for c=(col-N):(col+N)
                    if( r > 0) && (c > 0) && ( r <= rows) && ( c <= cols)
                        sumTemp = double(sumTemp) + double( I(r, c));
                    end
                end
            end
            J(row, col) = double(sumTemp) / double(M) / 255.0;
        end
    end
end






%Part 2
 
[rows, cols, width] = size(I);
fprintf('%d by %d by %d\n', rows, cols, width);

out = rand(rows,cols);


for row=1:rows
    for col=1:cols
        
        %R pixel
        if A(row, col, 1) > 140
            out(row, col) = 1;
        else
            out(row, col) = 0;
        end
        
        %G pixel
        if A(row, col, 2) > 140
            out(row, col) = 1;
        else
            out(row, col) = 0;
        end
        
         B pixel
         if A(row, col, 3) > 140
             out(row, col) = 1;
         else
             out(row, col) = 0;
         end

         if ((A(row, col, 1) > 140) && (A(row, col, 2) > 140) && (A(row, col, 3) < 30))
             out(row, col) = 1;
         else
             out(row, col) = 0;
         end

 for r=1:rows
     for c=1:cols
         avg = (double(A(r, c, 1)) + double(A(r, c, 2)) + double(A(r, c, 3))) / 3.0;
         avg = double(avg) / 255.0;
         out(r, c) = avg;
     end
 end
 
Folder = '';
File   = 'gray.jpg';
imwrite(out, fullfile(Folder, File));
imshow(out);
    end
end