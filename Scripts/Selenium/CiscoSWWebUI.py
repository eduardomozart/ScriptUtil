from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import TimeoutException
import time

options = webdriver.ChromeOptions()
options.add_argument('--ignore-certificate-errors')

browser = webdriver.Chrome(options=options)
browser.get('https://10.200.10.33/webui/')

delay = 3 # seconds
try:
    myElem = WebDriverWait(browser, delay).until(EC.presence_of_element_located((By.NAME, 'Username')))
    print("Page is ready!")
except TimeoutException:
    print("Loading took too much time!")

username = browser.find_element(By.NAME, 'Username')
password = browser.find_element(By.NAME, 'Password')

username.send_keys("yourUsername") #type your own username here
password.send_keys("yourPassword") #type your own password here

#browser.find_element(By.NAME, 'submit').click()

while True:
   try:
      browser.current_url
   except:
      break
