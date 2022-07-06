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

import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class FirstTestCase {
	WebDriver driver = null;

	String testUrl = "https://www.saucedemo.com";
	String urlString = "https://www.saucedemo.com/inventory.html";
	String validUser = "standard_user";
	String validPass = "secret_sauce";
	String invalidUser = "user";
	String invalidPass = "sauce";

	@Before
	public void setup() {
		// Create an instance of Chrome for Selenium testing.
		System.setProperty("webdriver.chrome.driver","/<LOCAL_FILE_PATH>/chromedriver");
		driver = new ChromeDriver();
		// Visit the test site.
		driver.get(testUrl);
	}

	@Test
	public void NoUserNoPass() {
		driver.findElement(By.id("user-name")).sendKeys("");
		driver.findElement(By.id("password")).sendKeys("");
		driver.findElement(By.id("login-button")).click();
		
		// verifies the existence of the menu button.
		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertFalse(menuButton.size() > 0);
	}
	
	@Test
	public void InvalidUserNoPass() {
		driver.findElement(By.id("user-name")).sendKeys(invalidUser);
		driver.findElement(By.id("password")).sendKeys("");
		driver.findElement(By.id("login-button")).click();
				
		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertFalse(menuButton.size() > 0);
	}
	
	@Test
	public void InvalidUserInvalidPass() {
		driver.findElement(By.id("user-name")).sendKeys(invalidUser);
		driver.findElement(By.id("password")).sendKeys(invalidPass);
		driver.findElement(By.id("login-button")).click();
				
		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertFalse(menuButton.size() > 0);
	}
	
	@Test
	public void ValidUserNoPass() {
		driver.findElement(By.id("user-name")).sendKeys(validUser);
		driver.findElement(By.id("password")).sendKeys("");
		driver.findElement(By.id("login-button")).click();
				
		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertFalse(menuButton.size() > 0);
	}
	
	@Test
	public void ValidUserInvalidPass() {
		driver.findElement(By.id("user-name")).sendKeys(validUser);
		driver.findElement(By.id("password")).sendKeys(invalidPass);
		driver.findElement(By.id("login-button")).click();

		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertFalse(menuButton.size() > 0);
	}
	
	@Test
	public void ValidUserValidPass() throws InterruptedException {
		driver.findElement(By.id("user-name")).sendKeys(validUser);
		driver.findElement(By.id("password")).sendKeys(validPass);
		driver.findElement(By.id("login-button")).click();
		
		// 5-second delay.
		TimeUnit.SECONDS.sleep(5);
		
		List<WebElement> menuButton = driver.findElements(By.xpath("//*[@id=\"react-burger-menu-btn\"]"));
		assertTrue(menuButton.size() > 0);
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
