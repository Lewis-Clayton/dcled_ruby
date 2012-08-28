dcled_ruby
==========

What
==========
dcled_ruby is a driver for the Dream Cheeky LED Message Board (http://www.dreamcheeky.com/led-message-board).

Why
==========
If you only want to run your device on a Mac stop reading and type "brew install dcled". Jeff Jahr has made a great driver (http://www.last-outpost.com/~malakai/dcled/) for this device and if your using Mac I recommend you give it a go. However, Jeff's driver requires the libhid library, which is no longer maintained. As such you will not be able to compile his driver on Debian based systems.

I bought my device to work as an output for Raspberry Pi. As no drivers currently worked in linux I thought I'd give it a go. I wrote it in Ruby, firstly because that's my language of choice and secondly there aren't many examples of libusb in Ruby on GitHub. As there are loads of libusb wrappers (http://www.libusb.org/) this could easily be ported to another language. 

How
==========
This should work with Ruby 1.9.2:

	$ gem install libusb

	$ ruby dcled_ruby.rb -m 'message here'

or

	$ ruby dcled_ruby.rb -f message.txt

With HID USB devices the kernel can tie up the device. Automated detaching of the device from the kernel will come in the next version. In the mean time try running it as sudo.

When
==========
This has not been tested thoughly so if you have any issues let me know dcled_ruby@l.ew.is

Fonts are curently very limited the current version only uses capitalised leters, numbers and a select few non-aphanumeric characters. In time this will grow. Feel free to contribute :)

This is an example of an F. 0 = on. Array 1 is always 1 and the last element of the array is always 1. Fonts work best as 7x5.
:
  f = {1 => [1,1,1,1,1,1,1,1],
       2 => [0,0,0,0,0,0,0,1],
       3 => [0,1,1,0,1,1,1,1],
       4 => [0,1,1,0,1,1,1,1],
       5 => [0,1,1,0,1,1,1,1],
       6 => [0,1,1,1,1,1,1,1]

Who
==========

Lewis Clayton mail@l.ew.is


