from pytest_bdd import scenario, given, when, then
import requests
import pytest
import json


@pytest.fixture(scope='function')
def context():
    return {}


@scenario('hello_world.feature', 'hello world GET api returns expected status code and body')
def test_hello_world(context):
    pass


@given("hello world application up and running")
def hello_world_app_running(context):
    health_response = requests.get('http://localhost:3000/dev/health')
    assert health_response.status_code == 200


@when("I make http request for GET hello-world")
def step_impl(context):
    context['hello_world_response'] = requests.get('http://localhost:3000/dev/hello-world')


@then("http response with status code OK and body is returned")
def step_impl(context):
    assert context['hello_world_response'].status_code == 200
    assert json.loads(context['hello_world_response'].text).get('message') == 'Hello World !!!!!!!!!'
