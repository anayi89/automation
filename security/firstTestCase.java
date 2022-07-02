package saucedemopackage;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class firstTestCase {
	WebDriver driver = null;
	
	String test_url = "https://www.saucedemo.com";
	
	String valid_user = "standard_user";
	String valid_pass = "secret_sauce";
	String invalid_user = "user";
	String invalid_pass = "sauce";
		
	@Before
	public void setup() {
		// Create an instance of Chrome for Selenium testing.
		System.setProperty("webdriver.chrome.driver","/<LOCAL_FILE_PATH_OF_CHROME_DRIVE>/chromedriver");
		driver = new ChromeDriver();
		
		// Visit the test site.
		driver.get(test_url);
	}

	@Test
	public void NoUserNoPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys("");
		
		// Enter the password.
		password.sendKeys("");
		
		// Submit the credentials.
		login.click();
	}
	
	@Test
	public void InvalidUserNoPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys(invalid_user);
		
		// Enter the password.
		password.sendKeys("");
		
		// Submit the credentials.
		login.click();
	}
	
	@Test
	public void InvalidUserInvalidPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys(invalid_user);
		
		// Enter the password.
		password.sendKeys(invalid_pass);
		
		// Submit the credentials.
		login.click();
	}
	
	@Test
	public void ValidUserNoPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys(valid_user);
		
		// Enter the password.
		password.sendKeys("");
		
		// Submit the credentials.
		login.click();
	}
	
	@Test
	public void ValidUserInvalidPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys(valid_user);
		
		// Enter the password.
		password.sendKeys(invalid_pass);
		
		// Submit the credentials.
		login.click();
	}
	
	@Test
	public void ValidUserValidPass() {
		WebElement username = driver.findElement(By.id("user-name"));
		WebElement password = driver.findElement(By.id("password"));
		WebElement login = driver.findElement(By.id("login-button"));
		
		// Enter the username.
		username.sendKeys(valid_user);
		
		// Enter the password.
		password.sendKeys(valid_pass);
		
		// Submit the credentials.
		login.click();
	}
	
	@After
	public void teardown() throws IOException {
		// Take a screenshot.
		File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		FileUtils.copyFile(scrFile, new File("/<LOCAL_FILE_PATH>/test_screenshot.png"));
				
		// Quit Chrome.
		driver.quit();
	}	
}
