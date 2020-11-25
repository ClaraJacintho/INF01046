cameraman_in = imread('cameraman.tif');

cameraman_out = jpeg_comp(cameraman_in);

subplot(1,2,1);
imshow(cameraman_in);
subplot(1,2,2);
imshow(cameraman_out);
 
og = im2double(cameraman_in);
[psnr_val, snr_val] = psnr_calc(cameraman_out, og);

disp(sprintf('PSNR = +%5.2f dB / SNR = %5.2f dB',psnr_val, snr_val))
