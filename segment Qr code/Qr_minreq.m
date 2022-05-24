function [QR] = Qr_minreq (I)
  
%rotate
grayimage=rgb2gray(I);
edge_img = edge(grayimage,'canny');
[H,T,R] = hough(edge_img);
P = houghpeaks(H);
thetaPeak = T(P(2));
if thetaPeak != -90
grayimage = imrotate(grayimage,thetaPeak);
 if thetaPeak <-60
   grayimage=flipdim(grayimage);
 endif
end

%binary inverse image
tempimage=im2bw(grayimage);
invtempimage=~tempimage;
 
%dilation 
se = strel('square',8);
J = imdilate(invtempimage,se);

[L N] = bwlabel(J);
%case 3.3 handel 
if N==1
  f=[5,5];
  tempimage=imsmooth(grayimage,'Average',f);
  tempimage=im2bw(tempimage);
  L=bwlabel(tempimage);
end 

%CC= bwconncomp(L);
boxes=regionprops(L, 'BoundingBox'); 
%draw box 
for i = 1 : length(boxes) 
    if boxes(i).BoundingBox(3)<length(I) 
      A(i) = boxes(i).BoundingBox(3) * boxes(i).BoundingBox(4);  
      %rectangle('Position',box(cnt).BoundingBox,'EdgeColor','r','LineWidth',1);
    end
end
[x,y] = max(A);
QR = imcrop(grayimage,boxes(y).BoundingBox);
endfunction



