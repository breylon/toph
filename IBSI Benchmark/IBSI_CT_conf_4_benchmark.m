clc;
clear;
close all;

addpath('C:\Users\ZhengQing\MATLAB Drive\Voxel-Based Radiomics Calculation Platform') % add your computer's path of Voxel-Based Radiomics Calculation Platform
load('IBSI_CT_conf_4_phantom.mat');

patient_id = 'IBSI_CT_conf_4';

phantom = phantom_2; % use phantom 1 to calc the Intensity features, and use phantom 2 to calc all the rest features
phantom_mask = ~isnan(phantom);
phantom_volume = phantom .* phantom_mask;

phantom_info.PixelDimensions = [1, 1, 1];
scale = 32;

feature = radiomics_feat_calc(patient_id, phantom_info, phantom, phantom_mask, scale);
save('IBSI_CT_conf_4_feature', 'feature')