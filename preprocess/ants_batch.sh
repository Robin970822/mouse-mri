#!/usr/bin/bash
echo Usage: sh ants_batch.sh [input_folder] [template] [reference]

InputFolder=$1
Template=$2
Reference=$3

echo $InputFolder
cd $InputFolder

for subpath in $(ls ./)
do
    echo $subpath
    cd $subpath
    antsRegistrationSyN.sh -d 3 -f T2_BET.nii -m meanarest.nii -t 'r' -o f2a_
    antsRegistrationSyN.sh -d 3 -f $Template -m T2_BET.nii -o a2t_
    antsApplyTransforms -d 3 -i rarest.nii -o wrarest.nii.gz -r $Reference -t a2t_1Warp.nii.gz -t a2t_0GenericAffine.mat -t f2a_0GenericAffine.mat -e 3
    echo $subpath Done.
    cd ..
done

