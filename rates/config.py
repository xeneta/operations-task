from dotenv import load_dotenv
import os

load_dotenv()

DB = {
    "name": os.getenv('NAME'),
    "user": "postgres",
    "host": os.getenv('HOST'),
    "password": os.getenv('PASSWORD')
}
