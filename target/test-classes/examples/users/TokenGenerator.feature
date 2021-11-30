Feature: Generate Token

@tokenAuto
Scenario: This Scenario will generate token
* def dataGenerator = Java.type('examples.users.DataGenerator')
* def email = dataGenerator.getEmail()
* def password = dataGenerator.getPassword()
Given url 'https://www.test-insurance.com/api/v1'
And path '/adminRegistered'
When request {"email":#(email), "password":#(password)}
And method post
Then status 200
And print response
* def token = response.data.token.token
* print 'The token is: ', token