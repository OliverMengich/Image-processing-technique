a = imread('Screenshot_20190820-121317.png');
%imtool(a);
b = imcrop(a,[77 179 653 679]);
%imtool(b)

%subplot(2,2,1) , imshow(b);
red = b(:,:,1); green = b(:,:,2); blue = b(:,:,3); 
%figure
%subplot(2,2,1),imshow(red); subplot(2,2,2),imshow(green);
%subplot(2,2,3),imshow(blue);
%d = impixel(b);
out=red >240 & green>229 & green< 255 & blue>18 & blue < 123;
%imshow(out)
%  Now to fill the dark/ holes in the out image Above
out2 = imfill(out,'holes');
%imshow(out2);
%now to errod. Remove the pixels at the corners
out3 = bwmorph(out2,'erode');
%imshow(out3)
% Now to increase thr number of pixels at the corner to get a better image
out3 = bwmorph(out2,'dilate',2);
%imshow(out3)
out4 = imfill(out3,'holes');
imshow(out4);
% Now to find the properties of the block
stats = regionprops(out4)