import os

from GetElements import get_elements_by_xpath
from SelectBrowser import selectBrowser
import openpyxl

with open("getPath.txt") as f_xpath:
    xpathElements = f_xpath.readlines()
xpathList = [x.strip() for x in xpathElements]
print(xpathList)

browser = os.environ['browserInput']
projectName = os.environ['project_name']
first_part_link = ""
second_part_link = ""
if os.environ['first_part_website']:
    first_part_link = os.environ['first_part_website']
if os.environ['second_part_website'] != '"404**"':
    second_part_link = os.environ['second_part_website']

n_page1 = int(os.environ['n_page1'])
n_page2 = int(os.environ['n_page2'])

dir_path = os.environ['dir']

# Open the web browser
driver = selectBrowser(browser)
workbook = openpyxl.Workbook()
worksheet = workbook.active
path_to_file = "results.xlsx"
for page in range(n_page1, n_page2 + 1):
    webpage = first_part_link + str(page) + second_part_link
    driver.get(webpage)

    get_elements_by_xpath(xpathList, driver, worksheet, path_to_file)

workbook.save(path_to_file)
driver.quit()
