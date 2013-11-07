# proxyconf

proxyconf is a proxy switcher for terminal.

proxyconf currently supports Mac only.

## Installation

First, install proxyconf via gem.

    $ gem install proxyconf

Second, setup using proxyconf-setup command

    $ proxyconf-setup

then it creates ~/.proxyconf directory and append setting for proxyconf into your ~/.bash_profile.

## Usage

Simply type proxyconf in your terminal.

    $ proxyconf

Then proxyconf exports environment variable 'http_proxy', 'https_proxy' and 'ftp_proxy' based on your system preference.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
