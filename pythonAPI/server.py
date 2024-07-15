import transformers
from transformers import pipeline
from flask import Flask, request, jsonify

app = Flask(__name__)

sentiment_pipeline = pipeline("sentiment-analysis")#this is the basic oone

classifier = pipeline("text-classification",model='bhadresh-savani/distilbert-base-uncased-emotion', return_all_scores=True)#tgihs is the second one

@app.route("/create-user", methods=["POST"])
def create_user():
    data = request.get_json()

    data2=request.get_json()


    if 'username' in data:
        username = data['username']


        sentiment_result = sentiment_pipeline(username)


        emotion_result = classifier(username)

        # emotion_reuslt classifier(username)

        combined_result = {
            "sentiment": sentiment_result,
            "emotion": emotion_result
        }

        return jsonify(combined_result), 201
    else:
        return jsonify({"error": "Missing 'username' key in JSON data"}), 400

if __name__ == "_main_":
    app.run(debug=True)