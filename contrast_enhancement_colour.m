[RGB,map] = imread('colour.jpg');
[X,map] = rgb2ind(RGB,255);
%rgb2ind( RGB , inmap ) converts the RGB image to an indexed image using the inverse colormap algorithm with specified colormap
%An indexed image consists of an array, called X in this documentation, and a colormap matrix, called map. The pixel values in the array are direct indices into a colormap.
shadow = ind2rgb(X,map); 
% ind2rgb( X , map ) converts the indexed image X and corresponding colormap map to RGB (truecolor) format.
shadow_lab = rgb2lab(shadow);
%Transform a colormap or image from sRGB to CIE L*a*b* color space.
%It expresses color as three values: L* for perceptual lightness, and a* and b* for the four unique colors of human vision: red, green, blue, and yellow.
max_luminosity = 100;
L = shadow_lab(:,:,1)/max_luminosity;
%three types of contrast adjustment on the luminosity channel, and keep the a* and b* channels unchanged. Convert the images back to the RGB color space.
shadow_imadjust = shadow_lab;
shadow_imadjust(:,:,1) = imadjust(L)*max_luminosity;
shadow_imadjust = lab2rgb(shadow_imadjust);
shadow_histeq = shadow_lab;
shadow_histeq(:,:,1) = histeq(L)*max_luminosity;
shadow_histeq = lab2rgb(shadow_histeq);
shadow_adapthisteq = shadow_lab;
shadow_adapthisteq(:,:,1) = adapthisteq(L)*max_luminosity;
shadow_adapthisteq = lab2rgb(shadow_adapthisteq);
figure
montage({shadow,shadow_imadjust,shadow_histeq,shadow_adapthisteq},'Size',[1 4])
title("Original Image and Enhanced Images using imadjust, histeq, and adapthisteq")
figure,imshow(shadow)
title('Original Image')
figure,imshow(shadow_imadjust)
title('Enhanced Image using imadjust')
figure,imshow(shadow_histeq)
title('Enhanced Images using histeq')
figure,imshow(shadow_adapthisteq)
title('Enhanced Images using adapthisteq')