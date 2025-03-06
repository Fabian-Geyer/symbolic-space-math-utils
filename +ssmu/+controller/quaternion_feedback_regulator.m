function [torqueC_B] = quaternion_feedback_regulator(q, omega, J, kd, ...
    kp, mu)
% Return control torque based on Quaternion Feedback Regulator control law
% from [1]
% ------------------
% [1] B. Wie, H. Weiss, and A. Arapostathis, “Quaternion feedback regulator
% for spacecraft eigenaxis rotation,”
%
% Inputs:
%   - q: (4x1) attitude quaternion where q(1) is the scalar part
%   - omega: (3x) body angular rate
%   - J: (3x3) inertia tensor
%   - kd: positive derivative scalar gain
%   - kp: positive proportional scalar gain
%   - mu: 0: linear PD control / mu = 1: full nonlinear compensation


arguments
    q (4,1)
    omega (3,1)
    J (3,3)
    kd (1,1)
    kp (1,1)
    mu (1,1)
end

torqueC_B = -kd*J*omega - kp*J*q(2:4) + mu*ssmu.cpm(omega)*J*omega;

end