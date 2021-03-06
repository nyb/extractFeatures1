/*
Feature Extraction FELib LICENSE

This software is freely available for non-commercial use such as research and education. 
Please see the full disclaimer below. 

We recommand you cite the reference given below in your publications related to this work.. 

Jianke Zhu, Steven C.H. Hoi, Michael R. Lyu and Shuicheng Yan, ��Near-Duplicate Keyframe 
Retrieval by Nonrigid Image Matching,�� ACM Multimedia'2008.

	
Copyright (c) 2003-2008 Jianke Zhu.  Email:jkzhu@cse.cuhk.edu.hk

http://www.cse.cuhk.edu.hk/~jkzhu


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


$Revision: 1.1 $ 
$Date: 2008/08/20 $ 
*/
#ifndef __EXTRACTFEATURE_INC__ 
#define __EXTRACTFEATURE_INC__   
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cv.h"
#include "cxcore.h"
#include "highgui.h"
//#define WIN32
#ifdef WIN32
#define FELIB_API __declspec(dllexport)
#else
#define FELIB_API extern
#endif
//misc definition
#define MAXLENGTH 1024
#define Malloc(type,n) (type *)malloc((n)*sizeof(type))
#ifndef M_PI
#define M_PI 3.1415926535897932 
#endif

//#define GIST_MOMENT 1

#ifndef min
#define max(a,b) ((a) > (b) ? (a) : (b))
#define min(a,b) ((a) < (b) ? (a) : (b))
#endif

#ifndef BOOL
#define BOOL int
#endif  //BOOL
//edge
#define FRONT			255
#define BKGRND			0
#define	BIN_NUM			36	// Edge Direction Histogram (default: 72, 360 / 72 = 5 degrees)
#define	THR_EDGE		1	// Threshold for Edge Direction Histogram (default: 1)

//Normalize gabor feature
#define	NORM_SCALE		1000000

//Feature banks
typedef struct FeaBanks{
	double* feaVec;
	double* sum;
	int		len;
	int		nbImgs;
	int*	label;
	//float psi, theta, phi;	// orientation angles of the card
} FeaBanks;
/* set up the video format globals */

typedef struct imgFile {
	 int  id;
	 char* fname;
}imgFile;

typedef struct ImgFileList {
	int		nbImg;	
	char*	path;
	imgFile	*imfile;
}ImgFileList;

#include "util.h"
#include "colormoment.h"
#include "gabor.h"
#include "gist.h"
#include "edge.h"
#include "lbp.h"
#endif /*__EXTRACTFEATURE_INC__*/
