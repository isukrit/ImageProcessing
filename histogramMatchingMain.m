imageChanged = imread('Lena.bmp');
imageReference = imread('flower.tif');

imageChangedNew = histTransfer(imageChanged, imageReference);

figure, imhist(imageChanged);
figure, imhist(imageReference);
figure, imhist(imageChangedNew);

