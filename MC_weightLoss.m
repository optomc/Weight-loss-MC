%% Initiation
clc;clear;

MC.numPhotons=1e5;             % maximum number of input photon
MC.mus=11.5;                    % 473 nm scattering coefficient [mm^-1]
MC.mua=0.1;                   % 473 nm absorption coefficient [mm^-1] 
MC.g=0.87;                      % 473 nm anisotropy factorMC.n=1.36;                      % Gray matter reflective index
MC.NA=0.39;
MC.weight=1;

MC.nAir=1.0;                   % sample refractive idx, NOTE: Air - 1.0, Water - 1.33, Gray Matter - 1.36
MC.nWater=1.33;                % sample refractive idx, NOTE: Air - 1.0, Water - 1.33, Gray Matter - 1.36
MC.nBrain=1.36;                % sample refractive idx, NOTE: Air - 1.0, Water - 1.33, Gray Matter - 1.36
MC.nMedium = nBrain;

MC.rFiber=0.1;

zRes = 0.01;
rRes = 0.01;
Irr = zeros(201,201,201);          % r = 2mm, z = 2mm
area = rRes*rRes;
volume = rRes*rRes*zRes;

wdPlane.pos=[0 0 0];     % location of tissue surface (plane)
wdPlane.normal=[0 0 -1];         % normal direction of surface (plane)

%% doMcRun
tic;
fprintf('This is Monte Carlo simulation\n');
fprintf('# of photon : %d\n', MC.numPhotons);

photon.Dead = 0;

for iPhoton=1:MC.numPhotons
    photon.Dead = 0;  
    
    if mod(iPhoton, 1000) == 0
        disp(num2str(iPhoton));
    end
    
    radius = sqrt(rand()*MC.rFiber^2);          %uniform transverse distribution (top-hat profile)
    theta = rand()*2*pi;
    x = radius*cos(theta);
    y = radius*sin(theta);

    % source position
    photonPos=[x y 0]; 
    photonPrevPos=photonPos;    
    
    photonDir=launchEffNA(MC.NA,MC.nMedium);    

    t = rayPlaneIntersects(wdPlane,photonPrevPos,photonDir);
    photonPos = photonPrevPos + t * photonDir;   
    photonPrevPos = photonPos;
      
    %% scattering   
    stepInLoop = 1;

    while (photon.Dead ~= 1)   

        s=stepSize(MC);	

        % Move
        photonPrevPos = photonPos;
        photonPos = photonPrevPos + s * photonDir;        
        
        % Absorb
        dwa = MC.weight * (MC.mua/(MC.mua+MC.mus));        
        MC.weight = MC.weight - dwa;
        
        % Assign weight    
        xImgId = round(photonPos(1)/rRes)+101;
        yImgId = round(photonPos(2)/rRes)+101;
        zImgId = round(photonPos(3)/zRes)+1;    
        
        if (xImgId < 1 || yImgId < 1 || zImgId < 1 || xImgId > 200 || yImgId > 200 || zImgId > 200)
            break;  %define boundary
        end
        
        Irr(xImgId, yImgId, zImgId) = Irr(xImgId, yImgId, zImgId) + dwa; %  Arz[ir][iz] += dwa
        
        if (MC.weight < 0.1)
        % Roulette            
            if (MC.weight == 0)
                photon.Dead = 1;
            elseif (rand() < 0.1)
                MC.weight = MC.weight / 0.1;
            else
                phopton.Dead = 1;
            end
        end
        
        % Scatter
        photonDir=spin(MC, photonDir);          
              
        % Photon termination
        if (photonPos(3) >= 2 || photonPos(3) <= 0)         
             photonPos = photonPrevPos;
             break;
        end
    end
end
time=toc;

nIrr = ((Irr./MC.numPhotons)./MC.mua)./volume;
sIrr = squeeze(nIrr(101,:,:))'; 

%% Visualization
close all;

figure(1); 
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr));
xlabel('Distance y [mm]', 'FontSize',12,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontSize',12,'fontWeight','bold'); colorbar;
title('Intensity map (semilog scale)', 'FontSize',12,'fontWeight','bold');
set(gca, 'FontSize',12,'fontWeight','bold'); set(gcf,'color','w');
 
figure(2); 
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr));
xlabel('Distance y [mm]', 'FontSize',12,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontSize',12,'fontWeight','bold'); colorbar;
title('Intensity map (linear scale)', 'FontSize',12,'fontWeight','bold');
set(gca, 'FontSize',12,'fontWeight','bold'); set(gcf,'color','w');
 
figure(3);
plot(log(sIrr(:,100)));
title('On-Axis Intensity (semilog scale) [A.U]', 'FontSize',12,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontSize',12,'fontWeight','bold');
set(gca, 'FontSize',12,'fontWeight','bold'); set(gcf,'color','w'); 

figure(4);
plot((sIrr(:,100)));
title('On-Axis Intensity (linear scale) [A.U]', 'FontSize',12,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontSize',12,'fontWeight','bold');
set(gca, 'FontSize',12,'fontWeight','bold'); set(gcf,'color','w'); 

disp(time)