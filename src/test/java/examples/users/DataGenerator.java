package examples.users;

import com.github.javafaker.Faker;

public class DataGenerator {
	
	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName() + faker.name().lastName() + "@gmail.com";
		return email;
	}
	
	public static String getPassword() {
		Faker faker = new Faker();
		String password = faker.funnyName().name().toString();
		return password;
	}
	
	public static String getTitle() {
		Faker faker = new Faker();
		String title = faker.name().title();
		return title;
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		String firstName = faker.name().firstName();
		return firstName;
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		String lastName = faker.name().lastName();
		return lastName;
	}
	
	public static String getGender() {
		Faker faker = new Faker();
		String gender = faker.demographic().sex();
		return gender;
	}
	
	public static String getMaritalStatus() {
		Faker faker = new Faker();
		String mStatus = faker.demographic().maritalStatus();
		return mStatus;
	}
	
	public static String getEmploymentStatus() {
		Faker faker = new Faker();
		String empStatus = faker.job().position();
		return empStatus;
	}
	
	public static String getDOB() {
		Faker faker = new Faker();
		String dateOfBirth = faker.date().birthday().toString();
		return dateOfBirth;
	}
	
	public static String getLanguagePref() {
		Faker faker = new Faker();
		String langPref = faker.random().toString();
		return langPref;
	}
	
	public static String getAddressType() {
		Faker faker = new Faker();
		String addressType = faker.address().country();
		return addressType;
	}
	
	public static String getAddressLine1() {
		Faker faker = new Faker();
		String addressLine1 = faker.address().fullAddress();
		return addressLine1;
	}
	
	public static String getCity() {
		Faker faker = new Faker();
		String city = faker.address().city();
		return city;
	}
	
	public static String getState() {
		Faker faker = new Faker();
		String state = faker.address().state();
		return state;
	}
	
	public static String getPostalCode() {
		Faker faker = new Faker();
		String postalCode = faker.address().zipCode();
		return postalCode;
	}
	
	public static String getCountryCode() {
		Faker faker = new Faker();
		String countryCode = faker.address().countryCode();
		return countryCode;
	}
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		String phoneNumber = faker.phoneNumber().cellPhone();
		return phoneNumber;
	}
	
	public static String getPhoneExtension() {
		Faker faker = new Faker();
		String phoneExtension = faker.phoneNumber().extension();
		return phoneExtension;
	}
	
	public static String getPhoneTime() {
		Faker faker = new Faker();
		String phoneTime = faker.address().timeZone();
		return phoneTime;
	}
	
	public static String getPhoneType() {
		Faker faker = new Faker();
		String phoneType = faker.phoneNumber().cellPhone();
		return phoneType;
	}
	

}
