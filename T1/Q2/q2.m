% Parte 1 - contrast_stretching e histogram equalizer com imagens b&w

% Imagem 1 - Nova Iorque
I_ny = imread('images/ny.png');
figure, imshow(I_ny);
figure,imhist(I_ny);

ny_1 = contrast_stretching(I_ny, 200, 240, 100, 250);
imwrite(ny_1, 'images/ny_CS1.png')
figure, imhist(ny_1);

ny_2 = contrast_stretching(I_ny, 200, 230, 75, 240);
imwrite(ny_2, 'images/ny_CS2.png')
figure, imhist(ny_2);

ny_heq = hist_eq(I_ny);
imwrite(ny_heq, 'images/ny_heq.png');
figure, imhist(ny_heq);

% Imagem 2 - Alemanha
I_de = imread('images/germany.png');
figure, imshow(I_de);
figure,imhist(I_de);

de_1 = contrast_stretching(I_de, 160, 230, 100, 240);
imwrite(de_1, 'images/de_cs1.png');
figure,imhist(de_1);


de_2 = contrast_stretching(I_de, 5, 40, 5, 120);
imwrite(de_2, 'images/de_cs2.png');
figure,imhist(de_2);

de_heq = hist_eq(I_de);
imwrite(de_1, 'images/de_heq.png');
figure,imhist(de_heq);

% Parte 2 - contrast_stretching em cada canal de imagens RGB
% Transformação em HSV e aplicação de CS e Hist_eq no canal V

% Imagem 1 - Austria
I_at = imread('images/hallstatt.jpg');
figure, imshow(I_at);

% separa a imagem em canais RGB
redI_at = I_at(:,:,1);
greenI_at = I_at(:,:,2);
blueI_at = I_at(:,:,3);

figure, imshow(redI_at);
figure, imhist(redI_at);
% aplica contrast stretching no canal vermelho
redI_at_cs = contrast_stretching(redI_at, 50, 110, 20, 170);
figure, imhist(redI_at_cs);
% "remonta" a imagem com o canal vermelho modificado
I_at_redCS = cat(3, redI_at_cs, greenI_at, blueI_at);
figure, imshow(I_at_redCS);
imwrite(I_at_redCS, 'images/at_redcs.png');

figure, imshow(greenI_at);
figure, imhist(greenI_at);
greenI_at_cs = contrast_stretching(greenI_at, 60, 140, 50, 170);
figure, imhist(greenI_at_cs);
I_at_greenCS = cat(3, redI_at, greenI_at_cs, blueI_at);
figure, imshow(I_at_greenCS);
imwrite(I_at_greenCS, 'images/at_greencs.png');

figure, imshow(blueI_at);
figure, imhist(blueI_at);
blueI_at_cs = contrast_stretching(blueI_at, 70, 150, 40, 220);
figure, imhist(blueI_at_cs);
I_at_blueCS = cat(3, redI_at, greenI_at, blueI_at_cs);
figure, imshow(I_at_blueCS);
imwrite(I_at_blueCS, 'images/at_bluecs.png');

% "remonta" a imagem com todos os canais modificados 
I_allchans_cs = cat(3, redI_at_cs, greenI_at_cs, blueI_at_cs);
imshow(I_allchans_cs);
imwrite(I_allchans_cs, 'images/at_cs.png');

% converte a imagem para HSV - transforma em uint8 para o melhor 
% funcionamento dos algoritmos 
I_at_hsv = im2uint8(rgb2hsv(I_at));

% separa em canais HSV
I_at_h = I_at_hsv(:,:,1);
I_at_s = I_at_hsv(:,:,2);
I_at_v = I_at_hsv(:,:,3);
figure, imhist(I_at_v);

I_at_v_cs = contrast_stretching(I_at_v, 75, 165, 50, 200);
figure, imhist(I_at_v_cs);
% "remonta" a imagem com o canal V modificado
I_at_hsv_cs = cat(3, I_at_h,I_at_s,I_at_v_cs);
% transforma de volta para RGB
I_at_rgb_cs = hsv2rgb(im2double(I_at_hsv_cs));
figure, imshow(I_at_rgb_cs);
imwrite(I_at_rgb_cs, 'images/at_hsv_cs.png')

I_at_v_heq = hist_eq(I_at_v);
figure, imhist(I_at_v_heq);
I_at_hsv_heq = cat(3, I_at_h,I_at_s,I_at_v_heq);
I_at_rgb_heq = hsv2rgb(im2double(I_at_hsv_heq));
figure, imshow(I_at_rgb_heq);
imwrite(I_at_rgb_heq, 'images/at_hsv_heq.png')

% Imagem 2 - França

I_fr = imread('images/ciup.jpg');
figure, imshow(I_fr);

redI_fr = I_fr(:,:,1);
greenI_fr = I_fr(:,:,2);
blueI_fr = I_fr(:,:,3);

figure, imhist(redI_fr);
redI_fr_cs = contrast_stretching(redI_fr, 0, 40, 0, 100);
figure, imhist(redI_fr_cs);
I_fr_redCS = cat(3, redI_fr_cs, greenI_fr, blueI_fr);
figure, imshow(I_fr_redCS)
imwrite(I_fr_redCS, 'images/fr_redcs.png')

figure, imhist(greenI_fr);
greenI_fr_cs = contrast_stretching(greenI_fr, 0, 40, 0, 110);
figure, imhist(greenI_fr_cs);
I_fr_greenCS = cat(3, redI_fr, greenI_fr_cs, blueI_fr);
figure, imshow(I_fr_greenCS)
imwrite(I_fr_greenCS, 'images/fr_greencs.png')

figure, imhist(blueI_fr);
blueI_fr_cs = contrast_stretching(blueI_fr, 0, 50, 0, 100);
figure, imhist(blueI_fr_cs);
I_fr_blueCS = cat(3, redI_fr, greenI_fr, blueI_fr_cs);
figure, imshow(I_fr_blueCS)
imwrite(I_fr_blueCS, 'images/fr_bluecs.png')

I_fr_allchans_cs = cat(3, redI_fr_cs, greenI_fr_cs, blueI_fr_cs);
imshow(I_fr_allchans_cs);
imwrite(I_fr_allchans_cs, 'images/fr_cs.png');

I_fr_hsv = im2uint8(rgb2hsv(I_fr));
I_fr_h = I_fr_hsv(:,:,1);
I_fr_s = I_fr_hsv(:,:,2);
I_fr_v = I_fr_hsv(:,:,3);
figure, imhist(I_fr_v);

I_fr_v_cs = contrast_stretching(I_fr_v, 0, 50, 0, 150);
figure, imhist(I_fr_v_cs);
I_fr_hsv_cs = cat(3, I_fr_h,I_fr_s,I_fr_v_cs);
I_fr_rgb_cs = hsv2rgb(im2double(I_fr_hsv_cs));
figure, imshow(I_fr_rgb_cs);
imwrite(I_fr_rgb_cs, 'images/fr_hsv_cs.png')

I_fr_v_heq = hist_eq(I_fr_v);
figure, imhist(I_fr_v_heq);
I_fr_hsv_heq = cat(3, I_fr_h,I_fr_s,I_fr_v_cs);
I_fr_rgb_heq = hsv2rgb(im2double(I_fr_hsv_heq));
figure, imshow(I_fr_rgb_heq);
imwrite(I_fr_rgb_heq, 'images/fr_hsv_heq.png')
