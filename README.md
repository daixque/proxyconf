# proxyconf

proxyconf is a proxy switcher for terminal.
proxyconf automatically switch proxy depends on System Preference by default.

proxyconf currently supports Mac only.


## Installation

First, install proxyconf via gem.

    $ gem install proxyconf

Second, setup using proxyconf-setup command

    $ proxyconf-setup

then it creates ~/.proxyconf directory and append setting for proxyconf into your ~/.bash_profile.


## Update from previous version

If you use previous version of proxyconf, follow steps below to update.

    $ gem update proxyconf
    $ proxyconf-setup update


## Usage

Simply type proxyconf in your terminal.

    $ proxyconf

Then proxyconf exports environment variable 'http_proxy', 'https_proxy' and 'ftp_proxy' based on your system preference.

If you want to use other proxy, use 'add' and 'use' command.

    $ proxyconf add other other.proxy.com:8080
    $ proxyconf use other

'add' command creates new proxy setting, and 'use' command exports environment variables.
You can check out proxy settings already added using 'list' and 'info' command.

    $ proxyconf list
    current
    other
    $ proxyconf info other
    export http_proxy=other.proxy.com:8080
    export ftp_proxy=other.proxy.com:8080
    export https_proxy=other.proxy.com:8080

You can remove proxy setting using 'remove' command.

    $ proxyconf remove other
    $ proxyconf list
    current


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
