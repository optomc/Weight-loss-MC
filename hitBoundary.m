function [hit, s, sLeft] = hitBoundary(photon, MC, s)
    
    if (sign(photon.Dir(3))>0)
        t = rayPlaneIntersects([0 0 MC.layerDepth(photon.CurMed+1)], photon.PrevPos, photon.Dir); % Distance to the boundary
    else
        t = rayPlaneIntersects([0 0 MC.layerDepth(photon.CurMed)], photon.PrevPos, photon.Dir); % Distance to the boundary
    end
       
    if (s > t)
        mut = MC.mua(curLayer) + MC.mus(curLayer);
        sLeft = (s - t) * mut;
        s = t;
        hit = 1;        
    else
        hit = 0; 
        sLeft = 0;
    end
end

