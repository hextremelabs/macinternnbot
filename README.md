MacInternBot
======================
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

A Telegram powered bot for performing little management tasks on your mac. Written using Ruby.

# How do I set it up?

## Step 0

####
Make sure you have Ruby installed on your mac. If not

```
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.2.3
rbenv global 2.2.3
ruby -v
```
Install the [telegrambot gem](https://github.com/atipugin/telegram-bot-ruby)
```
sudo gem install telegram-bot-ruby json
```

After completing this confirm installation of the gem by running
```
irb
```

Then

![screenshot of expected irb command](https://raw.githubusercontent.com/hextremelabs/macinternnbot/master/logo/irb.png)

A `true` indicates a successful import.


## Step 1

####
Clone this repository 
```
git clone git@github.com:hextremelabs/macinternnbot.git
```

## Step 2

####
Get a bot token through the @BotFather on your telegram app, He would also aid you in setting up your botname.

## Step 3

####
Configure the `MacInternNBot.rb` file with your token and your Telegram username by creating a config.txt file as recommended in the `MacInternNBot.rb` file.

## Step 4

####
Run the `MacInternNBot.rb` on your terminal.

`ruby MacInternNBot.rb`

## Step 5

####
Search for your bot by name on your telegram app. 
Start using your bot.

## Step 6

####
Suggest new nifty commands that can be added to the list of available commands. ;)


Developed By
-------
Akapo Damilola (helios66) - <fdamilola@gmail.com>

<a href="https://twitter.com/_fdamilola">
<img alt="Follow me on Twitter"
src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/1259px-Twitter_bird_logo_2012.svg.png" width="75"/>
</a>

Contributions
-------

All contributions are welcome!

License
-------

    Copyright 2015 Hextremelabs

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.