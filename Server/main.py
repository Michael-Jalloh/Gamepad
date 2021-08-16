import socket
from gamepad import GamePad

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
    sock.bind(("127.0.0.1", 4242))
    print("UDP Server up")
    print("===============================")
    print()
    gamepad = GamePad()
    while True:
        msg, address = sock.recvfrom(2048)
        gamepad.set_buttons(int(msg))
        if gamepad.Switch1 and gamepad.Switch2:
            sock.sendto(b"quit", address)
            print("quiting")
            break
        if gamepad.A:
            print("Button A Pressed")
        if gamepad.B:
            print("Button B pressed")

