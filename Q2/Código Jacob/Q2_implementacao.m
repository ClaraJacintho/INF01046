function Q2_implementacao()
% Função para chamar o método de quantização vetorial
% tanto para blocos 2x2 quanto para blocos 3x3 para duas imagens.

% IMAGEM 1
% Bloco 2x2, dicionário de 256 palavras
quantizacao_c_kmeans('moon.tif', 4, 256);
% Bloco 3x3, dicionário de 256 palavras
quantizacao_c_kmeans('moon.tif', 9, 256);

% IMAGEM 2
% Bloco 2x2, dicionário de 256 palavras
quantizacao_c_kmeans('concordorthophoto.png', 4, 256);
% Bloco 3x3, dicionário de 256 palavras
quantizacao_c_kmeans('concordorthophoto.png', 9, 256);
