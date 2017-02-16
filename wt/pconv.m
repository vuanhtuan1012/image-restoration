function y = pconv(f,x)
% iconv -- Convolution Tool
%  Usage
%    y = pconv(f,x)
%  Inputs
%    f   filter
%    x   1-d signal
%  Outputs
%    y   filtered result
%
%  Description
%    Filtering by periodic convolution of x with f
%

	n = length(x);
	p = length(f);
	if p <= n,
        xpadded = [x((n+1-p):n) x];
	else
	   z = zeros(1,p);
	   for i=1:p,
		   imod = 1 + rem(p*n -p + i-1,n);
		   z(i) = x(imod);
	   end
	   xpadded = [z x];
	end
	ypadded = filter(f,1,xpadded);
	y = ypadded((p+1):(n+p));

    
