function out = corner_detection(Sx2, Sxy, Sy2, I)

%features detection
[rr,cc]=size(Sx2);
edge_reg=zeros(rr,cc); corner_reg=zeros(rr,cc); flat_reg=zeros(rr,cc);
R_map=zeros(rr,cc);
k=0.05;

for ii=1:rr
    for jj=1:cc
        %define at each pixel x,y the matrix
        Matrix=[Sx2(ii,jj),Sxy(ii,jj);Sxy(ii,jj),Sy2(ii,jj)];
        %compute the response of the detector at each pixel
        R=det(Matrix) - k*(trace(Matrix).^2);
        R_map(ii,jj)=R;
        M = max(max(R_map));
        %threshold on value of R
        threshold = 0.3 * M;
        if R<-threshold
            edge_reg(ii,jj)=1;
        elseif R>threshold
            corner_reg(ii,jj)=1;
        else
            flat_reg(ii,jj)=1;
        end
    end
    
    

end
figure,imagesc(R_map),colormap gray,title('R map');    
figure,imagesc(corner_reg.*I),colormap gray,title('corner regions');

out = corner_reg;
end

