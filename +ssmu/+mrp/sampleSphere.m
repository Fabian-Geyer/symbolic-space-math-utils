function [X,Y,Z] = sampleSphere(opts)
%SAMPLESPHERE sample points in a spehre with radius 1 using different 
% algorithms

arguments
    opts.method {mustBeMember(opts.method,["rejection_sampling"])} = "rejection_sampling"
    opts.npoints (3,1) double = [40;40;40];
end

if (opts.method=="rejection_sampling")
    domX = linspace(-1,1,opts.npoints(1));
    domY = linspace(-1,1,opts.npoints(2));
    domZ = linspace(-1,1,opts.npoints(3));
    [X,Y,Z] = ndgrid(domX,domY,domZ);

    insideSphere = (X.^2 + Y.^2 + Z.^2) <= 1;

    % Apply logical indexing to keep only valid points
    X = X(insideSphere);
    Y = Y(insideSphere);
    Z = Z(insideSphere);
end

end

