clear all; close all;
s = tf('s');
G = (-153)/(s^3+27*s^2-1962*s-52320); % transfer function
figure(1)
step(G) % plotting the bode step response of G(s) 
stepinfo(G)
grid on;
figure(2)
impulse(G) % plotting the impulse response of G(s) 
grid on;
figure(3)
pzmap(G) % plotting the pole-zero map of G(s) 
a = findobj(gca,'type','line'); % findobj locates graphics objects with specific properties
for i = 1:length(a)
    set(a(i),'markersize',12)
    set(a(i), 'linewidth',2) 
end
figure(4)
rlocus(G)
set(findall(gcf,'type','line'),'linewidth',2); % findall returns the objects that have the specified
                                               % properties and sets them to the specified values
figure(5)
bode(G) % plotting the bode plot of G(s) 
margin(G)
sisotool(G)

t = 0:0.002:20;
[u,t] = gensig("sin",5,20); % generates signal 
[y,t] = gensig("square",5,20);
Kp = -24.3;
Ki = -5.97;
Kd = -24.8;
H = 1;
Dc = Kp+Kd*s+Ki/s;
T = feedback(600*G*Dc,1);
figure(6);
pzmap(T);
a = findobj(gca,'type','line'); % findobj locates graphics objects with specific properties
for i = 1:length(a)
    set(a(i),'markersize',12)
    set(a(i), 'linewidth',2) 
end
figure(7)
step(T);
grid on
figure(8)
lsim(T,u,t);
set(findall(gcf,'type','line'),'linewidth',2); % findall returns the objects that have the specified
                                               % properties and sets them to the specified values
title("Sine Wave Tracking")
ylabel("Amplitude")
grid on
figure(9)
lsim(T,y,t);
set(findall(gcf,'type','line'),'linewidth',2);
title("Square Wave Tracking")
ylabel("Amplitude")
grid on
figure(10)
rlocus(G*Dc)
title('Root Locus GDc(s)')
set(findall(gcf,'type','line'),'linewidth',2);


