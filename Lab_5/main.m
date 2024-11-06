frame1 = imread('Lab5_testimages\ur_c_s_03a_01_L_0376.png');
frame2 = imread('Lab5_testimages\ur_c_s_03a_01_L_0377.png');
frame3 = imread('Lab5_testimages\ur_c_s_03a_01_L_0378.png');
frame4 = imread('Lab5_testimages\ur_c_s_03a_01_L_0379.png');
frame5 = imread('Lab5_testimages\ur_c_s_03a_01_L_0380.png');
frame6 = imread('Lab5_testimages\ur_c_s_03a_01_L_0381.png');

frame1 = rgb2gray(frame1);
frame2 = rgb2gray(frame2);
frame3 = rgb2gray(frame3);
frame4 = rgb2gray(frame4);
frame5 = rgb2gray(frame5);
frame6 = rgb2gray(frame6);

%create the template for the red car
red_car_template = frame1(360:426,690:769);
figure, imagesc(red_car_template), colormap gray, title('Red Car Template');

%applying normal cross correlation for red car
red_ncc_1 = normxcorr2e(red_car_template, frame1, 'same');
red_ncc_2 = normxcorr2e(red_car_template, frame2, 'same');
red_ncc_3 = normxcorr2e(red_car_template, frame3, 'same');
red_ncc_4 = normxcorr2e(red_car_template, frame4, 'same');
red_ncc_5 = normxcorr2e(red_car_template, frame5, 'same');
red_ncc_6 = normxcorr2e(red_car_template, frame6, 'same');
figure, imagesc(red_ncc_1), colormap gray;

%create the template for the gray car
gray_car_template = frame1(372:412, 560:643);
figure, imagesc(gray_car_template), colormap gray, title('Dark Car Template');

%create a smaller template for the gray car
gray_car_template_small = frame1(382:402, 580:623);
figure, imagesc(gray_car_template_small), colormap gray, title('Small Dark Car Template');

%create a larger template for the gray car
gray_car_template_large = frame1(362:422, 540:663);
figure, imagesc(gray_car_template_large), colormap gray, title('Large Dark Car Template');

%applying normal cross correlation for gray car
gray_ncc_1 = normxcorr2e(gray_car_template, frame1, 'same');
gray_ncc_2 = normxcorr2e(gray_car_template, frame2, 'same');
gray_ncc_3 = normxcorr2e(gray_car_template, frame3, 'same');
gray_ncc_4 = normxcorr2e(gray_car_template, frame4, 'same');
gray_ncc_5 = normxcorr2e(gray_car_template, frame5, 'same');
gray_ncc_6 = normxcorr2e(gray_car_template, frame6, 'same');
figure, imagesc(gray_ncc_1), colormap gray;

%applying normal cross correlation for gray car(small template)
gray_ncc_1_small = normxcorr2e(gray_car_template_small, frame1, 'same');
gray_ncc_2_small = normxcorr2e(gray_car_template_small, frame2, 'same');
gray_ncc_3_small = normxcorr2e(gray_car_template_small, frame3, 'same');
gray_ncc_4_small = normxcorr2e(gray_car_template_small, frame4, 'same');
gray_ncc_5_small = normxcorr2e(gray_car_template_small, frame5, 'same');
gray_ncc_6_small = normxcorr2e(gray_car_template_small, frame6, 'same');

%applying normal cross correlation for gray car(large template)
gray_ncc_1_large = normxcorr2e(gray_car_template_large, frame1, 'same');
gray_ncc_2_large = normxcorr2e(gray_car_template_large, frame2, 'same');
gray_ncc_3_large = normxcorr2e(gray_car_template_large, frame3, 'same');
gray_ncc_4_large = normxcorr2e(gray_car_template_large, frame4, 'same');
gray_ncc_5_large = normxcorr2e(gray_car_template_large, frame5, 'same');
gray_ncc_6_large = normxcorr2e(gray_car_template_large, frame6, 'same');

%boxing the red car
boxing(frame1, red_ncc_1, red_car_template);
boxing(frame2, red_ncc_2, red_car_template);
boxing(frame3, red_ncc_3, red_car_template);
boxing(frame4, red_ncc_4, red_car_template);
boxing(frame5, red_ncc_5, red_car_template);
boxing(frame6, red_ncc_6, red_car_template);

%boxing the gray car
boxing(frame1, gray_ncc_1, gray_car_template);
boxing(frame2, gray_ncc_2, gray_car_template);
boxing(frame3, gray_ncc_3, gray_car_template);
boxing(frame4, gray_ncc_4, gray_car_template);
boxing(frame5, gray_ncc_5, gray_car_template);
boxing(frame6, gray_ncc_6, gray_car_template);

%boxing the gray car (small template)
boxing(frame1, gray_ncc_1_small, gray_car_template_small);
boxing(frame2, gray_ncc_2_small, gray_car_template_small);
boxing(frame3, gray_ncc_3_small, gray_car_template_small);
boxing(frame4, gray_ncc_4_small, gray_car_template_small);
boxing(frame5, gray_ncc_5_small, gray_car_template_small);
boxing(frame6, gray_ncc_6_small, gray_car_template_small);

%boxing the gray car (large template)
boxing(frame1, gray_ncc_1_large, gray_car_template_large);
boxing(frame2, gray_ncc_2_large, gray_car_template_large);
boxing(frame3, gray_ncc_3_large, gray_car_template_large);
boxing(frame4, gray_ncc_4_large, gray_car_template_large);
boxing(frame5, gray_ncc_5_large, gray_car_template_large);
boxing(frame6, gray_ncc_6_large, gray_car_template_large);



%% corner detection
image = imread('Lab5_testimages\i235.png', 'png');
[Ix2, Iy2, Ixy, I] = derivatives(image);

%Gaussian-filter
gaussian_filter = fspecial('gaussian', 9, 1.2);
figure,imagesc(gaussian_filter),colormap gray,title('Gaussian-filter');

Sx2=conv2(Ix2,gaussian_filter,'same'); Sy2=conv2(Iy2,gaussian_filter,'same'); Sxy=conv2(Ixy,gaussian_filter,'same');

%Compute and display R map and corner region
corner_region = corner_detection(Sx2, Sxy, Sy2, I);

%Display corners on the original image
display_corner (corner_region, image);


