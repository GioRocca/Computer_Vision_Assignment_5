function [Ix2, Iy2, Ixy, I] = derivatives(image)

I=double(image);
figure,imagesc(I),colormap gray

%compute x and y derivative of the image
dx=[1 0 -1; 2 0 -2; 1 0 -1];
dy=[1 2 1; 0  0  0; -1 -2 -1];
Ix=conv2(I,dx,'same');
Iy=conv2(I,dy,'same');
figure,imagesc(Ix),colormap gray,title('Ix')
figure,imagesc(Iy),colormap gray,title('Iy')

Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

end

