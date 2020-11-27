%
% Imagem 1 - compressão com qualidade 50
%

moon_in = imread('moon.jpg');
moon_in = rgb2gray(moon_in);

moon_out_10 = jpeg_comp(moon_in, 10);
 
og = im2double(moon_in);
[psnr_val, snr_val] = psnr_calc(moon_out_10, og);

imwrite(moon_in, 'moon_in.png')
imwrite(moon_out_10, 'moon_out_10.png')

f = figure('Name','Compressão JPEG Q: 10');
subplot(1,2,1);
imshow(moon_in);
subplot(1,2,2);
imshow(moon_out_10);

info_1 = sprintf('Q: 10 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_1, 'FontWeight','bold');

disp(info_1)

%
% Imagem 1 - compressão com qualidade 10
%

moon_out_2 = jpeg_comp(moon_in, 2);

og = im2double(moon_in);
[psnr_val, snr_val] = psnr_calc(moon_out_2, og);

imwrite(moon_out_2, 'moon_out_2.png')

f = figure('Name','Compressão JPEG Q: 2');
subplot(1,2,1);
imshow(moon_in);
subplot(1,2,2);
imshow(moon_out_2);

info_2 = sprintf('Q: 2 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_2,'FontWeight','bold');


disp(info_2)



% ARTUR !!!! 
% Imagem 2 - compressão com qualidade X
%
