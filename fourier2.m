n = [0:.01:1000]; 
%x1 = cos(2*pi*n/2); 
x1 = cos(2*pi*n/2) + cos(2*pi*n*10);
N = 2048; 
X = abs(fft(x1,N)); 
X = fftshift(X); 
F = [-N/2:N/2-1]/N; 
F1 = F(1, N/2:N);
X1 = X(1, N/2:N);
plot(F1,X1), 
xlabel('frequency / fs') 
figure
plot(n, x1)