A = imread('fog1.jpg');
B = imreducehaze(A,0.5,'method','approxdcp');
C = imreducehaze(A,0.75,'method','approxdcp');
D = imreducehaze(A,1.0,'method','approxdcp');
%figure,imshow(B);
%figure,imshow(C);
montage({A,B,C,D});
title("Original Image (Left) vs Approax method(50%) (Right) vs Approax method(75%) (Bottom left) vs Approax method(100%) (Bottom Right)")
