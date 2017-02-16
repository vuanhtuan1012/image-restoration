function WT(q)
% function WT is to answer questions of lab Wavelet Transform

close all;

if nargin < 1
    q = 0;
end

switch q
    %% Part 1: Study of a Haar Wavelet Filter
    case 1
        fprintf('Please see the report.\n');
    case 2 % view signal in the time and frequency domain
        data = load('greasy.mat');
        s = data.s'; % signal
        Fs = 16000; % sampling frequency
        N = length(s); % number of samples
        d = N/Fs; % duration
        
        % plot signal in the time domain
        t = 0:1/Fs:(d-1/Fs);
        figure; plot(t, s);
        xlabel('time (second)'); title('x(t)');
        print('xt.eps','-depsc');
        
        % plot signal in the frequency domain
        Xf = fft(s, N);
        f = 0:Fs/N:(Fs-Fs/N);
        figure; plot(f, abs(Xf));
        xlabel('Frequency (Hz)'); title('|X(f)|');
        print('xf.eps','-depsc');
    case 3 % plot frequency response H0(f)
        k = 1/sqrt(2);
        f = 0:0.5/100:0.5;
        z = exp(2*1i*pi*f);
        H0 = k*(1 + z.^(-1));
        H2 = abs(H0).^2;
        figure; plot(f, abs(H0)); title('|H_0(f)|');
        figure; plot(f, H2); title('|H_0(f)|^2');
    case 4
        fprintf('Please see the report.\n');
    case 5
        fprintf('Please see the report.\n');
    case 6
        fprintf('Please see the report.\n');
    case 7 % plot frequency response G0(f)
        k = 1/sqrt(2);
        f = 0:0.5/100:0.5;
        z = exp(2*1i*pi*f);
        H0 = k*(1 + z.^(-1));
        % get G0 from H0
        G0 = zeros(1, length(H0));
        for i = 0:length(H0)-1
            G0(i+1) = H0(i+1)*(-1)^(i+1);
        end
        G0 = G0(length(G0):-1:1);
        G2 = abs(G0).^2;
        figure; plot(f,abs(G0)); title('|G_0(f)|');
        figure; plot(f,G2); title('|G_0(f)|^2');
    case 8
        fprintf('Please see the report.\n');
    case 9
        data = load('greasy.mat');
        s = data.s'; % signal
        k = 1/sqrt(2);
        H0 = [k k]; % low-pass filter
        C1 = pconv(H0, s);
        c1 = C1(1:2:length(C1)); % downsampling
        G0 = [k -k]; % high-pass filter
        D1 = pconv(G0, s);
        d1 = D1(1:2:length(D1)); % downsampling
        figure; plot(c1); title('downsampling low-pass filtered signal');
        figure; plot(abs(fft(c1)));
        print('c1.eps','-depsc');
        figure; plot(d1); title('downsampling high-pass filtered signal');
        figure; plot(abs(fft(d1)));
        print('d1.eps','-depsc');
    case 10
        fprintf('Please see the report.\n');
    case 11
        fprintf('Please see the report.\n');
    case 12
        k = 1/sqrt(2);
        f = 0:0.5/100:0.5;
        z = exp(2*1i*pi*f);
        H1 = k*(1 + z.^(-1));
        H12 = abs(H1).^2;
        figure; plot(f, abs(H1)); title('|H_1(f)|');
        figure; plot(f, H12); title('|H_1(f)|^2');
        G1 = k*(-1 + z.^(-1));
        G12 = abs(G1).^2;
        figure; plot(f, abs(G1)); title('|G_1(f)|');
        figure; plot(f, G12); title('|G_1(f)|^2');
    case 13
        fprintf('Please see the report.\n');
    case 14
        % get signal
        data = load('greasy.mat');
        s = data.s'; % signal
        
        % downsampling
        k = 1/sqrt(2);
        H0 = [k k]; % low-pass filter
        tmp = pconv(H0, s);
        c1 = tmp(1:2:length(tmp)); % downsampling
        G0 = [k -k]; % high-pass filter
        tmp = pconv(G0, s);
        d1 = tmp(1:2:length(tmp)); % downsampling
        s1 = [c1 d1];
        
        % reconstruction
        n = ceil(length(s1)/2);
        c1 = s1(1:n);
        d1 = s1(n+1:2*n);
        H1 = H0;
        G1 = -G0;
        % upsampling c1
        n = length(c1);
        tmp = zeros(1,2*n);
        tmp(1:2:2*n) = c1;
        upc1 = pconv(H1, tmp);
        % upsampling d1
        n = length(d1);
        tmp = zeros(1,2*n);
        tmp(1:2:2*n) = d1;
        upd1 = pconv(G1, tmp);
        res = upc1 + upd1; % reconstructed signal
        n = length(res);
        res = res([2:n 1]); % delay 1
        fprintf('MSE(s, res) = %g\n', round(mean2((s-res).^2)));
        figure; plot(s); title('starting signal');
        print('sts.eps', '-depsc');
        figure; plot(res); title('reconstructed signal');
        print('res.eps', '-depsc');
    %% Part 2: Unknown Signal Analysis using Daubechies’D4 Filter
    case 15
        fprintf('Please see the report.\n');
    case 16
        fprintf('Please see the report.\n');
    case 17
        data = load('greasy.mat');
        s = data.s'; % signal
        b0 = 326/675; b1 = 1095/1309;
        b2 = 648/2891; b3 = -675/5216;
        h0 = [b0 b1 b2 b3];
        dec = filterbank(s, 2, h0, 0); % decomposition
        res = filterbank(dec, 2, h0, 1); % reconstruction
        fprintf('MSE(s, res) = %g\n', round(mean2((s-res).^2)));
        figure; plot(s); title('starting signal');
        print('d4sts.eps', '-depsc');
        figure; plot(res); title('reconstructed signal');
        print('d4res.eps', '-depsc');
    otherwise % help
        fprintf('function WT is to answer questions ');
        fprintf('of the lab Image Restoration by Wavelet Transform.\n');
        fprintf('Struct: WT(q)\n');
        fprintf('- if 1 <= q <= 24] => to answer the question q\n');
        fprintf('- otherwise => to help\n');
end