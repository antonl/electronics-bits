import logging
import logging.handlers
import serial

log = logging.getLogger('humidity_sensor')
log.setLevel(logging.INFO)

log_path = r'P:\Temperature\data.log' 

h = logging.handlers.TimedRotatingFileHandler(log_path, when='midnight')
f = logging.Formatter('%(asctime)s, %(message)s', datefmt='%m/%d/%Y %H:%M:%S ')
h.setFormatter(f)
log.addHandler(h)

PORT = 'COM17'
BAUDRATE = 9600

sensor = serial.Serial(PORT, BAUDRATE, xonxoff=True)

status_map = {0: "OK", 1: "Stale data", 2: "Configuration mode"}

try:
    while True:
        line = sensor.readline().decode('ascii')
        data = line.split(',')
        status, humidity, temperature = (int(x) for x in data) 

        humidity = float(humidity)/(2**14 - 2)*100 
        temperature = float(temperature)/(2**14 -2)*165 - 40

        print("Humidity: {:4.2f}, Temperature: {:4.2f}, Status {:s}".format(\
                humidity, temperature, status_map[status]))
        log.info("{:4.2f}, {:4.2f}".format(humidity, temperature))

except KeyboardInterrupt:
    sensor.close()
    print("Exiting")
