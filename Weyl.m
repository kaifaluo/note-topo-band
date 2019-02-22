% -------------------------------------------------------------------------------
% Name:      Weyl.m
% Purpose:   To calculate and plot the Weyl point, slab DOS, and Chern number,
%            and Fermi arcs of a two band tight-binding model
% Author:    Kaifa Luo (luokaifa96@gmail.com)
%
% Created:   10-2017
% Licence:   Free
% Version:   0.1  Transforming the procedure into a callable one in order
%              to call them from a higher level script.
% ------------------------------------------------------------------------------
%%1. Weyl points
%%2. Slab
%%3. Chern number
%%4. Fermi arc

addpath(genpath(pwd));

clc;clear all;
clf;fig=figure(1)
%% ==============NODALLINE========NODALLINE=============
subplot(2,2,1);
nk=800;
k_range = [-0.5,0.5;0,1;-0.5,0.5]*2*pi;
mu0=(1/1.3-1/1)/(2*(1/5-1/100));
WP=show_WeylPoint(k_range,nk,mu0);
%text(-pi+2*pi*0.08,2*pi*0.97,pi*0.88,'(a)');
%%========================================================

%% ======SLAB=====================SLAB====================
subplot(2,2,2);
show_slab()
%text(nk_label(2)*0.05,y_lim(2)-(y_lim(2)-y_lim(1))*0.1,'(b)');
%%%=========SLAB======================SLAB===============

%%%===========ChernNumber=============ChernNumber======
subplot(2,2,3)
nk=200;
nk0=400;
run=0;
show_ChernNumber(nk,nk0,run,WP);
%text(nk*0.05,1.5-(y_lim(2)-y_lim(1))*0.1,'(c)');
%%%===========ChernNumber=============ChernNumber======

%%%%=========================FERMI ARC================
subplot(2,2,4)
run=0;
show_FermiArc(run)
%text(-0.5+1*0.05,1-1*0.1,'(d)');
%%%% =========================FERMI ARC================

plt_set_cl();

%%print('output\example', '-dpng', '-r350'); %<-Save as PNG with 350 DPI