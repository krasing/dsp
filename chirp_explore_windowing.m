%% Complex chirp around zero time
% Why Chirp waveform has ripples in frequency domain?
% Is there such setting that DFT does not produce ripples?
% plotting exported as chirp_plot.m
M = 100;
n = -M : M-1;
T = 0.1;
t = n*T;
gamma = 0.1;
sChirp = exp(1j*pi*gamma*t.^2);
plot_complex(t, sChirp, 'time')

SChirp = fft(sChirp);
f = (0:2*M-1)/(T*2*M);

plot_complex(f, SChirp, 'freq')
%% frequenvy shifted chirp
shift = 2;
sChirpShift = exp(1j*pi*gamma*t.^2).*exp(1j*pi*shift*t);
plot_complex(t, sChirpShift, 'time')

%% time shifted chirp
delay = 3;
SChirpShift = SChirp.*exp(-1j*2*pi*f*delay);
sChirpShift = ifft(SChirpShift);
plot_complex(t, sChirpShift)

%% up and down sweep chirp
% this is zero phase signal
sChirp1 = exp(1j*pi*gamma*t.^2);
sChirp2 = exp(-1j*pi*gamma*t.^2);
sChirpM = [sChirp1, sChirp2];
N = length(sChirpM);
plot_complex(0:N-1, sChirpM, 'time')

SChirpM = fft(sChirpM);
f = (0:0.5:2*M-0.5)/(T*2*M);
plot_complex(f, SChirpM, 'freq')

%% windowed chirp
sChirp = exp(1j*pi*gamma*t.^2);
sChirpW = [zeros(1, M), sChirp, zeros(1, M)];
t = [(-2*M:-M-1)*T, t, (M:2*M-1)*T];
f = (0:4*M-1)/(T*4*M);
plot_complex(t, sChirpW, 'time')
SChirpW = fft(sChirpW);
plot_complex(f, SChirpW, 'freq')

%% windowed chirp full simetry
n = -M : M;
t = n*T;
sChirp = exp(1j*pi*gamma*t.^2);
sChirpW = [zeros(1, M-1), sChirp, zeros(1, M)];
t = [(-2*M:-M-2)*T, t, (M:2*M-1)*T];
f = (0:4*M-1)/(T*4*M);
plot_complex(t, sChirpW, 'time')
SChirpW = fft(sChirpW);
plot_complex(f, SChirpW, 'freq')
%% Conclusion
% Chirp contain continuous transition between frequencies so it acts like
% windowed signal with spectral leakage.
% Can discrete version of the chirp be modified so this leakage is removed?
