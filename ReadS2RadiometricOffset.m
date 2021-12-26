function [band_offsets, quantif] = ReadS2RadiometricOffset(FilesInfo)
% This funciton is to read the Sentinel-2's radiometric offset for the
% version with Basline 4.00
%
% Return Empty means old version data
%
% Created on 16/12/2021

    filepath_meta = dir(fullfile(FilesInfo.InspireXML, 'M*L1C.xml')); % which is same location as inspire xml
    S = xml2struct(fullfile(FilesInfo.InspireXML, filepath_meta.name));
    quantif = str2num(S.n1_colon_Level_dash_1C_User_Product.n1_colon_General_Info.Product_Image_Characteristics.QUANTIFICATION_VALUE.Text);
    try
        Radiometric_Offset_List = S.n1_colon_Level_dash_1C_User_Product.n1_colon_General_Info.Product_Image_Characteristics.Radiometric_Offset_List.RADIO_ADD_OFFSET;

        band_offsets = zeros(length(Radiometric_Offset_List), 2);
        for i = 1: length(Radiometric_Offset_List)
            offset_value = str2num(Radiometric_Offset_List{1, i}.Text);
            band_id = str2num(Radiometric_Offset_List{1, i}.Attributes.band_id);
            band_offsets(i,1) = band_id;
            band_offsets(i,2) = offset_value;
        end
    catch
        band_offsets = [];
    end
end
