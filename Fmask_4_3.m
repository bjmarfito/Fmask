function Fmask_4_3(cldpix,sdpix,snpix,cldprob)
    if exist('cldpix','var')==1&&exist('sdpix','var')==1&&exist('snpix','var')==1
        if exist('cldprob','var')==1
            autoFmask('cloud',str2num(cldpix),'shadow',str2num(sdpix),'snow',str2num(snpix),'p',str2num(cldprob));
        else
            autoFmask('cloud',str2num(cldpix),'shadow',str2num(sdpix),'snow',str2num(snpix));
        end
    else
        % default buffering pixels for cloud, cloud shadow, and snow
        autoFmask();
    end
end