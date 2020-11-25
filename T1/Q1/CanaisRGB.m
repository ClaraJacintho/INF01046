function i = CanaisRGB(image)
img = image;
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
a = zeros(size(img, 1), size(img, 2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);
i = figure; subplot(2,2,1), imshow(img),
title('Original image')
subplot(2,2,2), imshow(just_red), title('Red channel'),
subplot(2,2,3), imshow(just_green),
title('Green channel')
subplot(2,2,4) , imshow(just_blue),
title('Blue channel')
return;
end
