pout = imread('gray.png');
pout_imadjust = imadjust(pout);
pout_histeq = histeq(pout);
pout_adapthisteq = adapthisteq(pout);
montage({pout,pout_imadjust,pout_histeq,pout_adapthisteq},'Size',[1 4])
title("Original Image and Enhanced Images using imadjust, histeq, and adapthisteq")
figure,imshow(pout)
title('Original Image')
figure,imshow(pout_imadjust)
title('Enhanced Image using imadjust')
figure,imshow(pout_histeq)
title('Enhanced Images using histeq')
figure,imshow(pout_adapthisteq)
title('Enhanced Images using adapthisteq')
