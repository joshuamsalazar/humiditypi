"#!/bin/bash

echo                           ,*,..  .,                    ..                                                                                                                         \n 
echo                           .#(*,,..,. .  (*.        /#/**,..(                                                                                                                      \n
echo                            (,          ,,          /.                                                                                                                            \n
echo                             #*.                    *                                                                                                                             \n
echo                             ((.         /#.        *                                                                                                                             \n
echo                              %*,       /(*/                                                                                                   *((((.            .((((*,          \n
echo                              (,,      (*         ..                                                                                            *((((.        .((((/*.           \n
echo                               */.,       *..     *,,                                                                                              ((((/.     /(((/*,             \n
echo  (((((((((((((((.              ./,,    ,   (.    .*,.           /(/(,      (((((((((((((((.   *(((((((((((((.     (((////////(((.                   ./(((/  *(((/*,               \n
echo        /(/                     (/.   /,    *.   .,            /(. ,(.           /(/          *(*                 ((.         *(*                     .((((((((/,                 \n
echo        /(/                      ,/.. **     ((.               ((.   .(,          /(/          */*                 ((.         *(*                       .((((/,                   \n
echo        /(/                       ,*, ,,      #*,,           ((.     ,(*         /(/          *((((((((*          ((//////////((.    ,(((((*             ((((*                    \n
echo        /(/                       /,/#       .#..           ((        .(/        /(/          *(*                 ((.    *((.                            ((((*                    \n
echo        /(/                        //.,       .%/.*       .((           (/       /(/          *(*                 ((.      *((*                          ((((*                    \n
echo        /(/                         **..      ,(/,.*     .((             ((      /(/          *(((((((((((((.     ((.        ,/(/                        ((((*                    \n                                                                                                                                                               )


rm mydata.dat			#Remove the previous gathered data
				#Archive instead of removing!!!! (future upgrade)
./DH11_start.exe &		#Starts running the DH11

#-------	Keeps running the code for 60*n seconds		------#
sleep $((60*$1))

./plot.sh 			#After the time ends, opens GNUPLOT for generating a graph

sleep 1

#-------	Runs the LaTeX compiler				------#
pdflatex report.tex

sleep 10

kill $(pidof DH11_start.exe )    #Kills any orphan process that could be using the DH11 device

#------		Sends the report via email			-------#
echo "This email was sent automatically from Raspberrry Pi" | mutt -s "Humidity/Temperature Report #08" $2 -a report.pdf

#Add counter in mails sent!!!
