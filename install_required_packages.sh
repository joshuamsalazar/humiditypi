#!/bin/bash

#The following sctipt will configure your Raspbery Pi for capturing data automatically

#First, install WiringPI
sudo apt-get purge wiringpi
hash -r

sudo apt-get install git-core

sudo apt-get update
sudo apt-get upgrade

#-------	Obtaining wiringPi	-------#

cd
git clone git://git.drogon.net/wiringPi

cd ~/wiringPi
git pull origin

./build

#We need also LaTeX dependencies for the autocompilation of the PDF report


#Now, let us install the MUTT mail client for automatically sending the report generated.
#-------	This configuration is for GMAIL accounts exclusively	-------#
#But, you can find multiple tutorials on how to configure another type of account.
#For more information about the installation and configuration of your account, please visit:
# https://unix.stackexchange.com/questions/226936/how-to-install-setup-mutt-with-gmail-on-centos-and-ubuntu

#Please do the following before continuing...
#
#In GMAIL.COM, go to SETTINGS > FORDWARDING POP/IMAP > CONFIGURATION INSTRUCTIONS > IMAP ACCESS

#Then, click in I WANT TO ENABLE IMAP, and select OTHER.

#The GMAIL account should get permissions for being run by command line apps, then turn on
# the usage of LESS SECURE APPS in the web page: 	https://www.google.com/settings/security/lesssecureapps

#-------	Now you can install MUTT	-------#

sudo apt-get install mutt

mkdir -p ~/.mutt/cache/headers
mkdir ~/.mutt/cache/bodies
touch ~/.mutt/certificates

touch ~/.mutt/muttrc

#Now add the following configuration in the ~/.mutt/muttrc file (removing the # symbols from the beggining of all the lines):

##set ssl_starttls=yes
##set ssl_force_tls=yes

##set imap_user = 'change_this_user_name@gmail.com'
##set imap_pass = 'PASSWORD'

##set from='change_this_user_name@gmail.com'
##set realname='Your Name'

##set folder = imaps://imap.gmail.com/
##set spoolfile = imaps://imap.gmail.com/INBOX
##set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"

##set header_cache = "~/.mutt/cache/headers"
##set message_cachedir = "~/.mutt/cache/bodies"
##set certificate_file = "~/.mutt/certificates"

##set smtp_url = 'smtps://change_this_user_name@gmail.com:PASSWORD@smtp.gmail.com:465/'

##set move = no
##set imap_keepalive = 900

# And replace change_this_user_name by your account name, and your password by PASSWORD. 
#At the end, save your file.

#Now, install the LaTeX compiler:

sudo apt-get install texlive

sudo apt-get install texlive-full

#Finally, lets install the plotter GNUPLOT

sudo apt-get install gnuplot-x11
