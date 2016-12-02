image= imread('flower.tif'); %take input image
imageArray = [flip(flip(image, 1), 2), flip(image, 1), flip(flip(image, 1), 2); ... 
               flip(image, 2), image, flip(image, 2); ...
               flip(flip(image, 1), 2), flip(image, 1), flip(flip(image, 1), 2)];
           
%imshow(imageArray);

rowsGridSize = 101;
colGridSize = 101;

rows = (rowsGridSize - 1)/2;
cols = (colGridSize - 1)/2;


[rImage, cImage] = size(image);
newImage = uint8(zeros(rImage, cImage));


for r = 1:rImage
    for c = 1: cImage
        grid = imageArray(rImage + r-rows -1 : rImage + r + rows - 1, cImage + c - cols - 1: cImage + c + cols - 1);
        %disp(r);
        %disp(c);
        tempImage = histeq(grid);
        newImage(r,c) = uint8(tempImage(rows+1, cols+1));
    end
    disp(r);
end

imshow(newImage);
imwrite(newImage, 'flowerModified.png');

