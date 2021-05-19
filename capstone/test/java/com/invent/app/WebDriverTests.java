package com.invent.app;

import java.util.concurrent.TimeUnit;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

import io.github.bonigarcia.wdm.WebDriverManager;

public class WebDriverTests {

static WebDriver driver;

static String url="http://localhost:2500/capstone";

static String co_link="COMPANY";

@BeforeClass
public static void openBrowser() {  
    //System.setProperty("webdriver.ie.driver", "C:\\ws\\drivers\\IEDriverServer.exe");
        //driver=new InternetExplorerDriver();   
WebDriverManager.chromedriver().setup();
    //System.setProperty("webdriver.chrome.driver", "C:\\ws\\drivers\\chromedriver.exe");
        
driver = new ChromeDriver();  
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        
    }
    
@Test
@Ignore
public void test() throws InterruptedException {
	
	driver.get("https://login.yahoo.com");
	Thread.sleep(3000);
	driver.findElement(By.className("username")).sendKeys("puri_tchick@yahoo.com");
	Thread.sleep(3000);
	driver.findElement(By.name("signin")).click();
	Thread.sleep(3000);
}

@Test
//@Ignore
public void login() throws InterruptedException {
driver.get(url+"/login"); //is using the static url above 
driver.findElement(By.name("email")).sendKeys("im@email.com");
//Thread.sleep(3000);
driver.findElement(By.name("password")).sendKeys("anyTh1n!");
    //Thread.sleep(3000);
    driver.findElement(By.id("submitter")).click(); 
    Thread.sleep(3000);
    driver.getPageSource().contains("Dashboard");
    driver.findElement(By.linkText("LOGOUT")).click();
    driver.getPageSource().contains("You have been logged out");
    Thread.sleep(3000);
}

@Test
@Ignore
public void google() throws InterruptedException {
driver.get("https://www.google.com/");
Thread.sleep(300);
}

@Test
//@Ignore
public void testheader() throws InterruptedException {
testlink("index");
Thread.sleep(30);
testlink("about");
Thread.sleep(30);
testlink("contact");
Thread.sleep(30);
testlink("customers");

}

public synchronized void testlink(String page) throws InterruptedException {
driver.get("http://localhost:2500/capstone/"+page+"");
driver.findElement(By.linkText("HOME")).click();

hover(co_link); 
driver.findElement(By.linkText("CONTACT")).click(); 
hover(co_link);
    driver.findElement(By.linkText("ABOUT US")).click();
    hover(co_link);
    driver.findElement(By.linkText("CLUB MEMBERS")).click();
 
driver.findElement(By.linkText("LOGIN")).click();
driver.get("http://localhost:2500/capstone");
driver.findElement(By.linkText("REGISTER")).click();
driver.get("http://localhost:2500/capstone");
Thread.sleep(300);

}

@Test
@Ignore
public void testEmail() {
driver.get(url+"/contact");
driver.findElement(By.name("name")).sendKeys("George Omollo");
driver.findElement(By.name("email")).sendKeys("xx@gmail.com");
driver.findElement(By.name("subject")).sendKeys("WebDriver Test Email");
driver.findElement(By.name("message")).sendKeys("This is a test email from Claim tutorials for Web Driver");
driver.findElement(By.id("contact-submit")).click(); 

}

public void hover(String link) {
Actions builder = new Actions(driver);
WebElement element = driver.findElement(By.linkText(link));
builder.moveToElement(element).build().perform();
}


@AfterClass
public static void closeBrowser() {
driver.quit();
}



}