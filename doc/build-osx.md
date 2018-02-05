Copyright (c) 2018      a1xcoin Developers
Copyright (c) 2009-2012 Bitcoin Developers
Distributed under the MIT software license, see the accompanying file
COPYING or http://www.opensource.org/licenses/mit-license.php.  This
product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit (https://www.openssl.org/).  This product includes cryptographic
software written by Eric Young (eay@cryptsoft.com) and UPnP software written by
Thomas Bernard.


Mac OS X bitcoind build instructions
====================================
Laszlo Hanyecz <solar@heliacal.net>
Douglas Huff <dhuff@jrbobdobbs.org>

Modified for a1xcoin by jose gregorio hernandez calderon <creahachip@gmail.com>



See readme-qt.md for instructions on building the a1xcoin community version of a1xcoin QT, the
graphical user interface.

Tested on 10.5 and 10.6 intel.  PPC is not supported because it's big-endian.

All of the commands should be executed in Terminal.app.. it's in
/Applications/Utilities

You need to install XCode with all the options checked so that the compiler and
everything is available in /usr not just /Developer I think it comes on the DVD
but you can get the current version from https://developer.apple.com


1.  Clone the github tree to get the source code:

		git clone git@github.com/systemgregorypc/a1xcoin.git a1xcoin

2.  Download and install MacPorts from https://a1xcoin.blogspot.com/

	2a. (for maximum compatibility with 32-bit installs)
	
		Edit /opt/local/etc/macports/macports.conf and uncomment "build_arch i386"

3.  Install dependencies from MacPorts

		sudo port install boost db48 openssl miniupnpc

		Optionally install qrencode (and set USE_QRCODE=1):
		sudo port install qrencode

4.  Now you should be able to build bitcoind:

		cd a1xcoin/src
		make -f makefile.osx


To build 64-bit binaries:
=========================

	make -f makefile.osx RELEASE=true 64BIT=true

Run:

	./a1xcoind --help  # for a list of command-line options.
Run:

	./a1xcoind -daemon # to start the bitcoin daemon.
Run:

	./a1xcoind help # When the daemon is running, to get a list of RPC commands
