from __future__ import division, print_function
import sys
import os
import glob
import re
from pathlib import Path

# Import fast.ai Library
from fastai import *
from fastai.vision import *

# Flask utils
from flask import Flask, redirect, url_for, request, render_template
from werkzeug.utils import secure_filename


#load model
def load_model(model_path):
   #  path = Path(model_path)
   #  classes = ['Abstract Art',
   #  'Abstract Expressionism',
   #  'Academicism',
   #  'Analytical Cubism',
   #  'Art Nouveau (Modern)',
   #  'Baroque',
   #  'Cloissonism',
   #  'Cubism',
   #  'Cubist Period',
   #  'Dada',
   #  'Expressionism',
   #  'Impressionism',
   #  'Japonism',
   #  'Metaphysical art',
   #  'Naïve Art (Primitivism)',
   #  'Neo-baroque',
   #  'Neoclassicism',
   #  'Op Art',
   #  'Orientalism',
   #  'Pointillism',
   #  'Pop Art',
   #  'Post-Impressionism',
   #  'Realism',
   #  'Surrealism',
   #  'Symbolism',
   #  'Synthetic Cubism']
   #  data2 = ImageDataBunch.single_from_classes(path, classes, ds_tfms=get_transforms(), size=224).normalize(imagenet_stats)
   #  learn = create_cnn(data2, models.resnet34)
   #  learn.load('stage-2')
   learn.load_learner(model_path, 'stage-2-50.pkl')
    return learn

def model_predict(img_path, model_path):
    """
       model_predict will return the preprocessed image
    """
    learn = load_model(model_path)
    img = open_image(img_path)
    pred_class,pred_idx,outputs = learn.predict(img)
    return pred_class
