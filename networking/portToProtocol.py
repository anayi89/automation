import socket

def main():
    ports = [21, 22, 23, 25, 53, 67, 68, 69, 80, 110, 123, 137, 138, 139, 143, 161, 162, 179, 389, 636, 443, 989, 990]
    portNum = int(input("Enter a port number: "))

    while True:
        try:
            portNum = int(portNum)
            break
        except ValueError:
            print("This is not a number. Try again.")

    if portNum in ports:
        print("The protocol for Port {0} is {1}.".format(portNum, socket.getservbyport(portNum)))
    else:
        print("This is not a valid port number. Try again.")

main()  
