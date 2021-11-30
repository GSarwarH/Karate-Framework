Feature: Token Generator for one method

@oneMethodJson
Scenario: This Scenario will generate token for one method
	* def dataGenerator = Java.type('examples.users.DataGenerator')
	* def email = dataGenerator.getEmail()
	* def password = dataGenerator.getPassword()
	When url 'https://www.test-insurance.com/api/v1'
	And path '/adminRegistered'
	When request {"email":#(email),"password":#(password)}
	And method post
	Then status 200
	And print response
	* def token = response.data.token.token
	* print 'the toke is: ', token
