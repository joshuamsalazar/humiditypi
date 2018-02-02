# Humidity Pi
The following package allows you to generate automatically a LaTeX report that can be sent from a Gmail account. The report contains the data gathered from a DH11 sensor, everything running automatically on a Raspberry Pi.


  The following text lists the instructions for running the automatic reporter of humidity/temprature info via mail.

  First of all, the sensor should be properly connected as indicated in this page:
http://www.uugear.com/portfolio/read-dht1122-temperature-humidity-sensor-from-raspberry-pi/

  Then, WiringPi should be installed for controlling the GPIO modules.The instructions are detailed in here:
http://wiringpi.com/download-and-install/

  All the required actions will be run by the provided install script. It can be run by executing:

$ sudo ./install_required_packages.sh 

  After the installation of the required software (may take a while), the program should be compiled and then run with the following syntax.

$ ./compile.sh

$ ./start.pdf [integer number of minutes] [destinatary email]
