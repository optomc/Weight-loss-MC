%% Visualization
close all;
Red = [237 28 36]./255; Yellow = [253 215 19]./255; Sky = [0 173 220]./255; Blue = [82 79 161]./255; Green = [203 219 42]./255; Gray = [210 210 210]./255;

%%
% 1e4
figure(1);

subplot(221)
plot(zz(1:end-1), (sIrr_singlePhoton_1e4_2mm(1:end-1,100)*1.1), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), (sIrr_photonPacket_84586_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
ylabel('Axial Intensity [A.U]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
title('1 min (linear scale)', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w'); 
legend('10000 photons (Our method)','84586 photon packet (Weight-loss)')
xlim([0 1.5]);

subplot(222)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_singlePhoton_1e4_2mm*1.1));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); colorbar; caxis([-4.5 0]);
title('Direct photon flux recording', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w');
 

subplot(223)
plot(zz(1:end-1), log(sIrr_singlePhoton_1e4_2mm(1:end-1,100)*1.1), 'Color', Yellow, 'LineWidth', 2);  ylim([-4.5 0]); hold on;
plot(zz(1:end-1), log(sIrr_photonPacket_84586_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2); ylim([-4.5 0]);
ylabel('Axial Intensity [A.U]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
title('1 min (semilog scale)', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w'); 
legend('10000 photons (Our method)','84586 photon packet (Weight-loss)')
xlim([0 1.5]); 

subplot(224)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_photonPacket_84586_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); colorbar; caxis([-4.5 0]);
title('Weight-loss approach', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w');

%%
figure(2);

subplot(221)
plot(zz(1:end-1), (sIrr_singlePhoton_1e5_2mm(1:end-1,100)*1.1), 'Color', Yellow, 'LineWidth', 2); hold on;
plot(zz(1:end-1), (sIrr_photonPacket_845860_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2);
ylabel('Axial Intensity [A.U]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
title('10 min (linear scale)', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w'); 
legend('100000 photons (Our method)','845860 photon packet (Weight-loss)')
xlim([0 1.5]);

subplot(222)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_singlePhoton_1e5_2mm*1.1));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); colorbar; caxis([-6 0]);
title('Direct photon flux recording', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w');
 

subplot(223)
plot(zz(1:end-1), log(sIrr_singlePhoton_1e5_2mm(1:end-1,100)*1.1), 'Color', Yellow, 'LineWidth', 2);  ylim([-6 0]); hold on;
plot(zz(1:end-1), log(sIrr_photonPacket_845860_2mm(2:end,100)), 'Color', Red, 'LineWidth', 2); ylim([-6 0]);
ylabel('Axial Intensity [A.U]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
xlabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
title('10 min (semilog scale)', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w'); 
legend('100000 photons (Our method)','845860 photon packet (Weight-loss)')
xlim([0 1.5]); 

subplot(224)
zz = (1:201)*0.01;
yy = ((1:201)-101)*0.01;
imagesc(yy, zz, log(sIrr_photonPacket_845860_2mm));
xlabel('Off-Axis Shift r [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
ylabel('Depth z [mm]', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); colorbar; caxis([-6 0]);
title('Weight-loss approach', 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 21,'fontWeight','bold'); set(gcf,'color','w');