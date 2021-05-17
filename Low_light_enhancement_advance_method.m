i=imread('Dark.jpg');
figure,imshow(i);
AInv=imcomplement(i);
BInv=imreducehaze(AInv);
figure,imshow(BInv);
BInv = imreducehaze(AInv, 'Method','approx','ContrastEnhancement','boost');
BImp = imcomplement(BInv);
figure,imshow(BImp);
montage({i,BImp})
title("Original Image (Left) vs. Enhanced Image (Advance Method) (Right)")