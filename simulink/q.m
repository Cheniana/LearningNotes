
%关节角、连杆偏距、连杆长度、连杆转角
L(1) = Link('d',    0,       'a',0,  'alpha',0,      'qlim',[-pi,pi],	'modified');
L(2) = Link('theta',0,       'a',0,  'alpha',pi/2,   'qlim',[0,10],     'modified');
L(3) = Link('d',    0.1,     'a',0,  'alpha',0,      'qlim',[-pi,pi],	'modified');

RPR_robot = SerialLink(L(1:3),'name','RPR');
RPR_robot.plotopt={'workspace',[-10,10,-10,10,-10,10]};
RPR_robot.teach
