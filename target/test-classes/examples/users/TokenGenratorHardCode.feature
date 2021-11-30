Feature: Token Generator Hrd code

@token
Scenario: This Scenario will generate token
Given url 'https://www.test-insurance.com/api/v1'
And path '/adminRegistered'
When request {"email":"bldfshtr21@gmail.com", "password":"123456"}
And method post
Then status 200
And print response
* def token = response.data.token.token
* print 'The token is: ', token

