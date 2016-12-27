%%  Monte-Carlo based Fiber-optic Collection Efficiency Simulation rev.4
%   Issue date of last ver.: 04/03/2014 (history - 1st: 05/19/2013, 2nd: 02/18/2014, 3rd: 03/25/2014)
%   Implementation: Younghoon Shin (yhoon@gist.ac.kr), 3D Biomedical Imaging and Technology Lab, GIST, Korea
%   User: Younghoon Shin(yhoon@gist.ac.kr), Dasol Lee (dasol@gist.ac.kr), Youngjae Ryu (ryj7301@gmail.com)   
%
%   This code is designed for collaborative research with Bio-scopy lab at GIST
%   Modification and redistribution without the permission from the author is not allowed.
%% NOTE: "LAUNCH PHOTON ISOTROPICALLY"
function v = launchISO()
    % This function randomly samples isotropic initial launching direction (v) of
    % individual photons.
    
	costheta=2.0*rand()-1;
    
    % sintheta is always positive 
	sintheta=sqrt(1-costheta*costheta);
	psi=2.0*pi*rand();
	v=[sintheta*cos(psi) sintheta*sin(psi) costheta];
end

