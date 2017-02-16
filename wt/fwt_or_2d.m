function wc = fwt_or_2d(sens,x,L,h0)
%res=fwt_or_2d(sens,s,l,h0);
%Décomposition
%	s->image à décomposer
%	l->nbre d'échelle de décomposition (ex l=1 : décomp sur 1 échelle)
%	h0->filtre passe-bas 
%	sens=0 -> décompostion
%	res : la matrice contenant le res de la décomposition (ex si on a une décomp en 1 échelle
% alors res(1:n/2,1:n/2) contient la trame
%
%Reconstruction
%	s->matrice contenant la décomp à reconstruire
%	l->nbre d'échelle 
%	h0->filtre passe-bas 
%	sens=1 -> reconstruction
%res : image reconstruite

g0 = -( (-1).^(1:length(h0)) ).*h0;

if sens==0
    s=x;
    n=size(x,1);
    m=size(x,2);
    if rem(n,2^L)~=0
        offs=2^L-rem(n,2^L);
        x=zeros(n+offs,m);
        x(round(offs/2)+1:n+round(offs/2),:)=s;n=n+offs;
    else
        x=s;
    end;
    s=x;
    if rem(m,2^L)~=0
        offs=2^L-rem(m,2^L);
        x=zeros(n,m+offs);
        x(:,1+round(offs/2):m+round(offs/2))=s;m=m+offs;
    else
        x=s;
    end;

    
	wc = x; 
	nc = n;
    mc = m;
	for jscal=1:L,
		topn = (nc/2+1):nc; botn = 1:(nc/2);
   		topm = (mc/2+1):mc; botm = 1:(mc/2);
		for ix=1:nc,
			row = wc(ix,1:mc);
			wc(ix,botm) = Lo_conv(row,h0);
			wc(ix,topm) = Hi_conv(row,g0);
		end
		for iy=1:mc,
			row = wc(1:nc,iy)';
			wc(topn,iy) = Hi_conv(row,g0)';
			wc(botn,iy) = Lo_conv(row,h0)'; 
		 end
		nc = nc/2; mc= mc/2;
	end    
else
   wc=x;
   n=size(wc,1);   m=size(wc,2);

	x = wc; 
	nc = n/2^(L-1);
    mc = m/2^(L-1);
	for jscal=1:L,
		topn = (nc/2+1):nc; botn = 1:(nc/2); alln = 1:nc;
   		topm = (mc/2+1):mc; botm = 1:(mc/2); allm = 1:mc;
		for iy=1:mc,
			x(alln,iy) =  ico(h0, dilate(x(botn,iy)') )'  ...
					   + Hi_up(x(topn,iy)',g0)'; 
		end
		for ix=1:nc,
			x(ix,allm) =  ico(h0, dilate(x(ix,botm)) )  ... 
					   + Hi_up(x(ix,topm),g0);
		end
		nc = 2*nc;		mc = 2*mc;
   end
   wc=x;
end;

   
function   y = Hi_up(x,g0)
tmp=dilate(x);
tmp = [ tmp(length(tmp)) tmp( 1: (length(tmp)-1) )];
y = aco( g0, tmp );


function d=Hi_conv(s,qmf)
d = ico( qmf, [ s( 2:length(s) ) s(1) ]);
n = length(d);
d = d(1:2:(n-1));


function y = ico(f,x)
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

function d=Lo_conv(x,qmf)
d = aco(qmf,x);
n = length(d);
d = d(1:2:(n-1));

function y = aco(f,x)
n = length(x);
p = length(f);
if p < n,
    xpadded = [x x(1:p)];
else
    z = zeros(1,p);
    for i=1:p,
        imod = 1 + rem(i-1,n);
        z(i) = x(imod);
    end
    xpadded = [x z];
end
fflip = f(length(f):-1:1);
ypadded = filter(fflip,1,xpadded);
y = ypadded(p:(n+p-1));


function y = dilate(x);
s = 2;
n = length(x)*s;
y = zeros(1,n);
y(1:s:(n-s+1) )=x;

