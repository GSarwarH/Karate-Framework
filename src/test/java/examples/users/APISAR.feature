Feature: My First Karate Feature File

  Background: 
    Given url 'https://jsonplaceholder.typicode.com'

  @getMethod
  Scenario: Get all posts
    Given path '/posts'
    When method get
    Then status 200
    * def firstID = response[0].id
    * match firstID == 1
    * print 'The first ID is: ' ,firstID
    * def title = response[0].title
    * match title contains 'repellat'
    * print 'The Title is: ', title
    * def body = response[0].body
    * match body contains 'consequuntur'
    * print 'The body is: ', body

  @createMthod
  Scenario: create a post
    Given path '/posts'
    And request
      """
      {
      		"userId": 10,
          "id": 101,
          "title": "laboriosam dolor voluptates",
          "body": "This is my first post method"
      }
      """
    When method post
    Then status 201
    * def userId = response.userId
    * match userId == 10
    * print 'The User ID is: ', userId
    * def id = response.id
    * match id == 101
    * print 'The id is: ', id
    * def title = response.title
    * match title contains 'dolor'
    * print 'The Title is: ', title
    * def body = response.body
    * match body contains 'method'
    * print 'The body is: ', body

  @outline
  Scenario Outline: create a post outline
    Given path '/posts'
    And request
      """
      {	"userId": <userId>,
         "id": <id>,
         "title": "<title>",
         "body": "<body>"
      }
      """
    When method post
    Then status 201
    * def userID = response.userId
    * match userID == <userId>
    * def id = response.id
    * match id == <id>
    * def title = response.title
    * match title contains '<title>'
    * def body = response.body
    * match body contains '<body>'

    Examples: 
      | userId | id  | title                                 | body                          |
      |     10 | 101 | This is the post method with outline1 | this is body for post method1 |
      |     10 | 101 | This is the post method with outline2 | this is body for post method2 |
      |     10 | 101 | This is the post method with outline3 | this is body for post method3 |
      |     10 | 101 | This is the post method with outline4 | this is body for post method4 |
      |     10 | 101 | This is the post method with outline5 | this is body for post method5 |
