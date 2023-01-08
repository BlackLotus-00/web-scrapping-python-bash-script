import pandas as pd



def get_elements_by_xpath(xpathList: list, driver, worksheet, path_to_file = "results.xlsx"):
    i = 1
    iteration = 0
    dict = {}
    for xpath in xpathList:
        results = driver.find_elements("xpath", xpath)
        i = 1
        for result in results:
            if iteration==0:
                dict['companie' +  str(i)] = [result.text]
            else:
                dict['companie' + str(i)].append(result.text)
            i+=1

        iteration+=1
    for j in range(1,i):
        worksheet.append(dict['companie' + str(j)])

