%% NOTE: "CALCULATE STEP SIZE"
function s = stepSize(MC)
% sample a new step size for photons
mus = MC.mus;
mua = MC.mua;

if (mus ~= 0)    
    s=-log(rand)/(mua+mus);
else
    s=10;
end

