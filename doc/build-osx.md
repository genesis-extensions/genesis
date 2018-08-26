Mac OS X Build Instructions and Notes
====================================
The commands in this guide should be executed in a Terminal application.
The built-in one is located in `/Applications/Utilities/Terminal.app`.

Preparation
-----------
Install the OS X command line tools:

`xcode-select --install`

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

Dependencies
----------------------

    brew install automake berkeley-db4 libtool boost miniupnpc openssl pkg-config protobuf python3 qt libevent libsodium

See [dependencies.md](dependencies.md) for a complete overview.

If you want to build the disk image with `make deploy` (.dmg / optional), you need RSVG

    brew install librsvg

NOTE: Building with Qt4 is still supported, however, could result in a broken UI. Building with Qt5 is recommended.

Berkeley DB
-----------
It is recommended to use Berkeley DB 4.8. If you have to build it yourself,
you can use [the installation script included in contrib/](/contrib/install_db4.sh)
like so

```shell
./contrib/install_db4.sh .
```

from the root of the repository. **Source code must be cloned first**

**Note**: You only need Berkeley DB if the wallet is enabled (see the section *Disable-Wallet mode* below).

Build Genesis Official
------------------------

1. Clone the Genesis Official source code and cd into `genesis`

        git clone https://github.com/genesisofficial/genesis
        cd genesis

2.  Build Genesis Official:

    Configure and build the headless Genesis Official binaries as well as the GUI (if Qt is found).

    You can disable the GUI build by passing `--without-gui` to configure.

        ./autogen.sh
        ./configure
        make

3.  You can also create a .dmg that contains the .app bundle (optional):

        make deploy

Running
-------

Genesis is now available at `./src/genesisd`

Before running, it's recommended that you create an RPC configuration file.

    echo -e "rpcuser=genesisrpc\nrpcpassword=$(xxd -l 16 -p /dev/urandom)" > "/Users/${USER}/Library/Application Support/Genesis/genesis.conf"

    chmod 600 "/Users/${USER}/Library/Application Support/Genesis/genesis.conf"

The first time you run genesisd, it will start downloading the blockchain. This process could take several hours depending on how long the blockchain has been active.

You can monitor the download process by looking at the debug.log file:

    tail -f $HOME/Library/Application\ Support/Genesis/debug.log

Other commands:
-------

    ./src/genesisd -daemon # Starts the genesis daemon.
    ./src/genesis-cli --help # Outputs a list of command-line options.
    ./src/genesis-cli help # Outputs a list of RPC commands when the daemon is running.

Using Qt Creator as IDE
------------------------
You can use Qt Creator as an IDE, for genesis development.
Download and install the community edition of [Qt Creator](https://www.qt.io/download/).
Uncheck everything except Qt Creator during the installation process.

1. Make sure you installed everything through Homebrew mentioned above
2. Do a proper ./configure --enable-debug
3. In Qt Creator do "New Project" -> Import Project -> Import Existing Project
4. Enter "genesis-qt" as project name, enter src/qt as location
5. Leave the file selection as it is
6. Confirm the "summary page"
7. In the "Projects" tab select "Manage Kits..."
8. Select the default "Desktop" kit and select "Clang (x86 64bit in /usr/bin)" as compiler
9. Select LLDB as debugger (you might need to set the path to your installation)
10. Start debugging with Qt Creator

Notes
-----

* Tested on OS X 10.8 through 10.13 on 64-bit Intel processors only.

* Building with downloaded Qt binaries is not officially supported. See the notes in [#7714](https://github.com/bitcoin/bitcoin/issues/7714)
