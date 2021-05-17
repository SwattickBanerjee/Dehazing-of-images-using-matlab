i=imread('Dark.jpg');
figure,imshow(i);
AInv=imcomplement(i);
BInv=imreducehaze(AInv);
figure,imshow(BInv);
B = imcomplement(BInv);
figure,imshow(B);
montage({i,B})
title("Original Image (Left) vs. Enhanced Image (Right)")