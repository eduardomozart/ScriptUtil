from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

browser = webdriver.Chrome()
browser.get('https://vpn.example.com:8433/')

username = browser.find_element(By.NAME, 'username')
password = browser.find_element(By.NAME, 'password')

username.send_keys("yourUsername") #type your own username here
password.send_keys("yourPassword") #type your own password here

#browser.find_element(By.NAME, 'submit').click()

while True:
   try:
      browser.current_url
   except:
      break
