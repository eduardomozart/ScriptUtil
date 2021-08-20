# "Save as" dialog for cups-pdf
I use Linux Mint Rebecca Xfce with Libreoffice.
I found no way how to export a single sheet to PDF in calc.
So I decide to install cup-pdf. The printing of single sheets now worked fine,
but I dont want to copy each PDF-file to its needed location.

I wonder, that I don’t find a solution for a simple "Save as" dialog.
So I wrote one.

It’s not "the hight art of programming", but it is simple and it works.

## How it works
A small python-script triggers the PDF folder in the home folder.

When a PDF file is printed in the PDF folder it starts a standard GTK "Save as" dialog.
So make sure there are no PDF files in the folder after installation or you will
get more fun with the "Save as" dialog as you expect.

After the OK button is pressed, the PDF file will be copied to its new location and the
source document will be removed.

When a document already exists a overwriting dialog will be shown.
Errors are handled (e.g. permisson denied) and the document can be saved at a different
location.
By clicking the cancel button, the document will be deleted.

## System requirements
cups-pdf (it would make no sence without)

pygtk >= 2.0

gtk >= 2.8

I tested on Linux Mint 17.1 Rebecca Xfce, Ubuntu Mate 14.04.1 and crunchbang Waldorf (debian derivate).
It worked out of the box, without installing any extra packages.

## Installation
Mostly all the following things can be done with graphical tool,
but I think it is easier to copy and paste the commands to a terminal.

Open a terminal. You can copy & paste the commands.

Install cups-pdf if not already done.

``
sudo apt-get install cups-pdf
``

After the first printing to PDF Printer the folder PDF will be created in your home folder

Go to the folder where you have downloaded the savpdfGTK.tar.gz (e.g. ``/Downloads``) and extract it.

``
tar -zxvf savpdfGTK.tar.gz
``

Change to the folder savpdfGTK

``
cd savpdfGTK
``

Copy the file savpdf to /usr/local/bin/. 

``
sudo cp savpdf /usr/local/bin/
``

Change permissions of savpdf

``
sudo chmod 755 /usr/local/bin/savpdf
``

Enable the start of the script at login for all user

``
sudo cp savpdf.desktop /etc/xdg/autostart/
``

Change permissions of savpdf.desktop

``
sudo chmod 644 /etc/xdg/autostart/savpdf.desktop
``

You must log out and relogin to start the script.

## License
Program: savpdf
Version: 0.002
BSD 2-Clause
Copyright (c) 2015, Holger Rückershäuser
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
