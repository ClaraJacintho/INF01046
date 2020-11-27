function [psnr_val, snr_val] = psnr_calc(modified_image, original_image)
% PSNR_CALC calcula o psnr e o snr para comparação de imagens
%
% modified_image   -- imagem com ruido, modificada
% original_image   -- imagem original
%
% retorna os valores de PSNR e SNR

snr_val =  10*log10(double(std2(original_image)^2/std2(original_image-modified_image)^2));

mse = mean(mean((original_image-modified_image).^2));
psnr_val = 10*log10(1/mse);
