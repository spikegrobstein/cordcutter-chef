# Cordcutter::Chef

Total work in progress. Doesnt' really work at all, yet.

Chef configuration for installing:

 * sabnzbd+
 * sickbeard
 * couchpotato
 * newznab

Currently only supports ubuntu linux. Aim to support other linuxes and OSX in the future.

Documentation kinda sucks. This will improve as I get closer to release.

## Get running

 1. Download this repository to your workstation.
 2. Run `bundle`
 3. On your server, be sure to install the following packages:
    * `build-essential`
    * `ruby1.9.3`
 4. On sever, install the following gem:
    * `chef`
 5. Edit `Meatfile` to change your user name at the top to a user to log into the server with.
 6. On your workstation, run `boucher <hostname>`

Shit should work.

## Customization

Look at `default.rb` in attributes files in cookbooks (eg: `cookbooks/sabnzbd/attributes/default.rb`)

## Caveats

Nothing may work. I probably forgot to tell you some package that's required. This thing
currently assumes that you're installing all this stuff on a remote server or a VM from
a linux-like system. This also uses my `boucher` tool for now. This will probably change in
the future.
