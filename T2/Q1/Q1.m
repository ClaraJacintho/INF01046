%
% Imagem 1 - compressão com qualidade 50
%

cameraman_in = imread('cameraman.tif');

cameraman_out_50 = jpeg_comp(cameraman_in, 50);
 
og = im2double(cameraman_in);
[psnr_val, snr_val] = psnr_calc(cameraman_out_50, og);

% figure, imshow(cameraman_in);
% figure, imshow(cameraman_out_50);

f = figure('Name','Compressão JPEG Q: 50');
subplot(1,2,1);
imshow(cameraman_in);
subplot(1,2,2);
imshow(cameraman_out_50);

info_1 = sprintf('Q: 50 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_1, 'FontWeight','bold');

disp(info_1)

%
% Imagem 1 - compressão com qualidade 80
%

cameraman_out_80 = jpeg_comp(cameraman_in, 80);

og = im2double(cameraman_in);
[psnr_val, snr_val] = psnr_calc(cameraman_out_80, og);

% figure, imshow(cameraman_out_80);

f = figure('Name','Compressão JPEG Q: 80');
subplot(1,2,1);
imshow(cameraman_in);
subplot(1,2,2);
imshow(cameraman_out_80);

info_2 = sprintf('Q: 80 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_2,'FontWeight','bold');


disp(info_2)



% ARTUR !!!! 
% Imagem 2 - compressão com qualidade X
%
