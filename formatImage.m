function result =  formatImage( filename )
%Helper for tupperFormula
%Read image file and convert it into binary image then covert image
%pixels to a integer summation of the pizels so that tupperFormula could plot.
%Usage: formatImage(filename)
%input: filename
%output: integer 
result = sym(['960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014655997933798537483143786841806593422227898388722980000748404719']);

if ~isempty(filename)
    img = imread(filename);
    %export image to bitmap file
    imwrite(img, 'bitmapImg.bmp');
    imshow('bitmapImg.bmp');
       
%resize image
img = imresize(img,[17,17]);
img = rgb2gray(img);

% converts image to binary image
img = imbinarize(img);
w = size(img(1));
h = size(img(2));
oneD_bin_img = img(:)';

%converts binary number to str decimal number
str = num2str(oneD_bin_img);
str(isspace(str)) = '';
str =sprintf('text2int("%s",2)',str);
result = evalin(symengine,str);
return 
      
else
sprintf('Error please enter a valid image file name');
return
end
end