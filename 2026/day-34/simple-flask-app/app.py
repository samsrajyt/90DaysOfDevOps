import os
import redis
from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)

# Config
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'postgresql://postgres:postgres@db:5432/flask_db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Redis
cache = redis.Redis(host=os.getenv('REDIS_HOST', 'redis'), port=6379, decode_responses=True)

@app.route('/')
def index():
    context = {
        "db_status": False,
        "db_version": None,
        "redis_status": False,
        "source": "None"
    }

    # Check Database & Redis
    try:
        # Check Redis first
        version = cache.get('db_version')
        context["redis_status"] = True
        context["source"] = "Cache"

        if not version:
            # Fallback to Postgres
            result = db.session.execute(text('SELECT version();'))
            version = result.fetchone()[0]
            cache.setex('db_version', 30, version) # Cache for 30s
            context["source"] = "Database"
        
        context["db_status"] = True
        context["db_version"] = version

    except Exception as e:
        print(f"Error checking status: {e}")

    return render_template('index.html', **context)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
