# Humidity Pi
The following package allows you to generate automatically a LaTeX report that can be sent from a Gmail account. The report contains the data gathered from a DH11 sensor, everything running automatically on a Raspberry Pi. With some proper package installation and one line of code, you will be able to generate reports of this kind:
https://github.com/joshuamsalazar/humiditypi/blob/first_upload/Sample_report.pdf

The required software for this script is: (don't worry, the next scripts will help you to install them)

  - Gnuplot   : Plot generator
  - Mutt      : CLI Mail client
  - Texlive   : LaTeX compiler


  The following text lists the instructions for running the automatic reporter of humidity/temperature info via mail.

  First of all, the sensor should be properly connected as indicated on this page:
http://www.uugear.com/portfolio/read-dht1122-temperature-humidity-sensor-from-raspberry-pi/

  Then, WiringPi should be installed for controlling the GPIO modules.The instructions are detailed in here:
http://wiringpi.com/download-and-install/

  All the required actions will be run by the provided install script. It can be run by executing:

$ sudo ./install_required_packages.sh 

IMPORTANT: The script does not automatically configure the mail account (yet!). So it is important to open ./install_required_packages.sh with some text reader and follow the process in parallel. I added enough information for saving you time.

$ nano ./install_required_packages.sh

  After the installation of the required software (may take a while), the program should be compiled and then run with the following syntax.
