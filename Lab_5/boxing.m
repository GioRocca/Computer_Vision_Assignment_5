function boxing(frame, ncc, template)

[rr, cc] = size(template);
point = max(max(ncc));
[y, x] = find(ncc == point);
figure, imagesc(frame), colormap gray, title('Detected Object')
hold on 
plot(x,y,'*r');
rectangle('Position',[(x-cc/2) (y-rr/2) cc rr],'EdgeColor',[1,0,0]);

end

