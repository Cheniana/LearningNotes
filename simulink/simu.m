clc;
clear;
%L(1) = Link('theta',0,'a',0,'alpha',0,'qlim',[0,1.2]);
L(1) = Link('revolute','d',0.15,'a',0,'alpha',pi/2,'qlim',[-180,180]/180*pi);
% L(3) = Link('theta',0,'a',0,'alpha',pi/2,'qlim',[0.5,2]);
% L(4) = Link('revolute','d',2,'a',0,'alpha',-pi/2,'qlim',[-180,180]/180*pi);
% L(5) = Link('revolute','d',0,  'a',0,'alpha', pi/2,'qlim',[-30,30]  /180*pi);
% L(6) = Link('revolute','d',2,'a',0,'alpha',-pi/2,'qlim',[-180,180]/180*pi);
% L(7) = Link('revolute','d',0,  'a',0,'alpha', pi/2,'qlim',[-90,90]  /180*pi);
% L(8) = Link('revolute','d',2,'a',0,'alpha', pi/2,'qlim',[-180,180]/180*pi);
rbts = SerialLink(L(1),'name','rbts');
rbts.base = transl(0,0,0.25);
q0 = [0 0 0 0 0];
view(3);
rbts.plot3d(q0,'tilesize',0.1,'workspace',[-5 5 -5 -5 0 5],'path','D:\git\LearningNotes\simulink','nowrist','view',[35 20])