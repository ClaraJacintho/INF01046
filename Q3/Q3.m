% K-means

% Primeira Imagem
 firstImage = imread('pears.png');
segmentedFirstImage = kmeans_2(firstImage,5,10);

 figure, subplot(1,2,1);
 imshow(firstImage);
 title('Original Pears');

 
 subplot(1,2,2);
 imshow(segmentedFirstImage);
 title('K-means Cluster Segmentation Pears');

% Segunda Imagem
secondImage = imread('peppers.png');
segmentedSecondImage = kmeans_2(secondImage,5,10);

figure, subplot(1,2,1);
imshow(secondImage);
title('Original Peppers');

subplot(1,2,2);
imshow(segmentedSecondImage);
title('K-means Cluster Segmentation Peppers');


% Thresholding

% Primeira Imagem
firstImage = imread('dogongrass.png');
segmentedFirstImage = thresholding(firstImage, 0.5, 0.7, 0.5);

figure, subplot(1,2,1);
imshow(firstImage);
title('Original Dog');

subplot(1,2,2);
imshow(segmentedFirstImage);
title('Thresholding Dog');


% Segunda Imagem

secondImage = imread('football.jpg');
segmentedSecondImage = thresholding(secondImage, 0.35, 0.35, 0.5);

figure, subplot(1,2,1);
imshow(secondImage);
title('Original Football');

subplot(1,2,2);
imshow(segmentedSecondImage);
title('Thresholding Football');
