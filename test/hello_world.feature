Feature: Hello World Simple Serverless Application

    Scenario: hello world GET api returns expected status code and body
        Given hello world application up and running
        When I make http request for GET hello-world
        Then http response with status code OK and body is returned