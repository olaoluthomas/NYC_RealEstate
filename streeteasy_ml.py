import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

# 1. get selenium to load the first page with first 10 of all available listings
url = "http://streeteasy.com/for-sale/nyc/status:listed?refined_search=true"
driver = webdriver.Chrome()
driver.get(url)


# 2. place a function that will iterate through each listing on the page and retrieve further info

# 3. repeat 1 and 2 for the next 10 listings and so on...