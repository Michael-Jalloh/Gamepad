
class GamePad:

    def __init__(self):
        self.left = False
        self.up = False
        self.right = False
        self.down = False
        self.A = False
        self.B = False
        self.Y = False
        self.X = False
        self.Start = False
        self.Select = False
        self.Switch1 = False
        self.Switch2 = False
    
    def set_buttons(self, buttonStates):
        self.left = buttonStates >> 0 & 1
        self.up = buttonStates >> 1 & 1
        self.righ = buttonStates >> 2 & 1
        self.down = buttonStates >> 3 & 1
        self.A = buttonStates >> 4 & 1
        self.B = buttonStates >> 5 & 1
        self.Y = buttonStates >> 6 & 1
        self.X = buttonStates >> 7 & 1
        self.Start = buttonStates >> 8 & 1
        self.Select = buttonStates >> 9 & 1
        self.Switch1 = buttonStates >> 10 & 1
        self.Switch2 = buttonStates >> 11 & 1
    