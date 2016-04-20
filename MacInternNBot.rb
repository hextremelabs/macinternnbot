require 'telegram/bot'
require 'json'

'''
Create a config.txt file with this content 
{"token": "TELEGRAM BOT TOKEN" , 
  "username": "TELEGRAM username"}
'''

config = File.read('config.txt');

config_data = JSON.parse(config);

TOKEN = config_data["token"];
USER = config_data["username"];

def show_commands(name)
    return "Hi @#{name}, I am your mac bot. You can use me for performing nifty tasks on your mac via your telegram app.\nHere are a few of my commands \n/alive : Checks if I am alive and responds if I am. Test this command before sending serious commands\n/sleep : Puts mac to sleep immediately. \n/shutdown : Shuts down your mac immediately. \n/lock : Locks your mac immediately.\n/batterystat : Check current battery status \n/uptime : Returns how long your mac has been up for.\n/screenshot : Creates a screenshot of your mac desktop."
end

def error_msg(name)
    return "Hi @#{name}, I haven't been set up yet. \n Setting up your own mac intern bot is pretty easy, visit https://github.com/hextremelabs/macinternnbot"
end

def runCommand(command)
  system command
end

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
      if message.from.username == USER
        case message.text
          when '/start'
           bot.api.send_message(chat_id: message.chat.id, text: show_commands(message.from.username));
          when '/alive'
            bot.api.send_message(chat_id: message.chat.id, text: "Yes! @#{message.from.username} I am alive. What would you like me to do?");
          when '/sleep'
              bot.api.send_message(chat_id: message.chat.id, text: "Putting your mac to sleep now.");
              runCommand('pmset sleepnow')
          when '/uptime'
            output = `uptime`
            bot.api.send_message(chat_id: message.chat.id, text: output);
          when '/batterystat'
            output = `pmset -g ps`
            bot.api.send_message(chat_id: message.chat.id, text: output);
          when '/shutdown'
               bot.api.send_message(chat_id: message.chat.id, text: "Currently not allowed.");
          when '/lock'
              bot.api.send_message(chat_id: message.chat.id, text: "Locking up your mac.");
              runCommand('/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend');
          when '/blank'
              bot.api.send_message(chat_id: message.chat.id, text: "Invalid command @#{message.from.username} I am still alive.");
          when '/'
              bot.api.send_message(chat_id: message.chat.id, text: show_commands(message.from.username));
          when '/screenshot'
            runCommand('screencapture -x -r -t jpg macbot_screenshot.jpg');
            bot.api.send_message(chat_id: message.chat.id, text: "Preparing screenshot. Please wait....");
            bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('macbot_screenshot.jpg', 'image/jpeg'))
        end
      else
        bot.api.send_message(chat_id: message.chat.id, text: error_msg(message.from.username));
      end
    end
end
