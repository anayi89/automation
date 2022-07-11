import requests
from requests.exceptions import RequestException

def okta_api_request():
    api_token = "<OKTA_API_TOKEN>"
    headers={
        "Accept"       :  "application/json",
        "Content-Type" :  "application/json",
        "Authorization": "SSWS " + api_token
    }

    try:
        users = requests.get(url="https://<COMPANY_OKTA_DOMAIN>/api/v1/users", headers=headers)
        if users.status_code == 200:
            return users.json()
    except RequestException as e:
        print(e)

    num_of_users = len(users)

    print("Inactive Users")
    for user in range(0, num_of_users):
        if users[user]["activated"] is None:
            print("User ID: %s; First Name: %s; Last Name: %s; Email: %s" % \
                (users[user]["id"], users[user]["profile"]["firstName"], users[user]["profile"]["lastName"], users[user]["profile"]["email"])
            )

if __name__ == "__main__":
    okta_api_request()
