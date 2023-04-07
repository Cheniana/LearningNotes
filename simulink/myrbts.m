%% By Cheniana Thesis
clear,close all
%%  关节建模、定义角度限制
L(1) = Link('prismatic','d',0.88,'a',0,'alpha',pi/2,'theta',0,'qlim',[0,1.2]);
L(2) = Link('revolute','d',0.4905,'a',0,'alpha',-pi/2,'qlim',[-180,180]/180*pi);
L(3) = Link('revolute','d',0,  'a',0,'alpha', pi/2,'qlim',[-30,30]  /180*pi);
L(4) = Link('revolute','d',0.255,'a',0,'alpha',-pi/2,'qlim',[-180,180]/180*pi);
L(5) = Link('revolute','d',0,  'a',0,'alpha', pi/2,'qlim',[-90,90]  /180*pi);
L(6) = Link('revolute','d',0.48,'a',0,'alpha', pi/2,'qlim',[-180,180]/180*pi);
rbts = SerialLink(L(1:6),'name','rbts');
rbts.teach
%%  运动学正、逆解
% joint_theta = [30,30,30,0,0]/ 180 * pi;%设置关节转角
% ts = rbts.fkine(joint_theta);
% mask_joint = [1,1,1,1,1,0];
% qs = rbts.ikine(ts,'mask',mask_joint,'pinv')*180/pi;
% rbts.plot(joint_theta);
% disp(qs);
%%  工作空间可视化
% num = 100000;
% p = zeros(num,3);
% for i = 1 : num
%     q1 = L(1).qlim(1) + rand * (L(1).qlim(2)-L(1).qlim(1));
%     q2 = L(2).qlim(1) + rand * (L(2).qlim(2)-L(2).qlim(1));
%     q3 = L(3).qlim(1) + rand * (L(3).qlim(2)-L(3).qlim(1));
%     q4 = L(4).qlim(1) + rand * (L(4).qlim(2)-L(4).qlim(1));
%     q5 = L(5).qlim(1) + rand * (L(5).qlim(2)-L(5).qlim(1));
%     q = [q1 q2 q3 q4 q5];
%     t = rbts.fkine(q);
%     p(i,:) = transl(t);
% end
% xyz_min_max = [max(p(:,1)),min(p(:,1));max(p(:,2)),min(p(:,2));max(p(:,3)),min(p(:,3))];
% plot3(p(:,1),p(:,2),p(:,3),'r.','markersize',1);
% disp(xyz_min_max)

%% 轨迹规划
%[P,dP,ddP] = tpoly(0,3,times);%五次多项式曲线
%[P,dP,ddP] = lspb(0,3,times);%混合轨迹曲线（梯度速度曲线）
%[P,dP,ddP] = mtraj(@tpoly,[0,0],[3,4],times);%多维轨迹曲线

%traj = mstraj(wp,qdmax,tseg,q0,dt,tacc,options)%多维多段轨迹曲线
%wp = [0,0;3,4;1,2]%经过的点
%qdmax最大速度；tseg每段时间间隔；q0默认空（以wp第一坐标为初始位置）
%dt差值间隔；tacc加速时间
% p1 = [0.5 0.6 0.4];
% p2 = [0.5 0.6 0.1];
% times = linspace(0,2,51);
% 
% traj = mtraj(@tpoly,p1,p2,times);
% n = size(traj,1);
% t = zeros(4,4,n);
% for i = 1 : n
%     t(:,:,i) = transl(traj(i,:))*trotx(180);
% end
% qtraj = rbts.ikunc(t);
% rbts.plot(qtraj);