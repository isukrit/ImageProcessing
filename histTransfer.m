function NewImage = histTransfer2(imageChanged, imageReference)
    [countsReference, binLocationsReference] = imhist(imageReference);
    [numBins, ~] = size(binLocationsReference);
    Mapping = zeros(numBins, 1, 'uint8');
    cdfReference = getImageCDF(imageReference, numBins);
    cdfChanged = getImageCDF(imageChanged, numBins);

    for i = 1:numBins
        [~, index] = min(abs(cdfChanged(i) - cdfReference));
        Mapping(i) = index - 1;
    end

    NewImage = Mapping(double(imageChanged) + 1);