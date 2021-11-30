Feature: End to End Testing for Rest API using Karate

  Background: 
  	* def dataGenerator = Java.type('examples.users.DataGenerator')
    * def emailValue = dataGenerator.getEmail()
    * def titleValue = dataGenerator.getTitle()
    * def firstNameValue = dataGenerator.getFirstName()
    * def lastNameValue = dataGenerator.getLastName()
    * def genderValue = dataGenerator.getGender()
    * def maritalStatusValue = dataGenerator.getMaritalStatus()
    * def employmentStatusValue = dataGenerator.getEmploymentStatus()
    * def dobValue = '1999-12-12'
    * def langPrefValue = dataGenerator.getLanguagePref()
    * def addressTypeValue = dataGenerator.getAddressType()
    * def addressLine1Value = dataGenerator.getAddressLine1()
    * def cityValue = dataGenerator.getCity()
    * def stateValue = dataGenerator.getState()
    * def postalCodeValue = dataGenerator.getPostalCode()
    * def countryCodeValue = dataGenerator.getCountryCode()
    * def phoneNumberValue = dataGenerator.getPhoneNumber()
    * def phoneExtensionValue = dataGenerator.getPhoneExtension()
    * def phoneTimeValue = dataGenerator.getPhoneTime()
    * def phoneTypeValue = dataGenerator.getPhoneType()
    Given url 'https://www.test-insurance.com/api/v1'
    * def reslult = callonce read('TokenGenerator.feature')
    * def tokenValue = reslult.token

  @saroAutoMulti
  Scenario Outline: End to End Testing
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user'
    When request
      """
      {
      "primaryPerson":{
              "email" : "<email>",
              "title":"<title>",
              "firstName":"<firstName>",
              "lastName":"<lastName>",
              "gender":"<gender>",
              "maritalStatus":"<maritalStatus>",
              "employmentStatus":"<employmentStatus>",
              "dateOfBirth":"<dateOfBirth>",
              "languagePref":"<languagePref>"
          },
          "primaryPersonMailingAddress":{
              "addressType":"<addressType>",
              "addressLine1":"<addressLine1>",
              "city":"<city>",
              "state":"<state>",
              "postalCode":"<postalCode>",
              "countryCode":"<countryCode>"
          },
          "primaryPersonPhone":{
              "phoneNumber":"<phoneNumber>",
              "phoneExtension":"<phoneExtension>",
              "phoneTime": "<phoneTime>",
              "phoneType":"<phoneType>"
      
          }
      }
      """
    And method post
    Then status 200
    And print response
    * match response.meta.code ==200
    * match response.meta.status == 'success'
    * match response.data.primaryPerson.email == '<email>'
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
    
    Examples:
      | email         | title         | firstName      | lastName         | gender         | maritalStatus         | employmentStatus         | dateOfBirth | languagePref     | addressType         | addressLine1         | city         | state         | postalCode         | countryCode         | phoneNumber         | phoneExtension         | phoneTime         | phoneType         |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |
      | #(emailValue) | #(titleValue) | firstNameValue | #(lastNameValue) | #(genderValue) | #(maritalStatusValue) | #(employmentStatusValue) | #(dobValue) | #(langPrefValue) | #(addressTypeValue) | #(addressLine1Value) | #(cityValue) | #(stateValue) | #(postalCodeValue) | #(countryCodeValue) | #(phoneNumberValue) | #(phoneExtensionValue) | #(phoneTimeValue) | #(phoneTypeValue) |

   