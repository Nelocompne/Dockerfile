import nonebot
from nonebot.adapters.onebot.v11 import Adapter as OneBotV11Adapter


# 初始化 NoneBot
nonebot.init()

app = nonebot.get_asgi()

# 注册适配器
driver = nonebot.get_driver()
driver.register_adapter(OneBotV11Adapter)

# 在这里加载插件
nonebot.load_builtin_plugins("echo")  # 内置插件
# nonebot.load_plugin("thirdparty_plugin")  # 第三方插件
# nonebot.load_plugins("awesome_bot/plugins")  # 本地插件
nonebot.load_plugin("nonebot_plugin_apscheduler")
nonebot.load_plugin("nonebot_plugin_guild_patch")
nonebot.load_plugins("awesome_bot/plugins")

if __name__ == "__main__":
    nonebot.run(app="__mp_main__:app")