I=imread('university.png');
c1=70;
c2=0.3;
gama=0.4;

Idou=double(I);
r=Idou(:);

% log transformation
slog=uint8(c1*(log(1+r)));
slog=reshape(slog,size(I)); 

% power transformation
spow=c2*(r.^gama);
spow=reshape(spow,size(I));

figure
imshow(I)
figure
subplot(1,2,1)
imshow(slog)
subplot(1,2,2)
imshow(spow)

%for log function, c should be bigger so that we can see the pic. 
%for power-law function, c should be smaller so that we can see the pic.