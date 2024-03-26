clc;
clear;
close all;

addpath('.\Feature Library')

%% Phantom
patient_id = 'phantom';

image = zeros(30, 30, 15); % from 1-64
image(1 :10, 1 :10, :) = 11;
image(11:20, 1 :10, :) = 11 + randi([-5,   5], [10, 10, 15]);
image(21:30, 1 :10, :) = 11 + randi([-10, 10], [10, 10, 15]);
image(1 :15, 11:20, :) = 32;
image(11:20, 11:20, :) = 32 + randi([-5,   5], [10, 10, 15]);
image(21:30, 11:20, :) = 32 + randi([-10, 10], [10, 10, 15]);
image(1 :15, 21:30, :) = 54;
image(11:20, 21:30, :) = 54 + randi([-5,   5], [10, 10, 15]);
image(21:30, 21:30, :) = 54 + randi([-10, 10], [10, 10, 15]);
image_mask = ones(size(image));

image_info.PixelDimensions = [1, 1, 1];

%% Radiomics Calculation
config.Interpolation          = 'False';
config.Interpolation_Size     = [];
config.Interpolation_Method   = []; %'linear' or 'cubic' or 'nearest' 
config.Discretisation         = 'False';
config.Discretisation_Type    = 'FBN'; % 'FBN' or 'FBS'
config.Discretisation_BinNum  = [];
config.Discretisation_BinSize = [];
config.Resegmentation         = 'False';
config.Resegmentation_Range   = [];

feature = radiomics_feat_calc(patient_id, image, image_mask, image_info, config);
%id1 = strcat('radiomics_feature_', patient_id);
%save(id1, 'feature', '-v7.3')

%% Voxel-Based Radiomics Calculation  
config.Interpolation          = 'False';
config.Interpolation_Size     = [];
config.Interpolation_Method   = []; %'linear' or 'cubic' or 'nearest' 
config.Discretisation         = 'False';
config.Discretisation_Type    = 'FBN'; % 'FBN' or 'FBS'
config.Discretisation_BinNum  = [];
config.Discretisation_BinSize = [];
config.Resegmentation         = 'False';
config.Resegmentation_Range   = [];
config.Kernel                 = [3, 3, 3];
config.Stride                 = [1, 1, 1];

feature = voxel_based_radiomics_feat_calc(patient_id, image, image_mask, image_info, config);
%id2 = strcat('vbr_feature_', patient_id);
%save(id2, 'feature', '-v7.3')