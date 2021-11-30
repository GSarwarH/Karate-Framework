package examples.users;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

import net.minidev.json.JSONObject;

public class DataGeneratorOneMethod {
	
	public static JSONObject getAllValues() {
		Faker faker = new Faker();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpledateformate = new SimpleDateFormat();
		String email = faker.name().firstName().toLowerCase() +faker.name().lastName().toLowerCase() +"@Gul.com";
		String password = faker.funnyName().name().toString();
		String title = faker.name().title();
		String firstName = faker.name().firstName();
		String lastName = faker.name().lastName();
		String gender = faker.demographic().sex();
		String mStatus = faker.demographic().maritalStatus();
		String empStatus = faker.job().position();
		String dateOfBirth = faker.date().birthday().toString();
		String langPref = faker.random().toString();
		String addressType = faker.address().country();
		String addressLine1 = faker.address().fullAddress();
		String city = faker.address().city();
		String state = faker.address().state();
		String postalCode = faker.address().zipCode();
		String countryCode = faker.address().countryCode();
		String phoneNumber = faker.phoneNumber().cellPhone();
		String phoneExtension = faker.phoneNumber().extension();
		String phoneTime = faker.address().timeZone();
		String phoneType = faker.phoneNumber().cellPhone();
		
		JSONObject json = new JSONObject();
		json.put("email", email);
		json.put("title", title);
		json.put("firstName", firstName);
		json.put("lastName", lastName);
		json.put("gender", gender);
		json.put("mStatus", mStatus);
		json.put("empStatus", empStatus);
		json.put("dateOfBirth", dateOfBirth);
		json.put("langPref", langPref);
		json.put("addressType", addressType);
		json.put("addressLine1", addressLine1);
		json.put("city", city);
		json.put("state", state);
		json.put("postalCode", postalCode);
		json.put("countryCode", countryCode);
		json.put("phoneNumber", phoneNumber);
		json.put("phoneExtension", phoneExtension);
		json.put("phoneTime", phoneTime);
		json.put("phoneType", phoneType);
		
		return json;
		
		
	}
	

}
