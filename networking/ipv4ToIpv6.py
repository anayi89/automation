def main():
    num1 = input("Enter a number: ").split(".")

    # Split the IPv4 address by octets.
    octet1 = num1[0]
    octet2 = num1[1]
    octet3 = num1[2]
    octet4 = num1[3]

    # Verify that the user input is a valid IP address.
    try:
        octet1 = int(octet1)
        octet2 = int(octet2)
        octet3 = int(octet3)
        octet4 = int(octet4)
    except ValueError:
        print("This IP address is not valid.")

    # Convert the numbers to hex-decimal format.
    hexdec1 = hex(int(octet1))[2:]
    hexdec2 = hex(int(octet2))[2:]
    hexdec3 = hex(int(octet3))[2:]
    hexdec4 = hex(int(octet4))[2:]

    # Format the hex-decimals with leading zeros.
    hexdec01 = "{:0>2d}".format(hexdec1)
    hexdec02 = "{:0>2d}".format(hexdec2)
    hexdec03 = "{:0>2d}".format(hexdec3)
    hexdec04 = "{:0>2d}".format(hexdec4)

    # Display the sum
    print('The IPv4 address is 0000:0000:0000:0000:0000:FFFF:{0}{1}:{2}{3} in IPv6 format.'.format(hexdec01, hexdec02, hexdec03, hexdec04))

main()
