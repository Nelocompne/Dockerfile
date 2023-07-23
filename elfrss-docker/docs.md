# 创建bot虚拟环境项目

```bash
python -m venv .venv --prompt nonebot2
source .venv/bin/activate
```

# 安装nonebot2（驱动器） 适配器

```bash
pip install 'nonebot2[fastapi]'
pip install nonebot-adapter-console nonebot-adapter-onebot
```

# 安装插件

```bash
mkdir -p awesome_bot/plugins && mkdir data
git clone https://github.com/Quan666/ELF_RSS
cp -r ELF_RSS/src/plugins/ELF_RSS2 awesome_bot/plugins
pip install -r ELF_RSS/requirements.txt
```

# 复制配置文件
copy bot.py .
copy .env.prod .

运行 `python bot.py`