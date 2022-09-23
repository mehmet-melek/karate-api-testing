Feature: Users feature

  Background:
    * url sutUrl

  Scenario: Get all users and then validate data size per page
    Given path 'api/users'
    # query param
    And param page = '1'
    When method get
    Then status 200
    # find field value
    * def listSize = response.per_page
    * print 'size should be: ', listSize
    # find size of array
    Then assert response.data.length == listSize

  Scenario: Get all users and then validate users schema
    Given path 'api/users'
    When method get
    Then status 200
    * def user = response.data
    # create json schema
    * def expectedUserSchema = { "id": #1,"email": "#string","first_name": "#string","last_name": "#string","avatar": "#string"}
    # validate each item of json array
    * match each user == expectedUserSchema

  Scenario: Get all users and then validate response time
    Given path 'api/users'
    When method get
    # validate response time
    Then assert responseTime < 1000

  Scenario: Get all users and then validate response headers
    Given path 'api/users'
    When method get
    # validate response headers
    Then match header Server == 'cloudflare'


  Scenario: Create user and then validate user created and response contains id
    # create json from file
    * def createUserRequest = read('/json/request/create-user-request.json')
    Given path 'api/users'
    And request createUserRequest
    When method post
    Then status 201
    * print response
    # validate field is exist and not null
    And match response contains {id: '#notnull'}
    # validate field type and validate field is not exist
    And match response contains { job: '#string', name: '#string', dummy: '#notpresent' }






