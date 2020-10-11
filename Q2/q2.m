% Parte 1 - contrast_stretching e histogram equalizer com imagens b&w

I_ny = imread('images/ny.png');
figure, imshow(I_ny);
figure,imhist(I_ny);

ny_1 = contrast_stretching(I_ny, 200, 240, 100, 250);
%imwrite(ny_1, 'images/ny_CS1.png')
figure, imhist(ny_1);

ny_2 = contrast_stretching(I_ny, 200, 230, 75, 240);
%imwrite(ny_1, 'images/ny_CS2.png')
figure, imhist(ny_2);

ny_heq = hist_eq(I_ny);
%imwrite(ny_heq, 'images/ny_heq.png');
figure, imhist(ny_heq);


I_de = imread('images/germany.png');
figure, imshow(I_de);
figure,imhist(I_de);

de_1 = contrast_stretching(I_de, 160, 230, 100, 240);
%imwrite(de_1, 'images/de_cs1.png');
figure,imhist(de_1);


de_2 = contrast_stretching(I_de, 5, 40, 5, 120);
%imwrite(de_2, 'images/de_cs2.png');
figure,imhist(de_2);

de_heq = hist_eq(I_de);
%imwrite(de_1, 'images/de_heq.png');
figure,imhist(de_heq);

% Parte 2 - contrast_stretching em cada canal de imagens RGB
I_at = imread('images/hallstatt.jpg');
figure, imshow(I_at);

redI_at = I_at(:,:,1);
greenI_at = I_at(:,:,2);
blueI_at = I_at(:,:,3);

figure, imshow(redI_at);
figure, imhist(redI_at);
redI_at_cs = contrast_stretching(redI_at, 50, 110, 20, 170);
figure, imhist(redI_at_cs);
I_at_redCS = cat(3, redI_at_cs, greenI_at, blueI_at);
figure, imshow(I_at_redCS);
%imwrite(I_at_redCS, 'images/at_redcs.png');

figure, imshow(greenI_at);
figure, imhist(greenI_at);
greenI_at_cs = contrast_stretching(greenI_at, 60, 140, 50, 170);
figure, imhist(greenI_at_cs);
I_at_greenCS = cat(3, redI_at, greenI_at_cs, blueI_at);
figure, imshow(I_at_greenCS);
%imwrite(I_at_greenCS, 'images/at_greencs.png');

figure, imshow(blueI_at);
figure, imhist(blueI_at);
blueI_at_cs = contrast_stretching(blueI_at, 70, 150, 40, 220);
figure, imhist(blueI_at_cs);
I_at_blueCS = cat(3, redI_at, greenI_at, blueI_at_cs);
figure, imshow(I_at_blueCS);
%imwrite(I_at_blueCS, 'images/at_bluecs.png');

I_allchans_cs = cat(3, redI_at_cs, greenI_at_cs, blueI_at_cs);
imshow(I_allchans_cs);
%imwrite(I_allchans_cs, 'images/at_cs.png');

I_at_hsv = rgb2hsv(I_at);
I_at_h = I_at_hsv(:,:,1);
I_at_s = I_at_hsv(:,:,2);
I_at_v = I_at_hsv(:,:,3);
figure, imhist(I_at_v);

I_at_v_cs = contrast_stretching(I_at_v, 0.3, 0.65, 0.1, 0.9);
figure, imhist(I_at_v_cs);
I_at_hsv_cs = cat(3, I_at_h,I_at_s,I_at_v_cs);
I_at_rgb_cs = hsv2rgb(I_at_hsv_cs);
figure, imshow(I_at_rgb_cs);
%imwrite(I_at_rgb_cs, 'images/at_hsv_cs.png')

I_at_v_heq = hist_eq(I_at_v);
figure, imhist(I_at_v_heq);
I_at_hsv_heq = cat(3, I_at_h,I_at_s,I_at_v_heq);
I_at_rgb_heq = hsv2rgb(I_at_hsv_heq);
figure, imshow(I_at_rgb_heq);
imwrite(I_at_rgb_heq, 'images/at_hsv_heq.png')

I_dk = imread('images/copenhagen.jpg');

figure, imshow(I_dk);

redI_dk = I_dk(:,:,1);
greenI_dk = I_dk(:,:,2);
blueI_dk = I_dk(:,:,3);

%figure, imshow(redI_dk);
%figure, imhist(redI_dk);
redI_dk_cs = contrast_stretching(redI_dk, 190, 230, 160, 250);
%figure, imhist(redI_dk_cs);
I_dk_redCS = cat(3, redI_dk_cs, greenI_dk, blueI_dk);
%figure, imshow(I_dk_redCS)
%imwrite(I_dk_redCS, 'images/dk_redcs.png')


%figure, imshow(greenI_dk);
%figure, imhist(greenI_dk);
greenI_dk_cs = contrast_stretching(greenI_dk, 190, 240, 170, 250);
%figure, imhist(greenI_dk_cs);
I_dk_greenCS = cat(3, redI_dk, greenI_dk_cs, blueI_dk);
%figure, imshow(I_dk_greenCS)
%imwrite(I_dk_greenCS, 'images/dk_greencs.png')

%figure, imshow(blueI_dk);
%figure, imhist(blueI_dk);
blueI_dk_cs = contrast_stretching(blueI_dk, 200, 240, 160, 250);
%figure, imhist(blueI_dk_cs);
I_dk_blueCS = cat(3, redI_dk, greenI_dk, blueI_dk_cs);
%figure, imshow(I_dk_blueCS)
%imwrite(I_dk_blueCS, 'images/dk_bluecs.png')

I_dk_allchans_cs = cat(3, redI_dk_cs, greenI_dk_cs, blueI_dk_cs);
imshow(I_dk_allchans_cs);
imwrite(I_dk_allchans_cs, 'images/dk_cs.png');
I_dk_hsv = rgb2hsv(I_dk);
I_dk_h = I_dk_hsv(:,:,1);
I_dk_s = I_dk_hsv(:,:,2);
I_dk_v = I_dk_hsv(:,:,3);
figure, imhist(I_dk_v);

I_dk_v_heq = hist_eq(I_dk_v);
figure, imhist(I_dk_v_heq);
I_dk_hsv_heq = cat(3, I_dk_h,I_dk_s,I_dk_v_cs);
I_dk_rgb_heq = hsv2rgb(I_dk_hsv_heq);
figure, imshow(I_dk_rgb_heq);
imwrite(I_dk_rgb_heq, 'images/dk_hsv_heq.png')


