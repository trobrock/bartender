import serial
import time

ser = serial.Serial('/dev/tty.usbmodemfd121', 9600)
delay = 3

ser.write('1')
time.sleep(delay)
ser.write('2')
time.sleep(delay)
ser.write('3')
time.sleep(delay)
ser.write('4')
