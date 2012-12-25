function A = readbin( filename ) 
%
% function readbin( filename ) 
%
% Reads a matrix from the binary file 'filename'.
%
% The format is expected to be:
%
%   double(1)           = m
%   double(2)           = n
%   double(3 - n*m+2)   = The content of a n*m matrix 
%                         in double precision.
%
% This format is compatible with the ToFile() call in
% the matrix and vector classes of DIVA.
%
fid=fopen( filename,'r');
A=fread(fid,'float64');
fclose(fid);
A=(reshape(A(3:end), A(2), A(1)))';