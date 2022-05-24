function retval = Test_minreq ()
%read all images
I11=imread('1.1.bmp');
I21=imread('2.1.bmp');
I31=imread('3.1.bmp');
I33=imread('3.3.bmp');
I41=imread('4.1.bmp');
I44=imread('4.4.bmp');


%run all cases 
QR11=Qr_minreq (I11);
QR21=Qr_minreq (I21);
QR31=Qr_minreq (I31);
QR33=Qr_minreq (I33);
QR41=Qr_minreq (I41);
QR44=Qr_minreq (I44);



%view result
figure,imshow(QR11),title('1.1');
figure,imshow(QR21),title('2.1');
figure,imshow(QR31),title('3.1');
figure,imshow(QR33),title('3.3');
figure,imshow(QR41),title('4.1');
figure,imshow(QR44),title('4.4');
endfunction
