# начать с образа debian:12
# находимся в домашней директории пользователя (/root)
apt-get update && apt-get install wget git python3 python3-venv libgl1 libglib2.0-0 -y
git clone --branch v1.9.3 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
# -f нужно, чтоб запускать из под рута
# --exit нужно, чтоб выйти по завершении установки всего, что требуется
./webui.sh -f --exit --no-download-sd-model
# спускаемся в папку расширений
cd extensions
# устанавливаем необходимые расширения
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git
git clone https://github.com/BlafKing/sd-civitai-browser-plus.git
git clone https://github.com/adieyal/sd-dynamic-prompts.git
git clone https://github.com/zanllp/sd-webui-infinite-image-browsing.git
git clone https://github.com/lobehub/sd-webui-lobe-theme.git
git clone https://github.com/viyiviyi/stable-diffusion-webui-zoomimage.git
# поднимаемся обратно
cd ..
export COMMANDLINE_ARGS="--no-download-sd-model --listen --port 8090 --theme dark --xformers --enable-insecure-extension-access"
# запускаем сервер
./webui.sh -f
