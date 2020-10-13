function j = HistogramaRGB(image)
img = image;
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
figure;
subplot(3,1,1); imhist(red);
subplot(3,1,2); imhist(green);
subplot(3,1,3); imhist(blue);
return;
end
