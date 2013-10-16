dcled_ruby
==========

What
==========
dcled_ruby is a driver for the Dream Cheeky LED Message Board (http://www.amazon.com/mn/search/?_encoding=UTF8&field-keywords=dream%20cheeky%20led&linkCode=ur2&tag=mossycleftcom-20).

Why
==========
If you only want to run your device on a Mac stop reading and type "brew install dcled". Jeff Jahr has made a great driver (http://www.last-outpost.com/~malakai/dcled/) for this device and if you're using Mac I recommend you give it a go. However, Jeff's driver requires the libhid library, which is no longer maintained. As such you will not be able to compile his driver on Debian based systems.

I bought my device to work as an output for Raspberry Pi. As no drivers currently worked in linux I thought I'd give it a go. I wrote it in Ruby, firstly because that's my language of choice and secondly there aren't many examples of libusb in Ruby on GitHub. As there are loads of libusb wrappers (http://www.libusb.org/) this could easily be ported to another language.

How
==========
This should work with Ruby 1.9.2:

	$ sudo apt-get install libusb-1.0-0-dev

	$ gem install libusb

	$ ruby dcled_ruby.rb -m 'message here'

or

	$ ruby dcled_ruby.rb -f message.txt

In Linux you may have to run this script as root. This is due to permissions assigned to the device. If you are not happy running this as root (and you shouldn't be) find out the bus and device number of the message board and then chomd it. You can identify it with "1d34:0013".

	$ lsusb
	…
	…
	Bus 003 Device 003: ID 1d34:0013

	$ chmod 777 /dev/bus/usb/003/003

Unfortunately you'll have to do this every time the you unplug it. The other option is to change group permissions.

When
==========
This has not been tested thoughly so if you have any issues let me know dcled_ruby@l.ew.is

Fonts are curently very limited. The current version only uses capitalised leters, numbers and a select few non-alphanumeric characters. In time this will grow. Feel free to contribute :)

This is an example of an F. 0 = on. Array 1 is always 1 and the last element of the array is always 1. Fonts work best as 7x5.

	f ={1 => [1,1,1,1,1,1,1,1],
		2 => [0,0,0,0,0,0,0,1],
		3 => [0,1,1,0,1,1,1,1],
		4 => [0,1,1,0,1,1,1,1],
		5 => [0,1,1,0,1,1,1,1],
		6 => [0,1,1,1,1,1,1,1]

Who
==========

Lewis Clayton mail@l.ew.is


