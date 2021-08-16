import socket

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
    sock.bind(("127.0.0.1", 4242))
    print("UDP Server up")
    print("===============================")
    print()
    while True:
        msg, address = sock.recvfrom(2048)
        print(address)
        print(msg)
        print("===============================")
        if msg == b"quit":
            sock.sendto(b"quit", address)
            print("quiting")
            break

