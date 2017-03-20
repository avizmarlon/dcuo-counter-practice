import win32gui
import win32con
import win32api
from time import sleep


wMain = win32gui.FindWindow("DC Universe Online Windows Client (32 bit)", "DC Universe Online [Test.412489]")
wChild = win32gui.GetWindow(wMain, win32con.GW_CHILD)

#[hwndChild] this is the Unique ID of the sub/child application/proccess
#[win32con.WM_CHAR] This sets what PostMessage Expects for input theres KeyDown and KeyUp as well
#[0x44] hex code for D
#[0]No clue, good luck!
#temp = win32api.PostMessage(hwndChild, win32con.WM_CHAR, 0x44, 0) returns key sent
temp = win32api.PostMessage(wChild, win32con.WM_CHAR, 0x44, 0)
print(wMain)
print(temp)
print(wChild)


# I've seen posts all over to use

# hwndEdit = win32gui.FindWindowEx(hwndMain, hwndChild, "Edit", "test - Notepad");
# but I could never figure it out. In addition to that all documentation on Microsoft's site is vary ambiguous, So I've added my own of how I understand it.


# pseudoCode {
# 	melee(tap)
# 	melee(hold)
# 	ranged(tap)
# 	ranged(hold)
# 	block()
# 	block(roll)
# }