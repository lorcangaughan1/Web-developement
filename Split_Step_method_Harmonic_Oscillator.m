%This is the split step method for solving the shrodinger equation
%for a harmonic oscillator
%the sets for doing this are
%- Change the state to the momentum representation.
%- Multiply by P[k].
%- Change the state back to the position representation.
%- Multiply by Q[j].
%- Change the state to the momentum representation.
%- Multiply by P[k].
%- Finally change back to the position representation.

clear; clc; close all;
tic;
N=2000;%the number of particles in the system.
h=1;
Lq=60;%The size of the system
Lp=2*pi*h*N/Lq;%this is the length of the vector p
lp=Lp/N;%this is the space step
p=(-Lp/2:lp:Lp/2-lp);

dt=0.01;%timestep
i=sqrt(-1);%This is i
lq=Lq/N;%this is the space step for q
q=(-Lq/2:lq:Lq/2-lq);%this is the vector q
psquared=p.^2; 
V=(q.^2)/2; %this is the potential V
P=exp((-i*dt*psquared)/4*h);
Q=exp((-i*dt.*V)/h);
qstart=20;%the start point

Psi=1/(sqrt(pi))*exp((-(q-qstart).^2)/2); %v=Psi

Norm(2001)=0;
iter=0;
Energy(2001)=0;


for x=0:dt:20%Evolves the system for 20 seconds
 %o=phi
    Phi=(1/sqrt(N))*fftshift(fft(fftshift(Psi)));
    Phi=Phi.*P;
    Psi=(sqrt(N))*fftshift(ifft(fftshift(Phi)));
    Psi=Psi.*Q;
    Phi=(1/sqrt(N))*fftshift(fft(fftshift(Psi)));
    Phi=Phi.*P;
    Psi=(sqrt(N))*fftshift(ifft(fftshift(Phi)));

  vc=conj(Psi);%this is the conplex conjucate for Psi
  qc=conj(Phi);%this is the conplex conjucate for Phi

   iter=iter+1;
   N=sum(Psi.*vc);
   A=lp*N;%this is the norm at this time step
   Norm(iter)=A;%this save the norm at this timestep
   
   
   Eq=lq.*sum(qc.*q.*Phi);
   Ep=lp.*sum(vc.*p.*Psi);
   Et=Eq +Ep;%this is the energy at this timestep
   Energy(iter)=Et;%this save the energy at this timestep
   figure(1)
   clf;
   plot(p,real(Psi),'-',q,imag(Psi)) 
   title('Graph of p vs Psi. Real is blue and imginary is green')
  % legend('Real','Imag')
   xlabel('p')
   ylabel('Psi')
   drawnow; 
end
toc;
