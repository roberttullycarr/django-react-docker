# remove content of front (previous data) and copy from tmp folder to /frontend to reflect updates
python manage.py makemigrations
python manage.py migrate
# python manage.py collectstatic --no-input
gunicorn -w 4 -b 0.0.0.0:8000 project.wsgi:application



