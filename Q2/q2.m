% Parte 1 - contrast_stretching com imagens preto e branco
% I_ny = imread('images/ny.png');
% I_ma = imread('images/morocco.png');
% Parte 2 - contrast_stretching em cada canal de imagens RGB
%I_at = imread('images/hallstatt.jpg');
%I_dk = imread('images/copenhagen.jpg');

A = imread('tire.tif');
figure,imshow(A)
figure,imhist(A)
B = contrast_stretching(A, 50, 150, 0.2, 2, 1, 30, 200)
figure,imhist(B)