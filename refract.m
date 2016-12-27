%%  Monte-Carlo based Fiber-optic Collection Efficiency Simulation rev.3
%   Date: 03/25/2014
%   Implementation: Younghoon Shin (yhoon@gist.ac.kr), 3D Biomedical Imaging and Technology Lab, GIST, Korea
%   User: Younghoon Shin(yhoon@gist.ac.kr), Dasol Lee (dasol@gist.ac.kr), Youngjae Ryu (ryj7301@gmail.com)   
%
%   This code is designed for collaborative research with Bio-scopy lab at GIST.
%   Modification and redistribution without the permission from the author is not allowed.
%
%% NOTE: "REFRACT DIRECTION OF RAY"
function [result tir] = refract(surfNormal, I, nRatio)
	result = [0 0 0];
    tir = 0;
    
    cosI = -(dot(surfNormal,I));
	sinT2 = nRatio* nRatio * ( 1 - cosI*cosI );
	if sinT2 > 1
		tir = 1;      
    end
	cosT = sqrt(1-sinT2);
	result = nRatio*I + (nRatio*cosI-cosT)*surfNormal;
    result = result/norm(result);
end