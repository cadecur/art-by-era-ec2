from flask import render_template, redirect, url_for, request, send_from_directory, flash
from app import app
import os
from werkzeug import secure_filename
from app import predictor 

@app.route('/<filename>')
def get_file(filename):
    return send_from_directory('static',filename)

@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            save_to=(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            file.save(save_to)
            pred_class=predictor.model_predict(save_to, '/home/ubuntu/cs121/app')
            return render_template('displayResult.html', filename=filename, prediction=pred_class)
    return render_template('index.html')

# allowed image types
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'PNG', 'JPG', 'JPEG'])
app.config['ALLOWED_EXTENSIONS']=ALLOWED_EXTENSIONS

# is file allowed to be uploaded?
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in app.config['ALLOWED_EXTENSIONS']
