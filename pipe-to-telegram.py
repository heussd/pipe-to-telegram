import telegram
import sys
import os

telegram_bot_token = os.getenv('BOT_TOKEN')
telegram_group_id = os.getenv('GROUP_ID')

def send_message(message):
    bot = telegram.Bot(token=telegram_bot_token)
    bot.send_message(telegram_group_id, '<pre>' + message + '</pre>', parse_mode=telegram.ParseMode.HTML)

if __name__ == '__main__':
    send_message("Pipe to Telegram started!")

    for line in sys.stdin:
        print(line)
        try:
            send_message(line)        
        except:
            # Ignore timeouts
            print("Timeout")

