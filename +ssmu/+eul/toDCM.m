function [DCM] = toDCM(eul)
% Convert 3x1 euler angles in 3-2-1 rotation sequence to DCM (3x3)

arguments
    eul (3,1)
end

DCM = ssmu.dcm.T1(eul(1))*ssmu.dcm.T2(eul(2))*ssmu.dcm.T3(eul(3));