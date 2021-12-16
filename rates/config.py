from dotenv import load_dotenv
import os

load_dotenv()

DB = {
    "name": "postgres",
    "user": "postgres",
    "host": os.getenv('HOST'),
    "password": "password"
}
