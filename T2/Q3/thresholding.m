function [out] = thresholding(rgbImage, ratioRed, ratioGreen, ratioBlue)

% Extrai os canais RGB individualmente
channelRed = rgbImage(:, :, 1);
channelGreen = rgbImage(:, :, 2);
channelBlue = rgbImage(:, :, 3);

% Vetor com os maiores e menores valores de cada coluna de cada canal de cor
maxRed = max(channelRed(:));
minRed = min(channelRed(:));

maxGreen = max(channelGreen(:));
minGreen = min(channelGreen(:));

maxBlue = max(channelBlue(:));
minBlue = min(channelBlue(:));

%   Define o treshold de acordo com os parametros recebidos pela funcao:
% Min + Peso*(Amplitute) para cada canal.

thresholdRed =  minRed + ratioRed*(maxRed - minRed);
thresholdGreen =  minGreen + ratioGreen*(maxGreen - minGreen);
thresholdBlue =  minGreen + ratioBlue*(maxBlue - minBlue);

%   Atribui valores binarios a cada pixel se seus valores alcancam algum
% threshold.

binaryRed = channelRed  > thresholdRed;
binaryGreen = channelGreen  > thresholdGreen;
binaryBlue = channelBlue  > thresholdBlue;

% Faz um 'or' dos canais binarios para formar uma imagem final binaria
segmented = binaryRed;
segmented = segmented + binaryGreen;
segmented = segmented + binaryBlue;
out = segmented;
