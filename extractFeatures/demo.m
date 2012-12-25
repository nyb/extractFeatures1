% Demo for function mexFeatures 
% Function:
% data = mexFeatures (root_folder, image_list, image_id, param, wght, )
% root foler: root path for these images, only need store the relative path
% image_list: image file name list
% image_id:   assign an image id for each image in the list, will use it for matching purpose
% parameters: [1] paramters for color feature extraction
%             [2-4]: color feature options: 1.HSV color histogram; 2.HSV 3D color histogram 
%             3.RGB Color moment 4.Lab color moment
%             for color histogram: number of bins for 2D/3D histogram, note as hb, sb, vb; 
%             for color moment: number of x/y grid, param[3] is undefined in this case;  
%     param[5]- size of Gabor filter mask, default 64; 
%     param[6]- number of scale of Gabor filter, default 5;
%     param[7]- number of orientation of Gabor filter, default 8;  
%     param[8]- control the sample rate for global representation, unused for Gabor moment, default 8;
%								param[9-12] GIST option
%     param[9]-  number of GIST scale 4
%     param[10]- filter mask size is 256
%     param[11]- number of block to extract moment 4
%     param[12]- fc for preprocessing, filter the image
% wght:       the weight to balance the contribution for each component, color, edge, Gabor, LBP and GIST,
%             the coefficient is manually assigned, roughly 1, 1, 1, 20, 7. The optimization of these coefficients is 
%			  			knownn as "ensemble learning".

% data:       feature matrix with size of (total number images) x (feature length) 
% You may select some features rather than all five features in the library. Range for 
% each feature component in an feature vector are defined as follows:
% colorDim = 3*3*9; // range 1:81, 3x3 color moment:
% edgeDim  = 36+1;  // range 82:118
% gaborDim = scale*ori*3; // range: 119:238
% lbpDim   = 59;    // range 239:297
% gistDim  = nbf*gist_nb*gist_nb; // range: 298:end
% Here a simple example on the usage
    
Folder = 'c:\img';   % image input folder
Iname = dir([Folder '\*.jpg']);
% set the parameters
param = [3 3 3 0 64 5 8 8 4 256 4 4];
wght = [1 1 1 20 7];
% Simple example, only extract two images
J{1} = Iname(1).name; 
J{2} = Iname(2).name; 
% run extraction
%data = mexFeatures( Folder, J, 1:2, param, wght );
data = mexFeatures( Folder, J, 1:2, param, wght );
%normalization, zero mean, substract mean
[N,dim] = size(data);
D_mean = mean(data);
data = data - (ones(N,1)*D_mean);

%normalization, unit variance
D_norm = diag(1./sqrt(diag(data*data')))*data;