fs = 1e6;
bw = 3e3;
a = 1/(2*pi*bw/2); % seconds, 1/rad
a = a*fs; % samples/rad

% a = 2; % the time constant
dw = 1/1000;
w = -pi:dw:pi;
Hw = 1./(1+a*1j*w);
plot(w/(2*pi)*fs, abs(Hw.^2))
xlim([-3*bw,3*bw])
xlabel('frequency, Hz')
ax = gca;
line([1/a 1/a]/(2*pi)*fs, ax.YLim)
line(-[1/a 1/a]/(2*pi)*fs, ax.YLim)
fprintf('Bandwidth = %.2f rad/sample = %.2f \n', 2*1/a, 2*1/a / (2*pi))
fprintf('Bandwidth = %.2f rad/sample = %.2f \n', 2*1/a, 2*1/a / (2*pi))
grid
