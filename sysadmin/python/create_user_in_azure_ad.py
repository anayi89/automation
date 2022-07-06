import requests
from urllib.parse import urlencode

first_name   = input("Enter the user's first name: ")
last_name    = input("Enter the user's last name: ")
nickname     = "%s%s" % (first_name.lower()[0], last_name.lower())
phone_num    = input("Enter the user's phone number in 000-000-0000 format: ")
domain_name  = input("Enter the company's domain name: ")
pass_word    = "t3stP@ssw0rd"
okta_api_key = input("Enter an Okta API key: ")

def get_access_token():
    tenant_id     = input("Enter the tenant ID: ")
    client_id     = input("Enter the client ID: ")
    client_secret = input("Enter the client secret: ")

    url     = "https://login.microsoftonline.com/%s/oauth2/v2.0/token" % tenant_id
    data    =  urlencode({
            "grant_type": "client_credentials",
            "client_id": "%s" % client_id,
            "client_secret": "%s" % client_secret,
            "scope": "https://graph.microsoft.com/.default"
    })

    headers = {"Content-Type": "application/x-www-form-urlencoded"}

    req = requests.post(
        url=url,
        data=data,
        headers=headers
    )

    access_token = req.json()["access_token"]
    return access_token

def create_user_in_ad():
    url     = "https://graph.microsoft.com/v1.0/users"
    json    = {
        "accountEnabled": True,
        "displayName": "%s %s" % (first_name, last_name),
        "mailNickname": nickname,
        "UserPrincipalName": "%s@%s" % (nickname, domain_name),
        "passwordProfile" : {
        "forceChangePasswordNextSignIn": True,
        "password": pass_word
        }
    }

    headers = {
        "Authorization": "Bearer %s" % get_access_token(),
        "Content-Type": "application/json"
    }

    requests.post(url=url, json=json, headers=headers)

def create_user_in_okta():
    url = "https://%s.okta.com/api/v1/users?activate=true" % domain_name.replace(".com", "", 1)

    json = {
        "profile": {
            "firstName": first_name,
            "lastName": last_name,
            "email": "%s@%s" % (nickname, domain_name),
            "login": "%s@%s" % (nickname, domain_name),
            "mobilePhone": phone_num
        },
        "credentials": {
            "password" : { "value": pass_word }
        }
    }

    headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "SSWS %s" % okta_api_key
    }
    requests.post(url=url, json=json, headers=headers)

if __name__ == "main":
    create_user_in_ad()
    create_user_in_okta()
