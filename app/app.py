from flask import Flask, jsonify, request

app = Flask(__name__)

items = []

@app.route('/')
def home():
    return jsonify({"message": "Hello from Flask!"})

@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(items)

@app.route('/items', methods=['POST'])
def add_item():
    data = request.get_json()
    items.append(data)
    return jsonify(data), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
