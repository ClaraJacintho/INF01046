function l = HistogramaHSV(image)
img = rgb2hsv(image);
h = img(:,:,1);
s = img(:,:,2);
v = img(:,:,3);
figure;
subplot(3,1,1); imhist(h);
subplot(3,1,2); imhist(s);
subplot(3,1,3); imhist(v);
return;
end
