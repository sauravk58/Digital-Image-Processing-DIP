% Created on 10/01/25
% Created by Saurav kumar, BT22ECE110
% First Practical to convert Color image to Grayscale.

clc;
clear;
close all;

% Load the image from file
input_image = imread("images.jpg");

% Get image dimensions
[img_rows, img_cols, img_channels] = size(input_image);
disp(['Image dimensions: ', num2str(img_rows), ' x ', num2str(img_cols)]);

% Display the intensity of a specific pixel or use a fallback if out of bounds
if img_rows >= 1010 && img_cols >= 505
    disp(['Pixel value at (1010, 505): ', num2str(input_image(1010, 505))]);
else
    center_row = round(img_rows / 2);
    center_col = round(img_cols / 2);
    disp(['Center pixel value at (', num2str(center_row), ', ', num2str(center_col), '): ', num2str(input_image(center_row, center_col))]);
end

% Convert to grayscale using the red channel only
gray_red_channel = input_image(:, :, 1);

% Convert to grayscale using average method
red_component = input_image(:, :, 1);
green_component = input_image(:, :, 2);
blue_component = input_image(:, :, 3);
gray_avg_method = round((red_component + green_component + blue_component) / 3);

% Convert to grayscale using the luminosity method
gray_luminosity_method = round(0.299 * red_component + 0.587 * green_component + 0.114 * blue_component);

% Create an image highlighting the red channel
red_filtered_image = input_image;
red_filtered_image(:, :, 2) = 0;
red_filtered_image(:, :, 3) = 0;

% Create an image highlighting the green channel
green_filtered_image = input_image;
green_filtered_image(:, :, 1) = 0;
green_filtered_image(:, :, 3) = 0;

% Create an image highlighting the blue channel
blue_filtered_image = input_image;
blue_filtered_image(:, :, 1) = 0;
blue_filtered_image(:, :, 2) = 0;

% Display original image and grayscale versions
figure(1);
subplot(2, 2, 1), imshow(input_image); xlabel("Original Image");
subplot(2, 2, 2), imshow(gray_red_channel); xlabel("Grayscale (Red Channel)");
subplot(2, 2, 3), imshow(gray_avg_method); xlabel("Grayscale (Average Method)");
subplot(2, 2, 4), imshow(gray_luminosity_method); xlabel("Grayscale (Luminosity Method)");

% Display original image and color-filtered versions
figure(2);
subplot(2, 2, 1), imshow(input_image); xlabel("Original Image");
subplot(2, 2, 2), imshow(red_filtered_image); xlabel("Red-Filtered Image");
subplot(2, 2, 3), imshow(green_filtered_image); xlabel("Green-Filtered Image");
subplot(2, 2, 4), imshow(blue_filtered_image); xlabel("Blue-Filtered Image");
