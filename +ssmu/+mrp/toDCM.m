function [DCM] = toDCM(mrp)
% Convert 3x1 Modified Rodrigues Parameters to DCM taken from [1]
% Input: 
%   mrp (3x1): numerical or symbolic
% Output:
%   Direction Cosine Matrix as expression of Quaternion (3x3): numerical or
%   symbolic


% [1] “Attitude Estimation Using Modified Rodrigues Parameters 
%-NASA Technical Reports Server (NTRS)”

arguments
    mrp (3,1)
end

% make sure reals are used if symbolic toolbox is used
if isa(mrp, 'sym')
    mrp = real(mrp);
end

% Compute the Direction Cosine Matrix (DCM) [1]
DCM = eye(3) - 1/((1+mrp'*mrp)^2)*( 4*(1-mrp'*mrp) )*ssmu.cpm(mrp) + 8*ssmu.cpm(mrp)^2;
end