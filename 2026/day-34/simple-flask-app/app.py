import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)

# Database configuration using environment variables
# Format: postgresql://username:password@hostname:port/database_name
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv(
    'DATABASE_URL', 'postgresql://postgres:postgres@db:5432/flask_db'
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

@app.route('/')
def hello_world():
    try:
        # Simple query to check the connection
        result = db.session.execute(text('SELECT version();'))
        version = result.fetchone()[0]
        return f"<h1>Hello, World!</h1><p>Connected to: {version}</p>"
    except Exception as e:
        return f"<h1>Connection Failed</h1><p>{str(e)}</p>"

if __name__ == '__main__':
    # In a real container, we'd use a production server like Gunicorn
    app.run(host='0.0.0.0', port=5000)
