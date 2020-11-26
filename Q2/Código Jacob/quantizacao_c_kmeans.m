%% Usando kmeans para achar o dicionário na
%% compressão por quantização vetorial
% entrada:-> imagem em tons de cinza
%--------------------------------------------------
clc;
clear all;
close all;
tic;
%--------------------------------------------------
% Parâmetros de entrada L, K
L = 64; % Tamanho do bloco,
		% bloco deve ser quadrado 4=2x2, 16=4x4, 64=8x8 (sugerido L=4)
K = 128;% Tamanho do dicionário (sugerido K=16)
%--------------------------------------------------
% Lê a imagem de entrada
Img = imread('cameraman.tiff');
Img2D_rows = size(Img, 1);
Img2D_cols = size(Img, 2);
figure, imshow(Img)
title('Imagem de entrada')
%--------------------------------------------------
%% Computa o kmeans para achar o dicionário
r1 = floor(rem(Img2D_rows, sqrt(L)))); % Resto da divisão das linhas pelo tam. do
									   % bloco
r2 = floor(rem(Img2D_cols, sqrt(L)))); % Resto da divisão das colunas pelo tam.
									   % do bloco
Img1 = zeros(Img2D_rows+r1, Img2D_cols+r2) % Imagem com tamanho
										   % adequado para reconstruir
%--------------------------------------------------
% Monta a imagem
Img1(1:Img2D_rows; 1:Img2D_cols) = Img;
if r1~=0
	Pad_rows = Img(end, :);
	for j=1 : r1
		Pad_rows(j, :) = Pad_rows(1, :); % 1 linha a mais
	end
	Img1(1:Img2D_rows, 1:Img2D_cols) = Img;
	Img1(Img2D_rows+1:end, 1:Img2D_cols) = Pad_rows;
end
if r1~=0 && r2~=0
	Pad_cols = Img1(:, Img2D_cols);
	for j=1 : r2
		Pad_cols(:, j) = Pad_cols(:, 1); % 1 coluna a mais (1 linha já foi
										 % adicionada
	end
	Img1(1:end, Img2D_cols+1:end) = Pad_cols;
elseif r2~=0
	Pad_cols = Img(:, Img2D_cols);
	for j=1 : sqrt(L)-r2
		Pad_cols(:, j) = Pad_cols(:, 1); % 1 coluna a mais
	end
	Img1(1:Img2D_rows, 1:Img2D_cols) = Img;
	
	Img1(1:Img2D_rows, Img2D_cols+1:end) = Pad_cols;
end
%--------------------------------------------------
% Prepara os dados e chama o algoritmo do kmeans
I_re = Kmeans_Pre_Post(Img1, L, K);

%--------------------------------------------------
% Mostra o resultado da quantização vetorial com o kmeans
% para a imagem de entrada
I_re = uint8(I_re);
figure, imshow(I_re);
title('Imagem comprimida por quantização vetorial (kmeans)')
%--------------------------------------------------
% Mostra a área de memória ocupada pelas imagens de entrada e saída
fprintf('Tamanho da memória da imagem de entrada = %d bytes', numel(Img));
disp('');
fprintf('Tamanho da memória da imagem de saída = %d bytes', K*L+numel(Img1)/L);
disp('');
%--------------------------------------------------
% Mostra a taxa de compressão: bits entrada x bits saída
fprintf('Taxa de compressão (bits de entrada x bits de saída): %.2f x %d',
		 double(numel(Img))/double(K*L+numel(Img1)/L),1);
disp('');
%--------------------------------------------------
% Mostra o SNR e o PSNR
SNR = 10*log10(std2(double(Img))^2/std2(double(Img)-double(I_re))^2);

I_max = max(max(double(Img)));
I_min = min(min(double(Img)));
A = (I_max - I_min);
PSNR = 10*log10((A^2)/(std2(double(Img)-double(I_re))^2));

fprintf('SNR = %.2f (dB)', SNR);
disp('');
fprintf('PSNR - %.2f (dB)', PSNR);
disp('');
%--------------------------------------------------
toc;
