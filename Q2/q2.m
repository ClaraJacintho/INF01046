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
%I_at = imread('images/hallstatt.jpg');
%I_dk = imread('images/copenhagen.jpg');