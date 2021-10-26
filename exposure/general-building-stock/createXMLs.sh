#!/bin/bash
#Bash script to create xml files for new exposure files. Assumes existence of a template file, as named below, in same folder as new expo csv files. Run from the same folder as csv's and template. Written by TEH on 26 Oct 2021.


template='oqBldgExp_REGION.xml' #use exactly 'REGION' in template name

declare -a regions=("AB_T_CalgaryMetro"
"AB_T_CalgaryOutskirts"
"AB_T_EdmontonOuter"
"AB_T_EdmontonWest"
"AB_T_Northern"
"BC_V_Capital"
"BC_V_Coastal"
"BC_V_FraserValley"
"BC_V_GreaterVancouverNorth"
"BC_V_GreaterVancouverSouth"
"BC_V_Misc"
"BC_V_OkanaganKootenay"
"MB_R_Misc"
"MB_R_Winnipeg"
"NB_E"
"NL_A"
"NS_B"
"NT_X"
"NU_X"
"ON_K_KingstonPembroke"
"ON_K_Misc"
"ON_K_OttawaRegion"
"ON_L_BarrieRegion"
"ON_L_HamiltonNiagara"
"ON_L_Misc"
"ON_L_Peel"
"ON_M_TorontoEast"
"ON_M_TorontoWest"
"ON_N_LondonRegion"
"ON_N_Misc"
"ON_N_SarniaWindsor"
"ON_N_Waterloo"
"ON_P_Misc"
"ON_P_NorthernOntario"
"PE_C"
"QC_G_CharlevoixSaguenay"
"QC_G_Misc"
"QC_G_QuebecCity"
"QC_G_TroisRivieresWest"
"QC_H_Misc"
"QC_H_Montreal"
"QC_J_EasternTownships"
"QC_J_Gatineau"
"QC_J_Misc"
"QC_J_NorthWestShoreMTL"
"QC_J_SouthEastShoreMTL"
"SK_S_Misc"
"SK_S_ReginaSaskatoon"
"YT_Y")

nameheader=`echo $template | awk -F'REGION' '{print $1}'`
namefooter=`echo $template | awk -F'REGION' '{print $2}'`

for region in "${regions[@]}"; do
    sed "s/{REGION}/$region/" $template > ${nameheader}${region}${namefooter}
done