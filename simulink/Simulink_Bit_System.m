clear;
clc;
%L(1)=Link('d',0.88,'a',0,'alpha',0);L(1).jointtype='P';
L(1)=Link('a',0.1,'alpha',0,'theta',0,);L(1).jointtype='P';
%L(2)=Link('a',0,'alpha',0,'theta',0,'qlim',[0,1]);
Five_dof=SerialLink(L,'name','5-dof');
Five_dof.plot3d(0,'tilesize',0.2,'workspace',[-1 2 -2 2 0 3],'path','D:\git\LearningNotes\simulink','nowrist','view',[35 20])
light ('Position',[1 1 1],'color','w');