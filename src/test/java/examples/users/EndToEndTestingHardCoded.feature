Feature: End to End Testing for Rest API using Karate

Background:

	Given url 'https://www.test-insurance.com/api/v1'
	* def reslult = callonce read('TokenGenerator.feature')
	* def tokenValue = reslult.token
	
@saro
Scenario: End to End Testing
	Given headers {Authorization: '#("Bearer " + tokenValue)'}
	Given path '/user'
	When request
	"""
	{
  "primaryPerson": {
    "email": "mkj631@gmail.com",
    "title": "Mr.",
    "firstName": "Amit",
    "lastName": "Kadivar",
    "gender": "Male",
    "maritalStatus": "married",
    "employmentStatus": "employed",
    "dateOfBirth": "2020-06-21",
    "languagePref": "en"
  },
  "primaryPersonMailingAddress": {
    "addressType": "India",
    "addressLine1": "India",
    "city": "Rajkot",
    "state": "Gujarat",
    "postalCode": "360004",
    "countryCode": "91"
  },
  "primaryPersonPhone": {
    "phoneNumber": "+91999998232",
    "phoneExtension": "abb",
    "phoneTime": "10",
    "phoneType": "mobile"
  }
	}
	"""
	And method post
	Then status 200
	And print response
	* match response.meta.code ==200
	* match response.meta.status == 'success'
	* match response.data.primaryPerson.email == 'mkj631@gmail.com'
	* def accoundId = response.data.account.accountId
	* print accoundId
	Given url 'https://www.test-insurance.com/api/v1'
	And headers {Authorization: '#("Bearer " + tokenValue)'}
	And path '/user/' + accoundId
	When method get
	Then status 200
	And print response
	Given url 'https://www.test-insurance.com/api/v1'
	And headers {Authorization: '#("Bearer " + tokenValue)'}
	And path '/user/' + accoundId
	When method delete
	Then status 200
	And print response
	And match response.data == 'Record successfuly deleted'
	
	