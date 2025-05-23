This is a demo project that builds a simple middleware plugin for Munki 7.

This middleware does nothing useful: it merely prints the URL and headers for every request.

The middleware plugin must be installed in `/usr/local/munki/middleware/`, and you need Munki 7.0.0.5152 or later to test.

To build the middleware plugin and an Installer pkg that installs it, cd into this directory and run `./build_pkg.sh`. You will need a recent version of Xcode.
