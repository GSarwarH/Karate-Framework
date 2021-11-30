Feature: End to End Testing for Rest API using Karate

  Background: 
    Given url 'https://www.test-insurance.com/api/v1'
    * def reslult = callonce read('TokenGenerator.feature')
    * def tokenValue = reslult.token

  @saroOutline
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
      | email          | title | firstName | lastName | gender | maritalStatus | employmentStatus | dateOfBirth | languagePref | addressType | addressLine1 | city      | state | postalCode | countryCode | phoneNumber | phoneExtension | phoneTime | phoneType |
      | guye@gmail.com | Mr.)  | Ghulam    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gusfye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gusfy2e@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gus3fye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gus4fye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gu5sfye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | gu6sfye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | g2usfye@gmail.com | Mr.)  | Sakhi    | hassan   | Male   | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
