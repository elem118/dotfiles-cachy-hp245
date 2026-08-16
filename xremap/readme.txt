The following command is used to run it standalone:

sudo xremap --mouse --device "/dev/input/by-id/usb-E-Signal_USB_Gaming_Mouse-event-mouse" --watch /home/elem/.config/xremap/config.yml

A service file has also been setup to use as a systemd service. You shall find the file in the systemd folder.
To run it on your machine you can sudo mv it to your /etc/systemd/system/ directory, or if you want you can keep it in your .config directories and symlink from the etc location to your .config location.
Then you run the following commands:

sudo systemctl start xremap.service
sudo systemctl enable xremap.service

You can check status of service by:
sudo systemctl status xremap
