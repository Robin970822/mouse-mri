import os
import cc3d
import numpy as np

from matplotlib import pyplot as plt
from tqdm import tqdm

from utils_mri import get_itk_array, get_itk_image, write_itk_imageArray


def remove_small_region_from_label(label, connectivity=26):
    labels_out, N = cc3d.connected_components(
        label, connectivity=connectivity, return_N=True)
    max_volume = 0
    n = 0
    for segid in range(1, N+1):
        extracted_image = labels_out * (labels_out == segid)
        volume = np.sum(extracted_image)
        if volume > max_volume:
            max_volume = volume
            n = segid
    label_out = (labels_out == n).astype('uint8')
    return label_out


if __name__ == '__main__':
    root = 'E:/FDU/ISTBI/fMRI/fd_Dorr/Dorr_Turone_brain'
    label_array = get_itk_array(os.path.join(
        root, 'dorr2turone_labels.nii')).astype('uint8')
    labels = np.unique(label_array)
    labels_out = np.zeros_like(label_array)

    for l in tqdm(labels):
        l_label = (label_array == l).astype('uint8')
        label_out = remove_small_region_from_label(l_label)
        label_out *= l
        labels_out += label_out

    write_itk_imageArray(labels_out, os.path.join(root, 'dorr2turone_labels_refine.nii'),
                         get_itk_image(os.path.join(root, 'dorr2turone_labels.nii')))

