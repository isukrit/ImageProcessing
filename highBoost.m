function outImage =  highBoost(I, A)
	Mask1 = [0, -1, 0; -1, A+4, -1; 0, -1, 0];
	Mask2 = [0, -1, 0; -1, A+4, -1; 0, -1, 0];
	%Mask3 = [0, -1, 0; -1, A+4, -1; 0, -1, 0];
	outImage = imfilter(I, Mask1, 'conv');    