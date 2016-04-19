require 'telegram/bot'

TOKEN = ""; #Telegram bot token generated from the @BotFather
USER = "" #Your username on telegram

def show_commands(name)
    return "Hi @#{name}, I am your mac bot. You can use me for stuff like remotely shutting down, sleeping and checking the state of your mac. 
    Here are a few of my commands \n
    /alive : Checks if I am alive and responds if I am. Test this command before sending serious commands\n
    /sleep : Puts mac to sleep immediately. \n
    /shutdown : Shuts down your mac immediately. \n
    /lock : Locks your mac immediately.\n
    /batterystat : Check current battery status \n
    /uptime : Returns how long your mac has been up for.\n
    /terminate : Exits your bot.
    "
end

def error_msg(name)
    return "Hi @#{name}, I haven't been set up yet. \n If you want to set up your own mac bot, visit https://github.com/hextremelabs/macinternnbot"
end

def runCommand(command)
  system command
end

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
      #puts message.text, message.from.username
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
          when '/terminate'
            #bot.api.send_message(chat_id: message.chat.id, text: "Killing your macbot");
            #exit
          when '/'
              bot.api.send_message(chat_id: message.chat.id, text: show_commands(message.from.username));
        end
      else
        bot.api.send_message(chat_id: message.chat.id, text: error_msg(message.from.username));
      end
    end
end
