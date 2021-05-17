A = imread('fog1.jpg');
B = imreducehaze(A);
%C=imshow(A);
C = montage({A,B})
impixelinfo(C);
title("Hazy Image (Left) vs. Reduced Haze Image (Right)")
