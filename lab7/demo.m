planarrobot_student
load net
% clear q1 q2 q3 q4 q5 forh 
%%
% rng(0,'twister');
test_size = 1000;
% q1
q_min = -114;
q_max = 114;
q1 = (q_max-q_min)*rand(test_size,1) + q_min;

% q2
q_min = -60;
q_max = 60;
q2 = (q_max-q_min)*rand(test_size,1) + q_min;

% q3
q_min = -100;
q_max = 100;
q3 = (q_max-q_min)*rand(test_size,1) + q_min;

% q4
q_min = -50;
q_max = 50;
q4 = (q_max-q_min)*rand(test_size,1) + q_min;

% q5
q_min = -50;
q_max = 50;
q5 = (q_max-q_min)*rand(test_size,1) + q_min;

forh = [q1 q2 q3 q4 q5]*deg;

% true
% home = [0 0 -0 0 0]*deg;

error = [];

for i=1:test_size
    pose_end = planar_robot.fkine(forh(i, :));
    xyz = transl(pose_end);
    
    sample = ones(1,1,3);
    sample(1,:) = xyz;

    makeq = predict(net, sample);
    pr_pose = planar_robot.fkine(makeq);
    pr_xyz = transl(pr_pose);
    
    
    error = [error, sqrt((xyz(1)-pr_xyz(1))^2 + (xyz(2)-pr_xyz(2))^2 + (xyz(3)-pr_xyz(3))^2)];
end

% predicted
%%
% this mean error should be lower than in untuned model
a = mean(error);
% home1 = [0 0 0 0 0]*deg;


forh
makeq

xyz
pr_xyz

a