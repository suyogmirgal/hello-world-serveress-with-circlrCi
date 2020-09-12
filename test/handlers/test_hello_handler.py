import json


def test_hello_world():
    from handlers.hello_handler import hello

    result = hello(event={}, context="Context")

    assert result['statusCode'] == 200
    assert json.loads(result['body'])['message'] == 'Hello World !!!!!!!!!'