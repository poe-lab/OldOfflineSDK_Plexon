function [adfreq, n, ts, fn] = plx_ad_gap_info(filename, channel)
% plx_ad_gap_info(filename, channel): Read a/d info from a .plx file
%
% [adfreq, n, ts, fn] = plx_ad_gap_info(filename, channel)
%
% INPUT:
%   filename - if empty string, will use File Open dialog
%   channel - 0-based channel number
%
%           a/d data come in fragments. Each fragment has a timestamp
%           and a number of a/d data points. The timestamp corresponds to
%           the time of recording of the first a/d value in this fragment.
%           All the data values stored in the vector ad.
% 
% OUTPUT:
%   adfreq - digitization frequency for this channel
%   n - total number of data points 
%   ts - array of fragment timestamps (one timestamp per fragment, in seconds)
%   fn - number of data points in each fragment

if nargin < 2
    error 'Expected 2 input arguments';
end
if (isempty(filename))
   [fname, pathname] = uigetfile('*.plx', 'Select a Plexon .plx file');
   if isequal(fname,0)
     error 'No file was selected'
   end
   filename = fullfile(pathname, fname);
end

[adfreq, n, ts, fn] = mexPlex(24, filename, channel);
 