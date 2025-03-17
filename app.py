import requests
from flask import Flask, jsonify

app = Flask(__name__)


def get_latest_launch():
    url = "https://api.spacexdata.com/v5/launches/latest"
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    else:
        return {"error": "Failed to retrieve launch data"}


@app.route("/latest-launch", methods=["GET"])
def latest_launch():
    launch_data = get_latest_launch()
    return jsonify(launch_data)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4000)
