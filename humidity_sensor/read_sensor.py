import logging
import logging.handlers
import serial
import sys
from serial.tools.list_ports import comports, grep
from PyQt4.QtGui import QMainWindow, QWidget
from PyQt4.QtCore import QTimer
from PyQt4 import QtGui
from threading import Thread, Event
from collections import deque
import matplotlib
import numpy as np
matplotlib.use('Qt4Agg')
matplotlib.rcParams['backend.qt4'] = 'PyQt4'
from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
import datetime
mpl = matplotlib

status_map = {0: "OK", 1: "Stale data", 2: "Configuration mode"}
baudrate = 9600

class TemperatureReader(object):
    def __init__(self):
        self.data = deque([], 12*6*60) # log for 6 hours
        self.make_log()
        self.find_sensor()
        self.running = Event()
        self.exception = None
        
        if self.sensor:
            self._thread = Thread(group=None, target=self._read_sensor(),
                    name='TempReader')
        else:
            raise RuntimeError('sensor not found')

    def run(self):
        if not self.running.is_set():
            self.running.set()
            self._thread.start()
    
    def stop(self):
        self.running.clear()

    def find_sensor(self):
        first = list(grep('Arduino'))
        self.sensor = serial.Serial(first[0][0], baudrate, timeout=2)

    def _read_sensor(self):
        log, data, sensor = self.log, self.data, self.sensor
        running = self.running
        def read():
            try:
                while running.is_set():
                    line = self.sensor.readline().decode('ascii')
                    if line is '':
                        raise Exception('timeout')

                    status, humidity, temperature = (int(x) for x in line.split(',')) 

                    humidity = float(humidity)/(2**14 - 2)*100 
                    temperature = float(temperature)/(2**14 -2)*165 - 40

                    data.append((humidity, temperature, datetime.datetime.now()))
                    log.info("{:4.2f}, {:4.2f}".format(humidity, temperature))
            except Exception as e:
                self.exception = e
                print(e)
            finally:
                print('closing sensor')
                running.clear()
                sensor.close()
        return read

    def make_log(self):
        self.log = logging.getLogger('humidity_sensor')
        self.log.setLevel(logging.INFO)

        log_path = r'P:\Temperature\data.log'

        h = logging.handlers.TimedRotatingFileHandler(log_path, when='midnight')
        f = logging.Formatter('%(asctime)s, %(message)s', datefmt='%m/%d/%Y %H:%M:%S ')
        h.setFormatter(f)
        self.log.addHandler(h)

class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        QMainWindow.__init__(self, parent)
        self.setWindowTitle('Temperature Reader')
        self.create_main_frame()
        self.reader = TemperatureReader()

        self.reader.run()
        self.supervisor = QTimer()
        self.supervisor.timeout.connect(self.supervise)
        self.supervisor.start(2000)

        self.update_timer = QTimer()
        self.update_timer.timeout.connect(self.on_draw)
        self.update_timer.start(1000)
    
    def supervise(self):
        if self.reader.running.is_set():
            pass
            #print('supervising')
        else:
            print('sensor is disconnected!')
            self.update_timer.stop()
            QtGui.QMessageBox.critical(self, "Exception occured", \
                    'Sensor is disconnected')
            self.supervisor.stop()
        
    def create_main_frame(self):
        self.main_frame = QtGui.QWidget()
        
        self.dpi = 100
        self.fig = Figure(dpi=self.dpi)
        self.canvas = FigureCanvas(self.fig)
        
        self.axes = (self.fig.add_subplot(211), 
                     self.fig.add_subplot(212))
        
        hbox = QtGui.QVBoxLayout()
        hbox.addWidget(self.canvas)
        
        self.main_frame.setLayout(hbox)
        self.setCentralWidget(self.main_frame)

    def on_draw(self):
        ax1, ax2 = self.axes
        ax1.clear(), ax2.clear()
        
        if len(self.reader.data) > 2:
            data = np.array(self.reader.data)
            humidity, temperature, time = data[:, 0], data[:, 1], \
                mpl.dates.date2num(data[:, 2])

            hours, minutes = mpl.dates.HourLocator(),\
                mpl.dates.MinuteLocator()
            ax1.plot_date(time, humidity, 'r-', linewidth=1.5)
            ax1.xaxis.set_major_formatter(mpl.dates.AutoDateFormatter(locator=hours))
            ax1.set_ylim(5, 95)
            ax1.set_ylabel('relative humidity')

            ax2.plot_date(time, temperature, 'g-', linewidth=1.5)
            ax2.xaxis.set_major_formatter(mpl.dates.AutoDateFormatter(locator=hours))
            ax2.set_ylim(15, 35)
            ax2.set_ylabel('temperature')
            ax1.grid(which='both'), ax2.grid(which='both')

            ax1.xaxis.set_ticklabels([])
            self.setWindowTitle('Temperature Reader / ' +
                'Humidity: {:3.2f}% / Temperature: {:3.2f} C'.format(humidity[-1], temperature[-1]))
        self.canvas.draw()

    def closeEvent(self, event):
        try:
            self.reader.stop()
        except Exception as e:
            print(e)
            print(self.reader.exception)

        super(QMainWindow, self).closeEvent(event)

def main():
    app = QtGui.QApplication(sys.argv)
    try:
        window = MainWindow()
        window.show()
        app.exec_()
    except:
        QtGui.QMessageBox.critical(None, "Exception occured", \
                'Could not find sensor')
    
if __name__ == "__main__":
    main()
