clear;
clc;
%%
L(1) = Link('a',0,'alpha',0,'theta',0,'qlim',[0,0.68],'modified');L(1).jointtype = 'P';
L(2) = Link('a',0,'alpha',0,'d',0','qlim',[0,360]/180*pi,'modified');
L(3) = Link('a',0,'alpha',-pi/2,'theta',0,'qlim',[0.53,1.43],'modified');L(3).jointtype = 'P';
L(4) = Link('a',0,'alpha',-pi/2,'d',0.01054','qlim',[0,360]/180*pi,'modified');
L(5) = Link('a',0,'alpha',-pi/2,'d',0,'qlim',[-30,30]/180*pi,'modified');
L(6) = Link('a',0,'alpha',pi/2,'d',0.25019,'qlim',[0,360]/180*pi,'modified');
L(7) = Link('a',0,'alpha',-pi/2,'d',0,'qlim',[-90,90]/180*pi,'modified');
L(8) = Link('a',0,'alpha',pi/2,'d',0.48,'qlim',[0,360]/180*pi,'modified');
Bit_System=SerialLink(L,'name','Bit_System');
%%
num = 100000;
p = zeros(num,3);
for i = 1 : num
    q1 = L(1).qlim(1) + rand * (L(1).qlim(2)-L(1).qlim(1));
    q2 = L(2).qlim(1) + rand * (L(2).qlim(2)-L(2).qlim(1));
    q3 = L(3).qlim(1) + rand * (L(3).qlim(2)-L(3).qlim(1));
    q4 = L(4).qlim(1) + rand * (L(4).qlim(2)-L(4).qlim(1));
    q5 = L(5).qlim(1) + rand * (L(5).qlim(2)-L(5).qlim(1));
    q6 = L(6).qlim(1) + rand * (L(6).qlim(2)-L(6).qlim(1));
    q7 = L(7).qlim(1) + rand * (L(7).qlim(2)-L(7).qlim(1));
    q8 = L(8).qlim(1) + rand * (L(8).qlim(2)-L(8).qlim(1));
    q = [q1 q2 q3 q4 q5 q6 q7 q8];
    t = Bit_System.fkine(q);
    p(i,:) = transl(t);
end
xyz_min_max = [max(p(:,1)),min(p(:,1));max(p(:,2)),min(p(:,2));max(p(:,3)),min(p(:,3))];
plot3(p(:,1),p(:,2),p(:,3),'r.','markersize',1);
disp(xyz_min_max)
%%
% Bit_System=SerialLink(L,'name','Bit_System');
% Bit_System.base = transl(0,0,0.88);%圆柱导轨坐标
% Bit_System.plot([0.68 0 1 0 0 0 0 0],'workspace',[-1.6 1.6 -1.6 1.6 0 2],'view',[35 20])
