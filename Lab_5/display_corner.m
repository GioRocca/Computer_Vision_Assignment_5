function  display_corner(corner, image)

prop = regionprops(logical(corner), 'basic');
n = size([prop.Area].');
figure, imagesc(image), colormap gray, title('Detected Corners');
for i = 1:n
    xc=floor(prop(i).Centroid(1));
    yc=floor(prop(i).Centroid(2));
    hold on
    plot(xc,yc,'*r')
end
end

