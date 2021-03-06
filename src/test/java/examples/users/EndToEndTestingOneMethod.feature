Feature: Hawks API testing with json body


  Background: 
    * def requestJsonBody = read('body.json')
    * def dataGenerator = Java.type('examples.users.DataGeneratorOneMethod')
    * set requestJsonBody.primaryPerson.email = dataGenerator.getValues().email
    * set requestJsonBody.primaryPerson.title = dataGenerator.getValues().title
    * set requestJsonBody.primaryPerson.firstName = dataGenerator.getValues().firstName
    * set requestJsonBody.primaryPerson.lastName = dataGenerator.getValues().lastName
    * set requestJsonBody.primaryPerson.gender = dataGenerator.getValues().gender
    * set requestJsonBody.primaryPerson.maritalStatus = dataGenerator.getValues().maritalStatus
    * set requestJsonBody.primaryPerson.employmentStatus = dataGenerator.getValues().employmentStatus
    * set requestJsonBody.primaryPerson.dateOfBirth = dataGenerator.getValues().dateOfBirth
    * set requestJsonBody.primaryPerson.languagePref = dataGenerator.getValues().languagePref
    * set requestJsonBody.primaryPersonMailingAddress.addressType = dataGenerator.getValues().addressType
    * set requestJsonBody.primaryPersonMailingAddress.addressLine1 = dataGenerator.getValues().addressLine1
    * set requestJsonBody.primaryPersonMailingAddress.city = dataGenerator.getValues().city
    * set requestJsonBody.primaryPersonMailingAddress.state = dataGenerator.getValues().state
    * set requestJsonBody.primaryPersonMailingAddress.postalCode = dataGenerator.getValues().postalCode
    * set requestJsonBody.primaryPersonMailingAddress.countryCode = dataGenerator.getValues().countryCode
    * set requestJsonBody.primaryPersonPhone.phoneNumber = dataGenerator.getValues().phoneNumber
    * set requestJsonBody.primaryPersonPhone.phoneExtension = dataGenerator.getValues().phoneExtension
    * set requestJsonBody.primaryPersonPhone.phoneTime = dataGenerator.getValues().phoneTime
    * set requestJsonBody.primaryPersonPhone.phoneType = dataGenerator.getValues().phoneType
    Given url 'https://www.test-insurance.com/api/v1'
    
     @json
    Scenario: payload request scenario
    Given path '/user'
    When request requestJsonBody
    And print requestJsonBody
    When method post
    Then status 200