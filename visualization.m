Irr_singlePhoton_1e4_2mm = Irr_singlePhoton_1e4_2mm./max(Irr_singlePhoton_1e4_2mm(:));
Irr_photonPacket_84586_2mm = Irr_photonPacket_84586_2mm./max(Irr_photonPacket_84586_2mm(:));

Irr_singlePhoton_1e5_2mm = Irr_singlePhoton_1e5_2mm./max(Irr_singlePhoton_1e5_2mm(:));
Irr_photonPacket_845860_2mm = Irr_photonPacket_845860_2mm./max(Irr_photonPacket_845860_2mm(:));

Irr_singlePhoton_1e6_2mm = Irr_singlePhoton_1e6_2mm./max(Irr_singlePhoton_1e6_2mm(:));
Irr_photonPacket_8458600_2mm = Irr_photonPacket_8458600_2mm./max(Irr_photonPacket_8458600_2mm(:));

%%
nIrr = (Irr_singlePhoton_1e4_2mm);
sIrr_singlePhoton_1e4_2mm = squeeze(nIrr(101,:,:))'; 

nIrr = (Irr_singlePhoton_1e5_2mm);
sIrr_singlePhoton_1e5_2mm = squeeze(nIrr(101,:,:))'; 

nIrr = (Irr_singlePhoton_1e6_2mm);
sIrr_singlePhoton_1e6_2mm = squeeze(nIrr(101,:,:))'; 

%%
nIrr = (Irr_photonPacket_84586_2mm);
sIrr_photonPacket_84586_2mm = squeeze(nIrr(101,:,:))'; 

nIrr = (Irr_photonPacket_845860_2mm);
sIrr_photonPacket_845860_2mm = squeeze(nIrr(101,:,:))'; 

nIrr = (Irr_photonPacket_8458600_2mm);
sIrr_photonPacket_8458600_2mm = squeeze(nIrr(101,:,:))'; 

%% Visualization
close all;
Red = [237 28 36]./255; Yellow = [253 185 19]./255; Sky = [0 173 220]./255; Blue = [82 79 161]./255; Green = [203 219 42]./255; Gray = [180 180 180]./255;

% 1e4
figure(1);
subplot(321)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_singlePhoton_1e4_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([0 1]);
title('Intensity map (linear scale) - 1 min (10000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(322)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_singlePhoton_1e4_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([-5 0]);
title('Intensity map (semilog scale) - 1 min (10000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(323)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_photonPacket_84586_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([0 1]);
title('Intensity map (linear scale) - 1 min (84586 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(324)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_photonPacket_84586_2mm)); 
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar;  caxis([-5 0]);
title('Intensity map (semilog scale) - 1 min (84586 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(325)
plot(zz(1:end-1), (sIrr_singlePhoton_1e4_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), (sIrr_photonPacket_84586_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Linear scale) [A.U] - 1 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);

subplot(326)
plot(zz(1:end-1), log(sIrr_singlePhoton_1e4_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), log(sIrr_photonPacket_84586_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Semilog scale) [A.U] - 1 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);

% 1e5
figure(2);
subplot(321)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_singlePhoton_1e5_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([0 1]);
title('Intensity map (linear scale) - 10 min (100000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(322)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_singlePhoton_1e5_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([-6 0]);
title('Intensity map (semilog scale) - 10 min (100000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(323)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_photonPacket_845860_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([0 1]);
title('Intensity map (linear scale) - 10 min (845860 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(324)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_photonPacket_845860_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar; caxis([-6 0]);
title('Intensity map (semilog scale) - 10 min (845860 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(325)
plot(zz(1:end-1), (sIrr_singlePhoton_1e5_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), (sIrr_photonPacket_845860_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Linear scale) [A.U] - 10 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);

subplot(326)
plot(zz(1:end-1), log(sIrr_singlePhoton_1e5_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), log(sIrr_photonPacket_845860_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Semilog scale) [A.U] - 10 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);



% 1e6
figure(3);
subplot(321)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_singlePhoton_1e6_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar;
title('Intensity map (linear scale) - 100 min (1000000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(322)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_singlePhoton_1e6_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar;  caxis([-8 0]);
title('Intensity map (semilog scale) - 100 min (1000000 photons)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(323)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, (sIrr_photonPacket_8458600_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar;
title('Intensity map (linear scale) - 100 min (8458600 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');

subplot(324)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_photonPacket_8458600_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); colorbar;  caxis([-8 0]);
title('Intensity map (semilog scale) - 100 min (8458600 photon packets)', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w');
 
subplot(325)
plot(zz(1:end-1), (sIrr_singlePhoton_1e6_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), (sIrr_photonPacket_8458600_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Linear scale) [A.U] - 100 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);

subplot(326)
plot(zz(1:end-1), log(sIrr_singlePhoton_1e6_2mm(1:end-1,100)), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), log(sIrr_photonPacket_8458600_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
title('On-Axis Intensity (Semilog scale) [A.U] - 100 min', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18,'fontWeight','bold'); set(gcf,'color','w'); 
xlim([0 2]);




