## Printer Setup Guide

Follow these steps to set up a printer on your Pengwin system using CUPS.

### 1. Install CUPS

    sudo apt update
    sudo apt install cups

### 2. Configure CUPS

Edit the `/etc/cups/cupsd.conf` file to allow remote access to the CUPS admin
page.

    sudo nano /etc/cups/cupsd.conf

Find the following lines:

    # Only listen for connections from the local machine.
    Listen localhost:631

Replace them with:

    # Listen for connections from any IP address.
    Listen *:631

Find the `<Location />`, `<Location /admin>`, and `<Location /admin/conf>`
sections, and update the `Allow` directive to allow access from your local
network or specific IP addresses:

    Allow @LOCAL

Or:

    Allow from 192.168.1.*

Replace `192.168.1.*` with your local network's IP address range.

Save the changes and restart the CUPS service:

    sudo service cups restart

### 3. Install the Printer Driver

Visit the Brother Support website
(https://support.brother.com/g/b/downloadhowto.aspx?c=us&lang=en&prod=mfcl3710cw_us_eu_as&os=128&dlid=dlf006893_000&flang=4&type3=625),
search for your printer model, and download the appropriate Linux printer
driver.

Follow the instructions provided by Brother to install the printer driver on
your Pengwin system. This may involve using the `dpkg` command (for `.deb`
packages) or the `rpm` command (for `.rpm` packages).

### 4. Add the Printer in CUPS

Access the CUPS web interface at `http://<YOUR_IP_ADDRESS>:631`. Click on the
"Administration" tab, and then click on "Add Printer."

Select your printer from the list, and follow the prompts to configure the
printer with the correct driver and settings.

### 5. Set Default Printer Options

In the CUPS web interface, click on the "Printers" tab, and then click on your
printer's name. Click on the "Administration" dropdown menu and select "Set
Default Options."

Configure the default printer settings, such as color mode and print quality, as
needed. Save the changes.

### 6. Test the Printer

Print a test page from the CUPS web interface or from Neovim using the
`:hardcopy` command.
