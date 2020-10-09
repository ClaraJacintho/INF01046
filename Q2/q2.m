% Parte 1 - contrast_stretching com imagens preto e branco
I_ny = imread('images/ny.png');
I_ma = imread('images/morocco.png');
imhist(I_ma)
% Parte 2 - contrast_stretching em cada canal de imagens RGB
%I_at = imread('images/hallstatt.jpg');
%I_dk = imread('images/copenhagen.jpg');