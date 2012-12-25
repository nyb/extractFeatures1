% change the mex compiler to VC8. Using LCC, you will get following compiling error 
% "\cxtypes.h: 300  compiler error in _kids--Bad rule number 0". Thanks zim.
% mex -setup

mex -output mexFeatures -I. -Iinclude -IC:\OpenCV\cv\include -IC:\OpenCV\cxcore\include -IC:\OpenCV\otherlibs\highgui -LC:\OpenCV\lib -L. -lcxcore -lcv -lhighgui -lfelib main.c
%mex -I. -Iinclude -IC:\OpenCV\cv\include -IC:\OpenCV\cxcore\include -IC:\OpenCV\otherlibs\highgui -LC:\OpenCV\lib -L. -lcxcore -lcv -lhighgui -lfelib main.c

% lin
%mex -output mexFeatures -I. -I./include -I/opt/local/include/opencv -L/opt/local/lib -L. -lcxcore -lcv -lhighgui -lfe-lin.0.1 main.c 