			Feature Extraction Library FELib LICENSE

This software is freely available for non-commercial use such as research and education. 
Please see the full disclaimer below. 

We recommand you cite the reference given below in your publications related to this work.

Feature extraction for image retrieval:

Jianke Zhu, Steven C.H. Hoi, Michael R. Lyu and Shuicheng Yan,"Near-Duplicate Keyframe 
Retrieval by Nonrigid Image Matching," ACM Multimedia'2008.

Feature extraction for face recognition:

Jianke Zhu, Steven C.H. Hoi and Michael R. Lyu,"Face Annotation by Transductive Kernel Fisher
Discriminant," IEEE Trans. on Multimedia, vol. 10, pp. 86-96. 2008.

Copyright (c) 2003-2009 Jianke Zhu.  Email:jianke.zhu at gmail.com
http://www.vision.ee.ethz.ch/~zhuji

3RD PART SOFTWARE

The software is partly based on the following libraries:

  - The Intel(tm) OpenCV Library
 
DISCLAIMER

This software is provided 'as-is', without any express or implied warranty.
In no event will the author be held liable for any damages arising from the
use of this software.

Permission is granted to anyone to use this software for any non-commercial 
purpose, and to alter it, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim
   that you wrote the original software. 

2. Altered source versions must be plainly marked as such, and must not be 
   misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.

--

No guarantees of performance accompany this software, nor is any 
responsibility assumed on the part of the author.

This software is provided by Jianke Zhu ``as is'' and any express or implied
warranties, including, but not limited to, the implied warranties of merchan-
tability and fitness for a particular purpose are disclaimed. In no event shall  
Jianke Zhu be liable for any direct, indirect, incidental, special, exemplary,
or consequential damages (including, but not limited to, procurement of substitute
goods or services; loss of use, data, or profits; or business interruption) however 
caused and on any theory of liability, whether in contract, strict liability, 
or tort (including negligence or otherwise) arising in any way out of the use 
of this software, even if advised of the possibility of such damage.


$Revision: 1.2 $ 
$Date: 2008/12/31 $ 

Change log:
v1.2 
Correct lots of errors in the comiple instructions with help from zim 
<shazhang at student.cityu.edu.hk>.
Add compile.m to facilitate a successful compilation
Instruction on nomalizing the vector to zero mean and unit variance. This is important
to obtain good retrieval results on a large collection of the diverse images.
v1.1
Add GIST feature

About the software
This software extracts the four kinds of features, 
1. Color histogram, color moments

2. Edge histogram

3. Gabor wavelets transform

4. Local Binary Pattern

5. GIST


For technical details of the FELib, please refer to the following publication,

Jianke Zhu, Steven C.H. Hoi, Michael R. Lyu and Shuicheng Yan, ¡°Near-Duplicate Keyframe 
Retrieval by Nonrigid Image Matching,¡± ACM Multimedia'2008.

This toolbox is also used in the following publications:

Steven C.H. Hoi, Rong Jin, Jianke Zhu, and Michael R. Lyu, "Semi-Supervised SVM Batch Mode
Active Learning with Applications to Image Retrieval," To appear in ACM Transactions on 
Information Systems (TOIS), 2009.

Steven C.H. Hoi, Rong Jin, Jianke Zhu, and Michael R. Lyu, "Semi-Supervised SVM Batch Mode 
Active Learning for Image Retrieval," In Proceedings of IEEE Conference on Computer Vision 
and Pattern Recognition (CVPR2008), Alaska, 24-26 June, 2008. 

Jianke Zhu, Steven C.H. Hoi and Michael R. Lyu,"Face Annotation by Transductive Kernel Fisher
Discriminant," IEEE Trans. on Multimedia, vol. 10, pp. 86-96. 2008.

Install Guide

A. Install OpenCV

1. Install the OpenCV library: Download opencv from http://sourceforge.net/projects/opencvlibrary,
  this release support OpenCV 1.0 (Oct. 2006).

2a.Windows Platform 
  Add <OpenCV install dir>\lib into MSVC library search path, and <OpenCV install dir>\cxcore\include,
 <OpenCV install dir>\cv\include, <OpenCV install dir>\otherlib\highgui into MSVC include search path,
 add <OpenCV install dir>\bin into the system path of windows.

2b.Linux
 Refer to OpenCV FAQ

2c.MAC OSX 10.5
 Refer to the guide in the following link:
 http://opencvlibrary.sourceforge.net/Mac_OS_X_OpenCV_Port
 
**********************************Important Note***************************************************************

To compile it as a stand alone program, you need comment the first line in main.c

#define MATLAB_API

To obtain a Matlab MEX or .dll, you need ensure the definition of MATLAB_API 

Also, comment following macro definition to compile under Linux/Mac OSX  

#define WIN32

**********************************End Note*********************************************************************

B. Windows with MSVC compiler:
You can open the prject file of MSVC8.0 directly, and build the project. If using prevoius MSVC version, follow
the following steps: 
1. Create a new project 
2. Setup a new empty VC++ console project
3. Add the attached main.c into the project
4. Add cv.lib cxcore.lib highgui.lib (debug version cvd.lib cxcored.lib highguid.lib) into the additional library dependency of link tab
5. Build the project.

C. Compile on Linux and Mac OSX
It is very easy, just use following command:
//extract features in Mac OSX
gcc -o extractFeatures -I./include -I/opt/local/include/opencv -L.  -L/opt/local/lib -llapack -lblas -lcxcore -lcv -lhighgui -lfe.0.1 main.c

//extract features in Ubuntu Linux (Remember to copy 'libfe-lin.0.1.so' into the fold '\usr\lib' or dynamic library searching path, do ldconfig )
gcc -o extractFeatures -I./include -I/usr/include/opencv -L.  -L/opt/local/lib -llapack -lblas -lcxcore -lcv -lhighgui -lfe-lin.0.1 main.c

//Example:
./extractFeatures data

//extract Gabor features in Mac OSX
gcc -o extractGabor -I./include -I/opt/local/include/opencv -L.  -L/opt/local/lib -llapack -lblas -lcxcore -lcv -lhighgui -lfe.0.1 extractGabor.c 

//extract Gabor features in Ubuntu Linux (Remember to copy 'libfe-lin.0.1.so' into the fold '\usr\lib' or dynamic library searching path )
gcc -o extractGabor -I./include -I/usr/include/opencv -L.  -L/opt/local/lib -llapack -lblas -lcxcore -lcv -lhighgui -lfe-lin.0.1 extractGabor.c

//Example:
./extractGabor data

D. Matlab

Win:

% change the mex compiler to VC8. Using LCC, you will get following compiling error 
% "\cxtypes.h: 300  compiler error in _kids--Bad rule number 0". Thanks zim.
mex -setup

mex -output mexFeatures -I. -I.\include -IC:\OpenCV\cv\include -IC:\OpenCV\cxcore\include -IC:\OpenCV\otherlibs\highgui -LC:\OpenCV\lib... 
-L. -lcxcore -lcv -lhighgui -lfelib main.c 

Linux/ MAC OSX:

mex -output mexFeatures -I. -I./include -I/opt/local/include/opencv -L/opt/local/lib -L. -lcxcore -lcv -lhighgui -lfe-lin.0.1 main.c 

Usage of the library:
For console command:
	extractFeatures file_list.txt
	
For matlab,

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
% Here a simple example on the usage
    
Folder = 'd:\data\images';  % image input folder
Iname = dir([Folder '\*.jpg']);
% set the parameters
param = [3 3 3 0 64 5 8 8 4 256 4 4];
wght = [1 1 1 20 7];
% Simple example, only extract two images
J{1} = Iname(1).name; 
J{2} = Iname(2).name; 
% run extraction
data = mexFeatures( Folder, J, 1:2, param, wght );

E: Normalization

Note normalization is essential to obtaining the good results on a large collection. We suggest
to use the following code to normalize the feature vector in C:

void normalizeVector( double* v, int vSize) 
{      
	double  a, sqsum = 0.0;
	double  mean = MeanVector( v, vSize);
	double* ptr = v;
	int i;
     
    for(i=0;i<vSize;i++) {

        (*ptr)  -= mean; 
        sqsum += (*ptr)*(*ptr);
		ptr++;
    }
	if(sqsum<1e-4) sqsum = 1.0;
    a = 1.0f/(double)(sqrt(sqsum));
	ptr = v;
    for(i=0;i<vSize;i++) {

        (*ptr) *= a;
		ptr++;
    }    
}

Matlab:

%normalization, zero mean, substract mean
[N,dim] = size(data);
D_mean = mean(data);
data = data - (ones(N,1)*D_mean);

%normalization, unit variance
D_norm = diag(1./sqrt(diag(data*data')))*data;

F: You may select some features rather than all five features in the library. Range for 
each feature component in an feature vector are defined as follows:

3x3 color moment:
colorDim = 3*3*9; // range 1:81 
edgeDim  = 36+1;  // range 82:118
gaborDim = scale*ori*3; // range: 119:238
lbpDim   = 59;    // range 239:297
gistDim  = nbf*gist_nb*gist_nb; // range: 298:end


G: Following distance functions are implemented in this library, you can call the 
function using C code. A matlab wrapper will be released in future version:

L1 Norm:
	FELIB_API double calcuAbsDist(double* va, double* vb, int n);
	
L2 Norm:
	FELIB_API double calcuNorm(double* va, double* vb, int n);

Chi Square distance: 
	FELIB_API double calcuChiDist(double* va, double* vb, int n);
	FELIB_API double calcuChiDistFast(double* va, double Na, double* vb, double Nb, int n);

FAQ:

1. How to load the extracted features in C/C++
   Open the extracted data in binary, then use this function go load the data into a double array:
   
   double* getData(FILE* fh, int *m, int *n )
   
2. 1. How to load the extracted features in Matlab
   Using the provided "readbin.m" to load the binary format file. e.g. 
   
   A = readbin('data.bin');  

Bug reports are welcome! 
Email to:jianke.zhu at gmail.com

Acknowledgement:
Steven C.H. Hoi <CHHoi at ntu.edu.sg>
zim <shazhang at student.cityu.edu.hk>
Hao Ma <hma at cse.cuhk.edu.hk>

