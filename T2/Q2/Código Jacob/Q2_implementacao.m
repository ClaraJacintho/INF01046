function Q2_implementacao()
% Função para chamar o método de quantização vetorial
% tanto para blocos 2x2 quanto para blocos 3x3 para duas imagens.

clc;
clear all;
close all;

% IMAGEM 1
% Bloco 2x2, dicionário de 256 palavras
Img = imread('westconcordorthophoto[edit].png');
quantizacao_c_kmeans(Img, 4, 256);
% Bloco 3x3, dicionário de 256 palavras
Img = imread('westconcordorthophoto[edit].png');
Img = Img(1:360, 1:360);
quantizacao_c_kmeans(Img, 9, 256);

% IMAGEM 2
% Bloco 2x2, dicionário de 256 palavras
Img = imread('liftingbody.png');
quantizacao_c_kmeans(Img, 4, 256);

% Bloco 3x3, dicionário de 256 palavras
Img = imread('liftingbody.png');
Img = Img(1:510, 1:510);
quantizacao_c_kmeans(Img, 9, 256);
