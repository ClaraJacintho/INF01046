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



%
% Imagem 2 - compressão com qualidade 25
%

airplane_in = imread('airplane.jpg');
airplane_gray = rgb2gray(airplane_in);

airplane_out_25 = jpeg_comp(airplane_gray, 25);
 
og = im2double(airplane_gray);
[psnr_val, snr_val] = psnr_calc(airplane_out_25, og);

imwrite(airplane_gray, 'airplane_gray.png')
imwrite(airplane_out_25, 'airplane_out_10.png')

f = figure('Name','Compressão JPEG Q: 25');
subplot(1,2,1);
imshow(airplane_gray);
subplot(1,2,2);
imshow(airplane_out_25);

info_3 = sprintf('Q: 25 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_3, 'FontWeight','bold');

disp(info_3)


%
% Imagem 2 - compressão com qualidade 5
%

airplane_out_5 = jpeg_comp(airplane_gray, 5);
 
og = im2double(airplane_gray);
[psnr_val, snr_val] = psnr_calc(airplane_out_5, og);

imwrite(airplane_gray, 'airplane_gray.png')
imwrite(airplane_out_5, 'airplane_out_5.png')

f = figure('Name','Compressão JPEG Q: 5');
subplot(1,2,1);
imshow(airplane_gray);
subplot(1,2,2);
imshow(airplane_out_5);

info_4 = sprintf('Q: 5 \n PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val);
title(info_4, 'FontWeight','bold');

disp(info_4)