import config
import telegram
import sys


if __name__ == '__main__':
    for line in sys.stdin:
        try:
            bot = telegram.Bot(token=config.BOT_TOKEN)
            bot.send_message(config.GROUP_ID, '<pre>' + line + '</pre>', parse_mode=telegram.ParseMode.HTML)
        except:
            # Ignore timeouts
            print("Timeout")

