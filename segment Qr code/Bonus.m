function retval = Bonus (I)
  
%preprocessing
Ibrighter=I+50;
grayimage=rgb2gray(Ibrighter);
grayimage = medfilt2(grayimage);
f=[5,5];
tempimage=imsmooth(grayimage,'Average',f);

%binary inverse image
tempimage=im2bw(tempimage);
invtempimage=~tempimage;

%dilation 
se = strel('square',8);
J = imdilate(invtempimage,se);

[L N] = bwlabel(J);

boxes=regionprops(L,'BoundingBox'); 
%draw box 
count=1;
for i = 1 : length(boxes) 
    if boxes(i).BoundingBox(3)<length(I)
      if boxes(i).BoundingBox(4)>77
       QR = imcrop(I,boxes(i).BoundingBox);
       figure,imshow(QR),title(count);
       count=count+1;
      end
    end
end

endfunction
