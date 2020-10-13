function k = CanaisHSV(image)
img = rgb2hsv(image);
hue = img(:,:,1);
sat = img(:,:,2);
val = img(:,:,3);
k = figure; subplot(2,2,1), imshow(img,[]),
title('Original image - HSV')
subplot(2,2,2), imshow(hue,[]), title('Hue channel'),
subplot(2,2,3), imshow(sat,[]),
title('Saturation channel')
subplot(2,2,4) , imshow(val,[]), title('Value channel'),
return;
end

