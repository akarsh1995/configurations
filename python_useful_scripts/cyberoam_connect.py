import time

from selenium import webdriver


class Login:

    def __init__(self):
        self.base_url = 'http://192.168.10.1:8090'
        self.browser = webdriver.Chrome()

    def login(self):
        self.browser.get(self.base_url)
        self.browser.find_element_by_name('username').send_keys('akarsh.jain')
        self.browser.find_element_by_name('password').send_keys('jain@87')
        self.browser.find_element_by_xpath('//input[@type="submit"]').click()
        time.sleep(.2)


if __name__ == '__main__':
    login = Login()
    login.login()
    login.browser.close()
