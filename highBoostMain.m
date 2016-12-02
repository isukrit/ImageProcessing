I = imread('Lena.tif');
A = 1.9;
newI = highBoost(I, A);
imshow(newI);