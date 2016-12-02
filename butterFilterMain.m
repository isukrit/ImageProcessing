I = imread('Lena.tif');
d0 = 10000;
choice = 0;
n = 5;
newImage = butterFilter(I, d0, n, choice);
