function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 12-Jul-2023 00:37:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%--------------------------------------------------------------------------

function pushbutton27_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
rotate=imrotate(a,45);
axes(handles.axes3);
imshow(rotate);



function pushbutton29_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
rz=imresize(a,0.1);
axes(handles.axes3); 
imshow(rz)



function pushbutton33_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper',0.1);
axes(handles.axes3); 
imshow(noise)


function pushbutton34_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noise=imnoise(a,'gaussian');
axes(handles.axes3); 
imshow(noise)


function pushbutton39_Callback(hObject, eventdata, handles)
i=getappdata(0,'a');
i2=flipdim(i,2);
axes(handles.axes3); 
imshow(i2)


function pushbutton12_Callback(hObject, eventdata, handles)
msgbox('Thanks For Using Image Processing Tool')
pause(2)
close();
close();



function pushbutton13_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
imshow(a);            % Reset code



function pushbutton14_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_bw=im2bw(a);
axes(handles.axes3);
imshow(a_bw)
setappdata(0,'filename',a_bw);



function pushbutton15_Callback(hObject, eventdata, handles)
a=uigetfile({'*.*';'*.tif';'*.png';'*.jbg';'*.bmb';'*.gif';'*.svg';'*.psd';'*.raw'});
a=imread(a);
axes(handles.axes1);
imshow(a)
setappdata(0,'a',a)



function box_Callback(hObject, eventdata, handles)

set(handles.eee,'enable','on');



function box_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function slider4_Callback(hObject, eventdata, handles)
s=get(handles.slider4,'value');
a=getappdata(0,'a');
adjust=imadjust(a,[0;s],[]);
axes(handles.axes3); 
imshow(adjust);
guidata(hObject,handles);



function slider4_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function listbox1_Callback(hObject, eventdata, handles)

set(handles.www,'enable','on');



function listbox1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function www_Callback(hObject, eventdata, handles)

h=get(handles.listbox1,'value');
switch h
    case 1
       
a=getappdata(0,'a');
input=rgb2gray(a);
axes(handles.axes3)
imhist(input)
set(handles.www,'enable','off');
    case 2
 
a=getappdata(0,'a');
blue=a;
blue(:,:,1)=0;
blue(:,:,2)=0;
setappdata(0,'filename',blue);
setappdata(0,'imrotation',blue);
axes(handles.axes3);
imshow(blue)
set(handles.www,'enable','off');
    case 3    
       
a=getappdata(0,'a');
green=a;
green(:,:,1)=0;
green(:,:,3)=0;
setappdata(0,'filename',green);
setappdata(0,'imrotation',green);
axes(handles.axes3);
imshow(green)
set(handles.www,'enable','off');
    case 4
       
a=getappdata(0,'a');
red=a;
red(:,:,2:3)=0;
setappdata(0,'filename',red);
setappdata(0,'imrotation',red);
axes(handles.axes3);
imshow(red)
set(handles.www,'enable','off');
 case 5
 a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

set(handles.www,'enable','off');
    case 6
       a=getappdata(0,'a');
h= fspecial('motion',50,40);
filterredRGB= imfilter(a,h);
axes(handles.axes3)
imshow(filterredRGB)
set(handles.www,'enable','off');
    case 7
        a=getappdata(0,'a');
I=rgb2gray(a)
ed2= edge(I,'prewitt');
axes(handles.axes3); 
imshow(ed2);
set(handles.www,'enable','off');
    case 8
        a=getappdata(0,'a');
        I=rgb2gray(a)
eq=histeq(I);
axes(handles.axes3); 
imshow(eq)
set(handles.www,'enable','off');

    case 9
   a=getappdata(0,'a');
   I=rgb2gray(a)
noise=imnoise(I,'salt & pepper');
a3=fspecial('average',[7,7]);
t_sp_a3=filter2(a3,noise);
axes(handles.axes3); 
imshow(t_sp_a3/255)
set(handles.www,'enable','off');
end



function pushbutton46_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes3);
imshow(IM2);


function popupmenu4_Callback(hObject, eventdata, handles)

set(handles.eee,'enable','on');


function popupmenu4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



function eee_Callback(hObject, eventdata, handles)

h=get(handles.popupmenu4,'value');
switch h
    case 1
       
a=getappdata(0,'a');
input=a;
axes(handles.axes3)
imhist(input)
set(handles.eee,'enable','off');
    case 2
 
a=getappdata(0,'a');
eq=histeq(a);
axes(handles.axes3); 
imshow(eq)
set(handles.eee,'enable','off');

    case 3    
       
a=getappdata(0,'a');
s=size(a);
[x,y]=meshgrid(1:s(1),1:s(2));
p=sin(x/3+y/5)+1;
noise=(im2double(a)+p/2)/2;
axes(handles.axes3); 
imshow(noise)
set(handles.eee,'enable','off');
    case 4
       
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper');
a3=fspecial('average',[7,7]);
t_sp_a3=filter2(a3,noise);
axes(handles.axes3); 
imshow(t_sp_a3/255)
set(handles.eee,'enable','off');
case 5
 
a=getappdata(0,'a');
ed1= edge(a,'Sobel');
ed2= edge(a,'prewitt');           %Combine Two Image
axes(handles.axes3); 
imshowpair(ed1,ed2,'montage')
set(handles.eee,'enable','off');
 case 6
       
a=getappdata(0,'a');
h= fspecial('motion',50,40);
filterredRGB= imfilter(a,h);
axes(handles.axes3)
imshow(filterredRGB)
set(handles.eee,'enable','off');

end


function slider11_Callback(hObject, eventdata, handles)
x=get(handles.slider11,'value');
a=getappdata(0,'a');
t=imsharpen(a,'Radius',2*x,'Amount',4);
axes(handles.axes3); 
imshow(t)



function slider11_CreateFcn(hObject, eventdata, handles)


if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider12_Callback(hObject, eventdata, handles)
s=get(handles.slider4,'value');
a=getappdata(0,'a');
adjust=imadjust(a,[0;s],[]);
axes(handles.axes3); 
imshow(adjust)



function slider12_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider13_Callback(hObject, eventdata, handles)
A=get(handles.slider13,'value');
a=getappdata(0,'a');
adjust=imadjust(a,[0;A],[]);
axes(handles.axes3); 
imshow(adjust)




function slider13_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% 
function slider15_Callback(hObject, eventdata, handles)
s=get(handles.slider15,'value');
a=getappdata(0,'a');
adjust=imadjust(a,[2*s;0],[]);
axes(handles.axes3); 
imshow(adjust)



function slider15_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider16_Callback(hObject, eventdata, handles)
s=get(handles.slider16,'value');
a=getappdata(0,'a');
adjust=imadjust(a,[0;s],[]);
axes(handles.axes3); 
imshow(adjust)


function slider16_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitoggletool3_ClickedCallback(hObject, eventdata, handles)

[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 handles.myImage = strcat(pathname, filename);
 info=imfinfo(handles.myImage);
 filesize1=info.FileSize(1,1);
w=info.Width(1,1);
h=info.Height(1,1);
 set(handles.edit14,'string',filename);
 set(handles.edit15,'string',filesize1);
 set(handles.edit16,'string',h);
 set(handles.edit17,'string',w);
 % save the updated handles object
 guidata(hObject,handles);




function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
cla reset
axes(handles.axes1);
cla reset
set(handles.edit14,'string','');
 set(handles.edit15,'string','');
 set(handles.edit16,'string','');
 set(handles.edit17,'string','');


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)

cla reset


function Untitled_11_Callback(hObject, eventdata, handles)
set(handles.edit14,'string','');
 set(handles.edit15,'string','');
 set(handles.edit16,'string','');
 set(handles.edit17,'string','');




function slider17_Callback(hObject, eventdata, handles)
s=get(handles.slider17,'value');
a=getappdata(0,'a');
gamma= 10;
rr=(s)*(a.^1);
axes(handles.axes3); 
imshow(rr)
guidata(hObject,handles);


function slider17_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider19_Callback(hObject, eventdata, handles)
s=get(handles.slider19,'value');
a=getappdata(0,'a');
x=a+150*s;
axes(handles.axes3); 
imshow(x)



function slider19_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider21_Callback(hObject, eventdata, handles)
s=get(handles.slider21,'value');
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper',s);
axes(handles.axes3); 
imshow(noise)



function slider21_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function pushbutton78_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
f1= fspecial('average');
i = imfilter(a,f1);
axes(handles.axes3);
imshow(i);


function pushbutton75_Callback(hObject, eventdata, handles)
a = getappdata(0, 'a');
if (size(a, 3) == 3)
    a = rgb2gray(a);
end
a = im2double(a);
FI = fft2(a);
[M, N] = size(a);
u = 0:M-1;
v = 0:N-1;
index = find(u > M/2);
u(index) = u(index) - M;
indy = find(v > N/2);
v(indy) = v(indy) - N;
[U, V] = meshgrid(u, v);
D = sqrt(U.^2 + V.^2);
DO = 30;
H = double(D <= DO);
n = 2; % Adjust the order of the Butterworth filter
cutoff_freq = 10; % Adjust the cutoff frequency for the desired sharpening effect
butterworth = 1 ./ (1 + (D ./ cutoff_freq).^(2*n)); % Butterworth filter
H = H + (1 - H) .* butterworth; % Sharpening using Butterworth filter
G = H .* FI;
RG = ifft2(G);
axes(handles.axes3);
imshow((fftshift(H)));



function pushbutton76_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a = im2double(a);
FI = fft2(a);      %Fourir transform of input Image
[M, N] = size(a);  %M-Number of rows  ///N=Number of columns
u = 0:M-1;
v = 0:N-1;
index = find(u>M/2);
u(index) = u(index) - M;
indy = find(v>N/2);
v(indy) = v(indy) - N;
[U, V] = meshgrid(u, v);
D = sqrt(U.^2 + V.^2);     %Euclidean distance
DO = 30;
H = double(D<=DO);
H = 1 - H;
axes(handles.axes3);
imshow((fftshift(H)));


function pushbutton77_Callback(hObject, eventdata, handles)
a = getappdata(0, 'a');
if (size(a, 3) == 3)
    a = rgb2gray(a);
end
a = im2double(a);
FI = fft2(a);
[M, N] = size(a);
u = 0:M-1;
v = 0:N-1;
index = find(u > M/2);
u(index) = u(index) - M;
indy = find(v > N/2);
v(indy) = v(indy) - N;
[U, V] = meshgrid(u, v);
D = sqrt(U.^2 + V.^2);
DO = 30;
H = double(D <= DO);
sigma = 10; % Adjust the sigma value for the desired sharpening effect
gaussian = exp(-(D.^2) / (2 * sigma^2)); % Gaussian filter
H = H + (1 - H) .* gaussian; % Sharpening using Gaussian filter
G = H .* FI;
RG = ifft2(G);
axes(handles.axes4);
imshow((fftshift(H)));



function pushbutton71_Callback(hObject, eventdata, handles)
a = getappdata(0, 'a');
if (size(a, 3) == 3)
    a = rgb2gray(a);
end
a = im2double(a);
FI = fft2(a);
[M, N] = size(a);
u = 0:M-1;
v = 0:N-1;
index = find(u > M/2);
u(index) = u(index) - M;
indy = find(v > N/2);
v(indy) = v(indy) - N;
[U, V] = meshgrid(u, v);
D = sqrt(U.^2 + V.^2);
D0 = 30;
sigma = 10; % Adjust the sigma value for the desired smoothing effect
H = exp(-(D.^2) / (2 * sigma^2)); % Gaussian filter
G = H .* FI;
RG = ifft2(G);
axes(handles.axes3);
imshow((fftshift(H)));



function pushbutton72_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)   % ideal filter
        a=rgb2gray(a);
end
a=im2double (a);
FI=fft2(a);
[M, N]=size(a);
u=0:M-1;
v=0:N-1;
index=find(u>M/2);
u(index)=u(index)-M;
indy=find(v>N/2);
v(indy)=v(indy)-N;
[U, V]= meshgrid(u, v) ;
D=sqrt(U.^2+V.^2);
D0=30;
H=double(D<=D0);
axes(handles.axes3);
imshow((fftshift (H)));



function pushbutton73_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)    %ideal lowpass in smoothing
        a=rgb2gray(a);
end
[M, N] = size (a);
FT_img = fft2(a);   %fourir transfer
D0 = 30;
u=0:(M-1);
v=0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V , U] = meshgrid(v, u);
D =sqrt(U.^2 +V.^2);
H = double( D <= D0);
G = H.*FT_img;
output_image =real(ifft2(double(G)));
axes(handles.axes3);
imshow((output_image),[ ]);




function pushbutton65_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
t10=zeros(256,256,10);
for i=1:10
    t10(:,:,i)=imnoise(a,'gaussian');
    tmean=mean(t10,3);
end
axes(handles.axes3);
imshow(uint8 (tmean));


function pushbutton66_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
n1 = imnoise(a,'gaussian',0,0.005);
f = wiener2(n1,[7 7]);
axes(handles.axes3);
imshow(f);

function pushbutton68_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a_noise = imnoise(a,'speckle');
H = fspecial('average');
O1 = imfilter(a_noise,H);
O2 = medfilt2(a_noise);
O3 = wiener2(a_noise);
axes(handles.axes3);
imshow(O1);


function pushbutton69_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a_noise = imnoise(a,'speckle');
H = fspecial('average');
O1 = imfilter(a_noise,H);
O2 = medfilt2(a_noise);
O3 = wiener2(a_noise);
axes(handles.axes3);
imshow(O2);

function pushbutton70_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
n1 = imnoise(a,'gaussian',0,0.005);
f = wiener2(n1,[7 7]);
axes(handles.axes3);
imshow(f);


function pushbutton67_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a_noise = imnoise(a,'speckle');
H = fspecial('average');
O1 = imfilter(a_noise,H);
O2 = medfilt2(a_noise);
O3 = wiener2(a_noise);    %remove noise from image as gaussian noise, salt and pepper or random noise
axes(handles.axes3);
imshow(O3);


function pushbutton79_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
mask=1/16*[1 2 1;2 4 2;1 2 1];
enhanced = filter2(mask,noisy_image/256);
axes(handles.axes3);
imshow(noisy_image);



function pushbutton80_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
mask=1/16*[1 2 1;2 4 2;1 2 1];
enhanced = filter2(mask,noisy_image/256);
axes(handles.axes3);
imshow(enhanced);


function pushbutton81_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'same');
axes(handles.axes3);
imshow(noisy_image);


function pushbutton82_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'same');
axes(handles.axes3);
imshow(enhanced);


function pushbutton83_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'valid');
axes(handles.axes3);
imshow(noisy_image);


function pushbutton84_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'valid');
axes(handles.axes3);
imshow(enhanced);


function pushbutton86_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'full');
axes(handles.axes3);
imshow(enhanced);


function pushbutton85_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average',[5,5]);
enhanced = filter2(h,noisy_image/256, 'full');
axes(handles.axes3);
imshow(noisy_image);


function pushbutton87_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average');
enhanced = filter2(h,noisy_image/256);
axes(handles.axes3);
imshow(enhanced);


function pushbutton88_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noisy_image = imnoise(a,'salt & pepper');
h= fspecial('average');
enhanced = filter2(h,noisy_image/256);
axes(handles.axes3);
imshow(noisy_image);


function pushbutton59_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
D = imresize(a ,[150 150]);
axes(handles.axes3);
imshow (D)



function pushbutton58_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
C = imresize(a,2);
axes(handles.axes3);
imshow (C)



function pushbutton93_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
med = medfilt2(noisy_image,[5,5]);
axes(handles.axes3);
imshow(med);

function pushbutton94_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
med = medfilt2(noisy_image,[5,5]);
axes(handles.axes3);
imshow(noisy_image);


function pushbutton89_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
maximg = ordfilt2(noisy_image,9,ones(3,3));
axes(handles.axes3);
imshow(noisy_image);


function pushbutton90_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
maximg = ordfilt2(noisy_image,9,ones(3,3));
axes(handles.axes3);
imshow(maximg);



function pushbutton91_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
minimg = ordfilt2(noisy_image,1,ones(3,3));
axes(handles.axes3);
imshow(noisy_image);


function pushbutton92_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
noisy_image = imnoise(a,'salt & pepper');
minimg = ordfilt2(noisy_image,1,ones(3,3));
axes(handles.axes3);
imshow(minimg);


function radiobutton6_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
c1 = imadd (a,128);
axes(handles.axes3);
imshow(c1);


function radiobutton5_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
c2 =imsubtract(a,128);
axes(handles.axes3);
imshow(c2);



function radiobutton7_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
c3 = immultiply (a,2);
axes(handles.axes3);
imshow(c3);


function radiobutton8_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
c4 = imdivide (a,2);
axes(handles.axes3);
imshow(c4);


function radiobutton9_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
c5 = imcomplement(a);
axes(handles.axes3);
imshow(c5);


function radiobutton10_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
h = fspecial('laplacian');
img = imfilter(a,h);
axes(handles.axes3);
imshow(img);


function radiobutton11_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
h = fspecial('laplacian');
img = imfilter(a,h);
sharped=a+img;
axes(handles.axes3);
imshow(sharped);


function radiobutton13_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a = im2double (a);
b = fft2(a);   %fourir transform
c = fftshift (b);
d_S = abs(c);
e = ifft2 (b); %inferse form frequency to spatial
axes(handles.axes3);
imshow(log(1+d_S),[]);


function radiobutton12_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
a = im2double (a);
b = fft2(a);
c = fftshift (b); %put details in middle
d_S = abs(c);
e = ifft2 (b); %inferse form frequency to spatial
axes(handles.axes3);
imshow(real(e));


function pushbutton96_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
if (size(a,3)== 3)
        a=rgb2gray(a);
end
v = imresize(a,0.5);
axes(handles.axes4);
imshow (v)
