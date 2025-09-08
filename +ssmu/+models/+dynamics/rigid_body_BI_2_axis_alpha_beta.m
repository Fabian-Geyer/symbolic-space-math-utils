function [alpha_dot, beta_dot, omega_BI_B_dot] = ...
    rigid_body_BI_2_axis_alpha_beta(alpha, beta,omega_BI_B, J, tau_B)
% returns the basic dynamics of a rigid body with respect to the inertial
% frame for 2-axis acquisition.
% Inputs:
%   - s_BI: 3x1 attitude direction vector expressed in body frame w.r.t.
%   inertial frame I. s_BI = (s1,s2,s3)^T
%   - omega_BI_B: 3x1 angular rate vector of B frame w.r.t. I frame
%   expressed in B
%   - J: 3x3 (potentially symbolic) inertia matrix
%   - tau_B: 3x1 (symbolic) sum of torques acting on the satellite

arguments
    alpha (1,1)
    beta (1,1)
    omega_BI_B (3,1)
    J (3,3)
    tau_B (3,1)
end

om = omega_BI_B;

% Reduced Kinematics when using alpha and beta
% Transformation: T_BA = T2(alpha)*T3(-beta)
alpha_dot =  -(om(1)*cos(alpha)*sin(beta) - om(2)*cos(beta) + om(3)*sin(alpha)*sin(beta))/cos(beta);
beta_dot  = om(1)*sin(alpha) - om(3)*cos(alpha);

omega_BI_B_dot = -inv(J)*( ssmu.cpm(om)*J*om - tau_B ); % dynamics

end

