import yaml
import requests
import pandas as pd


def __getproxy(response: str):
    """
    :param response: get the url from which we extract ip addresses
    :return: a list of ip-addresses can be used to connect to a website (bypassing-proxy-safety)
    """
    proxy_list = pd.read_html(response.text)[0]
    proxy_list["url"] = proxy_list["IP Address"] + ":" + proxy_list["Port"].astype(str)
    https_proxies = proxy_list[proxy_list["Https"] == "yes"]

    return https_proxies["url"].values


def __getproxy_valid(url: str, n_proxies:int, browser:str):
    """

    :param url: url from where we want extract data (the webSite's url we want to extract)
    :param n_proxies : number of Proxies u want to return
    :return: a list of valid proxy
    """
    responseProxy = requests.get("https://free-proxy-list.net/")
    proxies = __getproxy(responseProxy)
    good_proxies = set()
    with open("headers.yaml") as fl_header:
        browsers_header = yaml.safe_load(fl_header)

    headers = browsers_header[browser]
    for proxy in proxies:
        proxies = {
            "http": proxy,
            "https": proxy,
        }
        try:
            response = requests.get(url, headers=headers, proxies=proxies, timeout=2)
            good_proxies.add(proxy)
            print(f"Proxy {proxy} OK, added to good_proxy list")
        except Exception:
            pass

        if len(good_proxies) >= n_proxies:
            break

    return good_proxies
