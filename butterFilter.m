function transformedImage = butterFilter(I, d0, n, choice)
    IFreq = fft2(double(I));
    [col, row] = size( I );
    filter1 = ones(col,row);
    filter2 = ones(col,row);
    %filter3 = ones(col,row);

    for i = 1:col
        for j =1:row
            d = i^2 + j^2;
            filter1(i,j)= 1/(1 + (d0/d)^n); % high pass, d1:higher cutoff frequency
            filter2(i,j) = 1/(1 + (d/d0)^n); % low pass, d0:lower cutoff frequency
            %butterworthf(i,j) = filter1(i,j).*filter3(i,j); % Create Butterworth filter.
        end
    end



    if choice == 0 %low pass
        transformedImage = IFreq.*filter2;
        %fftshow(filter2, 'log');
    end

    if choice == 1 %high pass
        transformedImage = IFreq.*filter1;
    end

    figure, imshow(I);
    figure, mesh(filter1);
    colormap winter;
    figure, plot(filter2);

    transformedImage = ifft2(transformedImage);
    transformedImage = uint8(transformedImage);
    figure, imshow(real(transformedImage));