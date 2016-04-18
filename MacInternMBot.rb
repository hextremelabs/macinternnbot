require 'telegram/bot'

TOKEN = ""; #Telegram bot token generated from the @BotFather
USER = "" #Your username on telegram

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
  	puts message.text, message.from.username
    case message.text
    	when '/start'
    		if message.from.username == USER
    			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am your mac bot. 
    				You can use me for stuff like remotely shutting down, sleeping and checking the state of your mac. 
    				Here are a few of my commands \n 
    				/alive : Checks if I am alive and responds if I am. Send this command before starting serious commands\n 
    				/sleep : This makes me put your mac to sleep immediately. \n
    				/shutdown : This makes me shut down your mac in 30 seconds. \n
    				/lock : This would lock up your mac.");
    		else
    			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @#{USER}'s mac bot, not yours. :)");
    		end
      		
    	when '/alive'
    		if message.from.username == USER
      			bot.api.send_message(chat_id: message.chat.id, text: "Yes! @#{message.from.username} I am alive.");
      		else
      			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @#{USER}'s mac bot, not yours. :) If you want to set up your mac bot, contact fdamilola@gmail.com");
      		end
      	when '/sleep'
    		if message.from.username == USER
    			bot.api.send_message(chat_id: message.chat.id, text: "Putting your mac to sleep now.");
    			system 'pmset sleepnow'
      		else
      			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @#{USER}'s mac bot, not yours. :) If you want to set up your mac bot, contact fdamilola@gmail.com");
      		end
      	when '/shutdown'
      		if message.from.username == USER
    			bot.api.send_message(chat_id: message.chat.id, text: "Currently not allowed.");
      		else
      			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @#{USER}'s mac bot, not yours. :) If you want to set up your mac bot, contact fdamilola@gmail.com");
      		end
      	when '/lock'
    		if message.from.username == USER
    			bot.api.send_message(chat_id: message.chat.id, text: "Locking up your mac.");
    			system '/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
      		else
      			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @#{USER}'s mac bot, not yours. :) If you want to set up your mac bot, contact fdamilola@gmail.com");
      		end
      	when '/blank'
      		bot.api.send_message(chat_id: message.chat.id, text: "Invalid command @#{message.from.username} I am still alive.");
      	when '/'
     		if message.from.username == USER
     			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am your mac bot. 
    				You can use me for stuff like remotely shutting down, sleeping and checking the state of your mac. 
    				Here are a few of my commands \n 
    				/alive : Checks if I am alive and responds if I am. Send this command before starting serious commands\n 
    				/sleep : This makes me put your mac to sleep immediately. \n
    				/shutdown : This makes me shut down your mac in 30 seconds. \n
    				/lock : This would lock up your mac.");
     		else
     			bot.api.send_message(chat_id: message.chat.id, text: "Hi @#{message.from.username}, I am @fdamilola's bot. He uses me for remotely controlling his mac.");
     		end
      		
  		end
  	end
end