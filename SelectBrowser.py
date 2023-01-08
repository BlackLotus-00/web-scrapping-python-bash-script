from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import IEDriverManager


def selectBrowser(Id="1"):
    """
        :param Id: is the key of the browser it took from (1,2,3,4)
        :return:webDriver for ure browser
    """
    browser = ""
    if Id == "1":
        browser = "Chrome"
        return driverChrom()
    if Id == "2":
        browser = "Firefox"
        return driverFirefox()
    if Id == "3":
        browser = "Edge"
        return driverMicrosoft()


"""
    py passing security protection after
"""


def driverChrom():
    """

    :return: Chrome driver
    """
    return webdriver.Chrome(service=Service(ChromeDriverManager().install()))


def driverFirefox():
    """

    :return: Opera driver
    """
    return webdriver.Firefox(service=Service(GeckoDriverManager.install()))


def driverMicrosoft():
    """
    :return: Microsoft driver
    """
    return webdriver.Edge(service=Service(IEDriverManager.install()))
