import pyautogui
# import win32api, win32con, win32gui, win32ui, win32service
from pywinauto.application import Application
import pywinauto
import os
from time import sleep
import random

app = Application().connect(process=14660)

win = app.window_()
win.ClickInput()






# pseudoCode {
# 	leftClick(tap) # melee tap
# 	leftClick(hold) # melee hold/lunge
# 	rightClick(tap) # range tap
# 	rightClick(hold) # range hold/BB
# 	pressShift # block
# 	pressShift+ArrowKey(arrowDirection) # roll
# }