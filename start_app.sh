env/bin/gunicorn --access-logfile - --workers 3 --bind 0.0.0.0:9003 calculator.wsgi:application
