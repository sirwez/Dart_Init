# Connect to Android with ADB


*Connect the USB to the device and follow the steps below:*

>    adb devices
> 
>    adb tcpip 5555

To search for your IP Address, use one of the two methods below:

    Go into Android's WiFi settings, click the menu button in the action bar (the vertical ellipsis), hit _Advanced_ and see the IP address at the bottom of the screen.

or
```
Execute the following command: adb shell ip -f inet addr show wlan0
```
Now use the ip:
>    adb connect <your_ip_address>

Once you are done, you can disconnect from the adb tcp session by running:

> adb disconnect <your_ip_address>
