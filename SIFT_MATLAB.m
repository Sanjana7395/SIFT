%Display the matrix at each step so that you can get an idea of what is
%happening with each operation, it will be easier to understand
clear all;
clc;
tic
img=imread('7.gif');
figure(1);
subplot(2,5,1);
imshow(img);
img=im2double(img);%image converted to double format 
[imgrow,imgcol]=size(img);%Gives the dimensions of the image
%disp([imgrow,imgcol]);
%Guassian filters
g1=fspecial('gaussian',[3,3],0.5);%sigma=0.5
g2=fspecial('gaussian',[3,3],1.0);%sigma=1
g3=fspecial('gaussian',[3,3],1.5);%sigma=1.5
g4=fspecial('gaussian',[3,3],2.0);%sigma=2
%generation of LUTs
luta1=[];%initializing the LUTs by considering empty vectors
lutb1=[];
luta2=[];
lutb2=[];
luta3=[];
lutb3=[];
luta4=[];
lutb4=[];
%When you display each Guassian fiter generated above you will obtain a
%matrix, by converting the 2-D matrix into 1-D matrix you will obtain a and
%b values(Refer one of the papers)
for z=0:255
    a1=z*0.7869;%a and b values by converting 2-D matrix into 1-D matrix
    b1=z*0.1063;
    luta1=[luta1,a1];%As ma'am had explained earlier,the LUTs are generated for each Gaussian filter
    lutb1=[lutb1,b1];
    a2=z*0.4519;
    b2=z*0.2740;
    luta2=[luta2,a2];
    lutb2=[lutb2,b2];
    a3=z*0.3844;
    b3=z*0.3077;
    luta3=[luta3,a3];
    lutb3=[lutb3,b3];
    a4=z*0.3617;
    b4=z*0.3192;
    luta4=[luta4,a4];
    lutb4=[lutb4,b4];
end
%Scale space generation-As explained by ma'am
scalespace1=[];
for i=1:imgrow-2
    f1=[];
    for j=1:imgcol-2
        c1=img(i,j)+img(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb1(1,round(c1+1));
        d1=img(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta1(1,round(d1+1));
        e1=c1i+d1i;
        c2=img(i+1,j)+img(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb1(1,round(c2+1));
        d2=img(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta1(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta1(1,round(e2+1));
        c3=img(i+2,j)+img(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb1(1,round(c3+1));
        d3=img(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta1(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb1(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace1=[scalespace1;f1];
end
scalespace2=[];%Same thing is repeated in oder to generate various scalespaces by considering different LUTs(or Guassian filter)
for i=1:imgrow-2
    f1=[];
    for j=1:imgcol-2
        c1=img(i,j)+img(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb2(1,round(c1+1));
        d1=img(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta2(1,round(d1+1));
        e1=c1i+d1i;
        c2=img(i+1,j)+img(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb2(1,round(c2+1));
        d2=img(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta2(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta2(1,round(e2+1));
        c3=img(i+2,j)+img(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb2(1,round(c3+1));
        d3=img(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta2(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb2(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace2=[scalespace2;f1];
end
scalespace3=[];
for i=1:imgrow-2
    f1=[];
    for j=1:imgcol-2
        c1=img(i,j)+img(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb3(1,round(c1+1));
        d1=img(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta3(1,round(d1+1));
        e1=c1i+d1i;
        c2=img(i+1,j)+img(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb3(1,round(c2+1));
        d2=img(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta3(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta3(1,round(e2+1));
        c3=img(i+2,j)+img(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb3(1,round(c3+1));
        d3=img(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta3(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb3(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace3=[scalespace3;f1];
end
scalespace4=[];
for i=1:imgrow-2
    f1=[];
    for j=1:imgcol-2
        c1=img(i,j)+img(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb4(1,round(c1+1));
        d1=img(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta4(1,round(d1+1));
        e1=c1i+d1i;
        c2=img(i+1,j)+img(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb4(1,round(c2+1));
        d2=img(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta4(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta4(1,round(e2+1));
        c3=img(i+2,j)+img(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb4(1,round(c3+1));
        d3=img(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta4(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb4(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace4=[scalespace4;f1];
end
subplot(2,5,2);
imshow(scalespace1);
subplot(2,5,3);
imshow(scalespace2);
subplot(2,5,4);
imshow(scalespace3);
subplot(2,5,5);
imshow(scalespace4);
%Difference of Guassian
DoS1=scalespace2-scalespace1;
DoS2=scalespace3-scalespace2;
DoS3=scalespace4-scalespace3;
figure(2);
subplot(2,3,1)
imshow(uint8(255*mat2gray(DoS1)));
subplot(2,3,2)
imshow(uint8(255*mat2gray(DoS2)));
subplot(2,3,3)
imshow(uint8(255*mat2gray(DoS3)));
toc
disp('time taken for scale space generation of 1st octave');
disp(toc);
tic
%Downsampling the image
img1=imresize(img,[256,256]);
figure(1);
subplot(2,5,6);
imshow(img1);
img1=im2double(img1);
[img1row,img1col]=size(img1);
%disp([img1row,img1col]);
%Scale space generation
scalespace5=[];
for i=1:img1row-2
    f1=[];
    for j=1:img1col-2
        c1=img1(i,j)+img1(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb1(1,round(c1+1));
        d1=img1(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta1(1,round(d1+1));
        e1=c1i+d1i;
        c2=img1(i+1,j)+img1(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb1(1,round(c2+1));
        d2=img1(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta1(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta1(1,round(e2+1));
        c3=img1(i+2,j)+img1(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb1(1,round(c3+1));
        d3=img1(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta1(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb1(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace5=[scalespace5;f1];
end
scalespace6=[];
for i=1:img1row-2
    f1=[];
    for j=1:img1col-2
        c1=img1(i,j)+img1(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb2(1,round(c1+1));
        d1=img1(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta2(1,round(d1+1));
        e1=c1i+d1i;
        c2=img1(i+1,j)+img1(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb2(1,round(c2+1));
        d2=img1(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta2(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta2(1,round(e2+1));
        c3=img1(i+2,j)+img1(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb2(1,round(c3+1));
        d3=img1(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta2(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb2(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace6=[scalespace6;f1];
end
scalespace7=[];
for i=1:img1row-2
    f1=[];
    for j=1:img1col-2
        c1=img1(i,j)+img1(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb3(1,round(c1+1));
        d1=img1(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta3(1,round(d1+1));
        e1=c1i+d1i;
        c2=img1(i+1,j)+img1(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb3(1,round(c2+1));
        d2=img1(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta3(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta3(1,round(e2+1));
        c3=img1(i+2,j)+img1(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb3(1,round(c3+1));
        d3=img1(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta3(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb3(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace7=[scalespace7;f1];
end
scalespace8=[];
for i=1:img1row-2
    f1=[];
    for j=1:img1col-2
        c1=img1(i,j)+img1(i,j+2);
        if c1>255
            c1=255;
        end
        c1i=lutb4(1,round(c1+1));
        d1=img1(i,j+1);
        if d1>255
            d1=255;
        end
        d1i=luta4(1,round(d1+1));
        e1=c1i+d1i;
        c2=img1(i+1,j)+img1(i+1,j+2);
        if c2>255
            c2=255;
        end
        c2i=lutb4(1,round(c2+1));
        d2=img1(i+1,j+1);
        if d2>255
            d2=255;
        end
        d2i=luta4(1,round(d2+1));
        e2=c2i+d2i;
        if e2>255
            e2=255;
        end
        e2i=luta4(1,round(e2+1));
        c3=img1(i+2,j)+img1(i+2,j+2);
        if c3>255
            c3=255;
        end
        c3i=lutb4(1,round(c3+1));
        d3=img1(i+2,j+1);
        if d3>255
            d3=255;
        end
        d3i=luta4(1,round(d3+1));
        e3=c3i+d3i;
        e4=e1+e3;
        if e4>255
            e4=255;
        end
        e4i=lutb4(1,round(e4+1));
        f=e2i+e4i;
        f1=[f1,f];
   end
    scalespace8=[scalespace8;f1];
end
subplot(2,5,7);
imshow(scalespace5);
subplot(2,5,8);
imshow(scalespace6);
subplot(2,5,9);
imshow(scalespace7);
subplot(2,5,10);
imshow(scalespace8);
%Difference of Guassian
DoS4=scalespace6-scalespace5;
DoS5=scalespace7-scalespace6;
DoS6=scalespace8-scalespace7;
figure(2);
subplot(2,3,4);
imshow(uint8(255*mat2gray(DoS4)));
subplot(2,3,5)
imshow(uint8(255*mat2gray(DoS5)));
subplot(2,3,6)
imshow(uint8(255*mat2gray(DoS6)));
toc
disp('time taken for scale space generation of 2nd octave');
disp(toc);
tic
%Local extrema detection
DoS={DoS1,DoS2,DoS3;DoS4,DoS5,DoS6};%Generated a cell where each cell represents one octave
 for i=1:2%represents octaves
     %represents centre scale of each octave
     % Obtain the matrices where to look for the extrema
     level=cell2mat(DoS(i,2));%centre scale of an octave
     up=cell2mat(DoS(i,3));%upper scale of an octave
     down=cell2mat(DoS(i,1));%lower scale of an octave
     [ssrow,sscol]=size(level);
     %disp(level);%dimensions of the scale
     %I have commented the entire low contrast and edge response section
     %bcoz once I execute this the entire extrema matrix will become 0.Try
     %working out on this part too. And edge response I found the code on
     %net as I couldn't think of a way to write the code for
     %differentiation part
      %low contrast point
      for a=1:ssrow
         for b=1:sscol
           contrast_threshold=0.03;
           if(abs(level(a,b))<contrast_threshold)
              level(a,b)=0;
           end
         end
      end
      %edge response
      [Hxx,Hyy,Hxy,Hyx]=deal(zeros(ssrow,sscol));
      Hxx(2:ssrow-1,1:end) = diff(level,2,1);
      Hyy(1:end,2:sscol-1) = diff(level,2,2);
      tmp = diff(diff(level,1,1),1,2);    
      Hxy(2:ssrow-1,2:sscol-1) = tmp(2:end,2:end);
      tmp = diff(diff(level,1,2),1,1);    
      Hyx(2:ssrow-1,2:sscol-1) = tmp(2:end,2:end);
      trace=Hxx+Hyy;
      det=(Hxx*Hyy)+(Hxy*Hyx);
      ratio=(trace*trace)/det;
      edge_threshold=10;
      if(abs(ratio)>edge_threshold)
         level(a,b)=0;
     end
 
      extrema=[];
      for k=1:ssrow-2
         exmat=[];
         for l=1:sscol-2
             %Detection of local maxima
             %consider a 3x3 window
             %comparing the middle pixel with the neighbouring 8 pixels
             localmax=(level(k+1,l+1)>level(k,l))&&(level(k+1,l+1)>level(k,l+1))&&(level(k+1,l+1)>level(k,l+2))&&(level(k+1,l+1)>level(k+1,l))&&(level(k+1,l+1)>level(k+1,l+2))&&(level(k+1,l+1)>level(k+2,l))&&(level(k+1,l+1)>level(k+2,l+1))&&(level(k+1,l+1)>level(k+2,l+2));
             %comparing the middle pixel of centre scale with the 9 pixels
             %of 3x3 window of the above scale
             localmax=localmax&&(level(k+1,l+1)>up(k,l))&&(level(k+1,l+1)>up(k,l+1))&&(level(k+1,l+1)>up(k,l+2))&&(level(k+1,l+1)>up(k+1,l))&&(level(k+1,l+1)>up(k+1,l+2))&&(level(k+1,l+1)>up(k+2,l))&&(level(k+1,l+1)>up(k+2,l+1))&&(level(k+1,l+1)>up(k+2,l+2))&&(level(k+1,l+1)>up(k+1,l+1));
             %comparing the middle pixel of centre scale with the 9 pixels
             %of 3x3 window of the above scale
             localmax=localmax&&(level(k+1,l+1)>down(k,l))&&(level(k+1,l+1)>down(k,l+1))&&(level(k+1,l+1)>down(k,l+2))&&(level(k+1,l+1)>down(k+1,l))&&(level(k+1,l+1)>down(k+1,l+2))&&(level(k+1,l+1)>down(k+2,l))&&(level(k+1,l+1)>down(k+2,l+1))&&(level(k+1,l+1)>down(k+2,l+2))&&(level(k+1,l+1)>down(k+1,l+1));
        
             %Detection of local minima
             localmin=(level(k+1,l+1)<level(k,l))&&(level(k+1,l+1)<level(k,l+1))&&(level(k+1,l+1)<level(k,l+2))&&(level(k+1,l+1)<level(k+1,l))&&(level(k+1,l+1)<level(k+1,l+2))&&(level(k+1,l+1)<level(k+2,l))&&(level(k+1,l+1)<level(k+2,l+1))&&(level(k+1,l+1)<level(k+2,l+2));
             localmin=localmin&&(level(k+1,l+1)<up(k,l))&&(level(k+1,l+1)<up(k,l+1))&&(level(k+1,l+1)<up(k,l+2))&&(level(k+1,l+1)<up(k+1,l))&&(level(k+1,l+1)<up(k+1,l+2))&&(level(k+1,l+1)<up(k+2,l))&&(level(k+1,l+1)<up(k+2,l+1))&&(level(k+1,l+1)<up(k+2,l+2))&&(level(k+1,l+1)<up(k+1,l+1));
             localmin=localmin&&(level(k+1,l+1)<down(k,l))&&(level(k+1,l+1)<down(k,l+1))&&(level(k+1,l+1)<down(k,l+2))&&(level(k+1,l+1)<down(k+1,l))&&(level(k+1,l+1)<down(k+1,l+2))&&(level(k+1,l+1)<down(k+2,l))&&(level(k+1,l+1)<down(k+2,l+1))&&(level(k+1,l+1)<down(k+2,l+2))&&(level(k+1,l+1)<down(k+1,l+1));
             ext=localmax|localmin;
             exmat=[exmat,ext]; %a row of the extrema matrix
                                
         end
         extrema=[extrema;exmat];%appending a row with the previously obtained row in order to form an entire extrema matrix
      end
     %disp(extrema);
     toc
     disp('time taken to generate scale invariant keypoints');
     disp(toc);
     %tic
     %calculating magnitude and direction
     for a=2:ssrow-1
       for b=2:sscol-1
           mag(a,b)=sqrt(((level(a+1,b)-level(a-1,b))^2)+((level(a,b+1)-level(a,b-1))^2));%magnitude for each pixel in the entire image 
           ori(a,b)=atan2((level(a,b+1)-level(a,b-1)),(level(a+1,b)-level(a-1,b)))*(180/pi);%orientation for each pixel in the entire image
       end
     end
 
     [m,n]=find(extrema);
     %determines the positions where there are ones(ie either local maxima or local minima)
     disp([m,n]);
     r=length(m);
     %disp(r);
     for u=1:r
         v=m(u,1);
         w=n(u,1);
         
     %disp(m(2,1));%In the image that I have considered I get only 2 points for first octave image and 4 for second octave image
     p=mag(v-8:v+7,w-8:w+7);%considering the magnitudes of the neighbouring pixels of the extrema points 
     q=ori(v-8:v+7,w-8:w+7);%considering the orientation of the neighbouring pixels of the extrema points 
     [winrow,wincol]=size(p);
     %disp(p);
     magcount1=0;
     magcount2=0;
     magcount3=0;
     magcount4=0;
     magcount5=0;
     magcount6=0;
     magcount7=0;
     magcount8=0;
     ori1=0;
     ori2=0;
     ori3=0;
     ori4=0;
     ori5=0;
     ori6=0;
     ori7=0;
     ori8=0;
     for c=1:winrow
       for d=1:wincol
        if (q(c,d)>=0&&q(c,d)<45)
              magcount1=magcount1+p(c,d);
              ori1=(0+45)/2;
        elseif (q(c,d)>=45&&q(c,d)<90)
              magcount2=magcount2+p(c,d);
              ori2=(45+90)/2;
        elseif (q(c,d)>=90&&q(c,d)<135)
              magcount3=magcount3+p(c,d);
              ori3=(90+135)/2;
        elseif (q(c,d)>=135&&q(c,d)<180)
              magcount4=magcount4+p(c,d);
              ori4=(135+180)/2;
        elseif (q(c,d)>=180&&q(c,d)<225)
              magcount5=magcount5+p(c,d);
              ori5=(180+225)/2;
        elseif (q(c,d)>=225&&q(c,d)<270)
              magcount6=magcount6+p(c,d);
              ori6=(225+270)/2;
        elseif (q(c,d)>=270&&q(c,d)<315)
              magcount7=magcount7+p(c,d);
              ori7=(270+315)/2;
        else
              magcount8=magcount8+p(c,d);
              ori8=(315+360)/2;
        end
       end
     end
     magcounts=[magcount1,magcount2,magcount3,magcount4,magcount5,magcount6,magcount7,magcount8];
     oris=[ori1,ori2,ori3,ori4,ori5,ori6,ori7,ori8];
     disp(magcounts);
     disp(oris);
     maxmag=max(magcounts);
     maxstore=[];
     oristore=[];
     for z=1:length(magcounts)
        if magcounts(z)>=0.8*maxmag
         % [x1,y1]=find(magcounts(z));
          maxstore=[maxstore,magcounts(z)];
          %it displays only the values of one extrema point rather than generating 6(2+4) of them
          %Maybe only last (m,n) value is being display so i thought
          %addition of a for loop to consider each (m,n) value might solve
          %the problem
          oristore=[oristore,oris(z)];
          
        end
     end 
     disp(maxstore);
     disp(oristore);
     %toc
     %disp('time taken to generate rotation invariant keypoints');
     %disp(toc);
     tic
     %feature descriptor
    
     dmagstock=[];
     for c1=1:4:winrow
        for d1=1:4:wincol
     dmagcount1=0;
     dmagcount2=0;
     dmagcount3=0;
     dmagcount4=0;
     dmagcount5=0;
     dmagcount6=0;
     dmagcount7=0;
     dmagcount8=0;
            for s=0:3
              for g=0:3
                if (q(c1+s,d1+g)>0&&q(c1+s,d1+g)<45)
                    dmagcount1=dmagcount1+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>45&&q(c1+s,d1+g)<90)
                    dmagcount2=dmagcount2+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>90&&q(c1+s,d1+g)<135)
                    dmagcount3=dmagcount3+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>135&&q(c1+s,d1+g)<180)
                    dmagcount4=dmagcount4+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>180&&q(c1+s,d1+g)<225)
                     magcount5=dmagcount5+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>225&&q(c1+s,d1+g)<270)
                    dmagcount6=dmagcount6+p(c1+s,d1+g);
                elseif (q(c1+s,d1+g)>270&&q(c1+s,d1+g)<315)
                    dmagcount7=dmagcount7+p(c1+s,d1+g);
                else
                    dmagcount8=dmagcount8+p(c1+s,d1+g);
                end
              end
            end
            dmagcounts=[dmagcount1,dmagcount2,dmagcount3,dmagcount4,dmagcount5,dmagcount6,dmagcount7,dmagcount8];
            dmagstock=[dmagstock,dmagcounts]; 
              
        end
     end 
     disp('The feature descriptor vector');
     disp(dmagstock);
     end
 end
     
     
 toc
 disp('time taken to generate keypoint descriptors');
 disp(toc);
 %As the output we need to get 6 vectors each having 128 elements
 %I'm not very sure if only 6 extreme points are sufficient so maybe you
 %guys can work out on getting more if possible
 
 
 
 
 


