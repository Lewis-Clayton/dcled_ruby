dcled_ruby
==========

What
==========
dcled_ruby is a driver for the Dream Cheeky LED Message Board (http://www.amazon.com/mn/search/?_encoding=UTF8&field-keywords=dream%20cheeky%20led&linkCode=ur2&tag=mossycleftcom-20).

This has been tested with OSX and Raspbian. There is no reason for this not to work with any Debian based distribution.

Why
==========
I bought my device to work as an output for a Raspberry Pi. As no drivers at the time worked in linux I thought I'd give it a go. I wrote it in Ruby, firstly because that's my language of choice and secondly there aren't many examples of libusb in Ruby on GitHub. As there are loads of libusb wrappers (http://www.libusb.org/) this could easily be ported to another language.

Jeff Jahr has made a great driver (http://www.last-outpost.com/~malakai/dcled/) for this device which used libhid library, which is no longer maintained. As such I wanted to write an updated driver which would work with my Raspberry Pi. Jeff has since updated his driver to use libusb and is well worth having a look at.


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

Fonts are curently very limited. The default font only uses capitalised leters, numbers and a select few non-alphanumeric characters. In time this will grow. Feel free to contribute :) 

As of pull request 7 (https://github.com/Lewis-Clayton/dcled_ruby/pull/7 - thanks tiredpixel) this project now supports fonts in a much more robust manor. New fonts can be added in with a Yaml file in the fonts directory.

This is an example of an F.

	'F':
	  - '*****'
	  - '*....'
	  - '*....'
	  - '****.'
	  - '*....'
	  - '*....'
	  - '*....'


Who
==========

Lewis Clayton mail@l.ew.is

Licence
==========

MIT License

