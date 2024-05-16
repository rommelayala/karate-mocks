@smoke
Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'http://localhost:8080'

  Scenario: The app has been deployed and the db is empty we need to create a new customer
    #Create a new customer
    Given path 'api/v1/customer'
    And request
    """
      {
        "id": 1,
        "name": "Lolo",
        "email": "lolo@lollo.com",
        "phone": "666777888999",
        "address": "Av. no existe s/n",
        "city": "Barcelona",
        "state": "Catalunya",
        "country": "España",
        "zip": "08901",
        "company": "Rommel",
        "position": "QA",
        "website": "www.lolo.com",
        "twitter": "string",
        "facebook": "string",
        "linkedin": "string",
        "github": "string",
        "instagram": "string",
        "youtube": "string",
        "tiktok": "string",
        "snapchat": "string",
        "twitch": "string",
        "other": "string",
        "notes": "string",
        "age": 1000
      }
      """
    When method post  
    Then status 201

  
  Scenario: Get all customers
    Given path 'api/v1/customer'
    When method get
    Then status 200
    * print "El response es ->", response
    * print "El numero de elementos del response es ->", karate.sizeOf(response)
    And match karate.sizeOf(response) == 1 
  

  Scenario: Modify the new customer with id = 1
    #Modify  a new customer
    Given path 'api/v1/customer'
    And request
    """
      {
        "id": 1,
        "name": "Lolo",
        "email": "lolo-modificado-karate@lolo.com",
        "phone": "777-777-777",
        "address": "Av. no existe s/n",
        "city": "Barcelona",
        "state": "Catalunya",
        "country": "España",
        "zip": "08901",
        "company": "Rommel",
        "position": "QA",
        "website": "www.lolo.com",
        "twitter": "string",
        "facebook": "string",
        "linkedin": "string",
        "github": "string",
        "instagram": "string",
        "youtube": "string",
        "tiktok": "string",
        "snapchat": "string",
        "twitch": "string",
        "other": "string",
        "notes": "string",
        "age": 1000
      }
      """
    When method put  
    Then status 200

  Scenario: Get customer using id =1
    Given path 'api/v1/customer/1'
    When method get
    Then status 200
    * print "El response es ->", response
    * print "El numero de elementos del response es ->", karate.sizeOf(response)
    #And match karate.sizeOf(response) == 1 
    And match response.email == 'lolo-modificado@lolo.com'
    And match response.phone == '777-777-777'

    Scenario: Patch name of the customer with id = 1
      Given path 'api/v1/customer/1' 
      And params { name : "Lolo Modificado"}
      When method patch  
      Then status 200
      And match response.name == 'Lolo Modificado'