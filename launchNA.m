%%  Monte-Carlo based Fiber-optic Collection Efficiency Simulation rev.4
%   Issue date of last ver.: 04/03/2014 (history - 1st: 05/19/2013, 2nd: 02/18/2014, 3rd: 03/25/2014)
%   Implementation: Younghoon Shin (yhoon@gist.ac.kr), 3D Biomedical Imaging and Technology Lab, GIST, Korea
%   User: Younghoon Shin(yhoon@gist.ac.kr), Dasol Lee (dasol@gist.ac.kr), Youngjae Ryu (ryj7301@gmail.com)   
%
%   This code is designed for collaborative research with Bio-scopy lab at GIST
%   Modification and redistribution without the permission from the author is not allowed.
%% NOTE: "LAUNCH PHOTON RANDOMLY WITHIN NUMERICAL APERTURE"
function dir = launchNA(theta_max)
    r1 = rand();
    r2 = rand();
%     psi = 2*pi*r1;
%     theta = acos(1-r2*(1-cos(theta_max)));
    
    tmp = 1-r2*(1-cos(theta_max));
	x = cos(2*pi*r1)*sqrt(1- tmp*tmp);
	y = sin(2*pi*r1)*sqrt(1-tmp*tmp);
	z = 1-r2*(1-cos(theta_max));
    
    dir = [x, y , z];
    dir = dir/norm(dir);
end

