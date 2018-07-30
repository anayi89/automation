import paramiko
import time
import getpass

def main():
    router_address = input("Enter the router's IP address: ").split(".")
    username = input("Enter the username: ")
    password = getpass.getpass("Enter the password: ")
    port_address = input("Enter an IP address for the router's Fa0/1 port.").split(".")
    port_subnet = input("Enter a subnet mask for the router's Fa0/1 port.").split(".")

    # Split the IP addresses and the subnet mask by octets.
    octet01 = router_address[0]
    octet02 = router_address[1]
    octet03 = router_address[2]
    octet04 = router_address[3]

    octet05 = port_address[0]
    octet06 = port_address[1]
    octet07 = port_address[2]
    octet08 = port_address[3]

    octet09 = port_subnet[0]
    octet10 = port_subnet[1]
    octet11 = port_subnet[2]
    octet12 = port_subnet[3]

    # Verify that the user input are a valid IP address and CIDR.
    while True:
        try:
            octet01 = int(octet01)
            octet02 = int(octet02)
            octet03 = int(octet03)
            octet04 = int(octet04)
        except ValueError:
            print("The router's IP address is not valid.")
        try:
            octet01 >= 0 and octet01 <= 255
            octet02 >= 0 and octet02 <= 255
            octet03 >= 0 and octet03 <= 255
            octet04 >= 0 and octet04 <= 255
            break
        except ValueError:
            print("The octets of the router's IP address must be between 0 and 255.")

        try:
            octet05 = int(octet05)
            octet06 = int(octet06)
            octet07 = int(octet07)
            octet08 = int(octet08)
        except ValueError:
            print("The port's IP address is not valid.")
        try:
            octet05 >= 0 and octet05 <= 255
            octet06 >= 0 and octet06 <= 255
            octet07 >= 0 and octet07 <= 255
            octet08 >= 0 and octet08 <= 255
            break
        except ValueError:
            print("The octets of the port's IP address must be between 0 and 255.")
        
        try:
            octet09 = int(octet09)
            octet10 = int(octet10)
            octet11 = int(octet11)
            octet12 = int(octet12)
        except ValueError:
            print("The port's subnet mask is not valid.")
        try:
            octet09 >= 0 and octet09 <= 255
            octet10 >= 0 and octet10 <= 255
            octet11 >= 0 and octet11 <= 255
            octet12 >= 0 and octet12 <= 255
            break
        except ValueError:
            print("The octets of the port's subnet mask must be between 0 and 255.")

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname=router_address, port=22, username=username, password=password)

    remote_conn = ssh.invoke_shell()
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("configure terminal\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("interface fastethernet0/1\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("ip address {0} {1}\n").format(port_address, port_subnet)
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("no shutdown\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("exit\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("exit\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

    remote_conn.send("show interface fastethernet0/1\n")
    time.sleep(.5)
    output = remote_conn.recv(65535)
    print(output)

main()
