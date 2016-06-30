n = [1:c];
%x1 = 5*cos(2*pi*n*25/1000)+ 2*cos(2*pi*n*10/1000)+4; 
%x1 = n.^2
%x1 = cos(2*pi*n/2) + cos(2*pi*n/10);
N = 2048; 
x1 = x1 - mean(x1);
X = abs(fft(x1,N)); 
X = fftshift(X); 
F = [-N/2:N/2-1]/N; 
F1 = F(1, N/2:N);
X1 = X(1, N/2:N);
X2 = 2*(X1/c);
% plot(F1, X2), 
% xlabel('frequency / fs') 
% figure
x1 = smooth2a(x1,1,1);
plot(n, x1)