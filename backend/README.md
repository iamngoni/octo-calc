# Calculator Backend
Backend service for a calculator program

## Requirements
- Python
- Pip

Run the following command to install service dependencies
```shell
$ python -m venv env && source env/bin/activate
$ pip install -r requirements.txt
```

## Database Tables Migrations
```shell
$ python manage.py makemigrations
$ python manage.py migrate
```

## Running the service
```shell
$ python manage.py runserver 8000
```

Or you can use the service already hosted on [digitalocean](https://calculator.modestnerd.co).

## Historical Records
```shell
$ curl --location --request GET 'http://127.0.0.1:8000/api/1.0/calculate'
```

### Response
```json
{
    "request_id": "request_3FouevyqwGdslQ3sgLmNU90YxGn",
    "status": true,
    "status_description": "Request was executed successfully",
    "message": "OK",
    "data": {
        "operations": [
            {
                "id": "co_WAnThGuCAaqRrzvEJVT7GgmWEutoUKbE",
                "created_at": "2023-01-24T23:42:12.226134+02:00",
                "updated_at": "2023-01-24T23:42:12.226158+02:00",
                "deleted_at": null,
                "num_one": 1,
                "num_two": 3.4,
                "operation": "+",
                "result": 4.4
            },
            {
                "id": "co_A7s5ZPYDZqV5J0S18EgegQBLY53nf0AN",
                "created_at": "2023-01-24T23:42:36.570397+02:00",
                "updated_at": "2023-01-24T23:42:36.570420+02:00",
                "deleted_at": null,
                "num_one": 1,
                "num_two": 3.4,
                "operation": "+",
                "result": 4.4
            },
            {
                "id": "co_mOQqQPQOivDblkUV4SgFIJVYYIFKmbQC",
                "created_at": "2023-01-24T23:42:45.476169+02:00",
                "updated_at": "2023-01-24T23:42:45.476189+02:00",
                "deleted_at": null,
                "num_one": 1,
                "num_two": 3.4,
                "operation": "-",
                "result": -2.4
            },
            {
                "id": "co_oKGd2rxBpcnPNGxPrbQSM7bwEuMsOm0Z",
                "created_at": "2023-01-24T23:42:52.395181+02:00",
                "updated_at": "2023-01-24T23:42:52.395195+02:00",
                "deleted_at": null,
                "num_one": 1,
                "num_two": 3.4,
                "operation": "*",
                "result": 3.4
            },
            {
                "id": "co_D9l8y5QIGQ98rMpN6w4Z5Q2MloG1Wo7G",
                "created_at": "2023-01-24T23:45:38.090319+02:00",
                "updated_at": "2023-01-24T23:45:38.090408+02:00",
                "deleted_at": null,
                "num_one": 1,
                "num_two": 3.4,
                "operation": "//",
                "result": 0
            }
        ]
    },
    "issues": null,
    "version": 1,
    "versioned_by": "ModestNerds, Co"
}
```

## Calculate
```shell
$ curl --location --request POST 'http://127.0.0.1:8000/api/1.0/calculate' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=ST8AhlT4xAM7zNCGgfqF37y8V1WmIvMk' \
--data-raw '{
    "num_one": 1,
    "num_two": 3.4,
    "operation": "**"
}'
```

### Response
```json
{
    "request_id": "request_OodN5bvYofP2U9jWaA34anbLQnh",
    "status": true,
    "status_description": "Request was executed successfully",
    "message": "OK",
    "data": {
        "operation": {
            "id": "co_NVxIu0nzqHcCZfVXCWRQfsm58FEKML27",
            "created_at": "2023-01-24T23:46:52.477101+02:00",
            "updated_at": "2023-01-24T23:46:52.477157+02:00",
            "deleted_at": null,
            "num_one": 1.0,
            "num_two": 3.4,
            "operation": "**",
            "result": 1.0
        }
    },
    "issues": null,
    "version": 1.0,
    "versioned_by": "ModestNerds, Co"
}
```

---

The Postman collection is also attached in the same repo [here](./Econet%20Assessment.postman_collection.json).

---

[Google Drive Link](https://drive.google.com/file/d/1B6Km3NfVe-y94ppJ_Exg_u-Y1x7PYfoC/view?usp=sharing)