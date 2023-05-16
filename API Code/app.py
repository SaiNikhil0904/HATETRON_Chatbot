import pickle
from flask import Flask, request, jsonify
import pandas as pd
import numpy as np

app = Flask(__name__)

with open('grid.pkl', 'rb') as file:
    model = pickle.load(file)

@app.route('/', methods=['GET'])
def predict():
    text=request.args.get('text')
    s = pd.Series([text])
    y_pred = model.predict(s)
    print(y_pred)
    output={
        'result': y_pred.tolist()[0] # convert numpy array to a list
    }
    print(output)
    return jsonify(output)

if __name__ == '__main__':
    app.run()


