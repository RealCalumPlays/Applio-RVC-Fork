.PHONY:
.ONESHELL:

help: ## Show this help and exit
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies (Do everytime you start up a paperspace machine)
	apt-get -y install build-essential python3-dev ffmpeg
	pip install --upgrade setuptools wheel
	pip install --upgrade pip
	pip install faiss-gpu fairseq gradio ffmpeg ffmpeg-python praat-parselmouth pyworld numpy==1.23.5 numba==0.56.4 librosa==0.9.1
	pip install -r requirements.txt
	pip install --upgrade lxml
	apt-get update
	apt -y install -qq aria2

basev1: ## Download version 1 pre-trained models (Do only once after cloning the fork)
	mkdir -p pretrained uvr5_weights
	git pull
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/D32k.pth -O pretrained/D32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/D40k.pth -O pretrained/D40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/D48k.pth -O pretrained/D48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/G32k.pth -O pretrained/G32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/G40k.pth -O pretrained/G40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/G48k.pth -O pretrained/G48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0D32k.pth -O pretrained/f0D32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0D40k.pth -O pretrained/f0D40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0D48k.pth -O pretrained/f0D48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0G32k.pth -O pretrained/f0G32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0G40k.pth -O pretrained/f0G40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained/f0G48k.pth -O pretrained/f0G48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/uvr5_weights/HP2-人声vocals+非人声instrumentals.pth -O uvr5_weights/HP2-人声vocals+非人声instrumentals.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/uvr5_weights/HP5-主旋律人声vocals+其他instrumentals.pth -O uvr5_weights/HP5-主旋律人声vocals+其他instrumentals.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/hubert_base.pt -O hubert_base.pt

basev2: ## Download version 2 pre-trained models (Do only once after cloning the fork)
	mkdir -p pretrained_v2 uvr5_weights
	git pull
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/D32k.pth -O pretrained_v2/D32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/D40k.pth -O pretrained_v2/D40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/D48k.pth -O pretrained_v2/D48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/G32k.pth -O pretrained_v2/G32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/G40k.pth -O pretrained_v2/G40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/G48k.pth -O pretrained_v2/G48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0D32k.pth -O pretrained_v2/f0D32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0D40k.pth -O pretrained_v2/f0D40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0D48k.pth -O pretrained_v2/f0D48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0G32k.pth -O pretrained_v2/f0G32k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0G40k.pth -O pretrained_v2/f0G40k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/pretrained_v2/f0G48k.pth -O pretrained_v2/f0G48k.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/uvr5_weights/HP2-人声vocals+非人声instrumentals.pth -O uvr5_weights/HP2-人声vocals+非人声instrumentals.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/uvr5_weights/HP5-主旋律人声vocals+其他instrumentals.pth -O uvr5_weights/HP5-主旋律人声vocals+其他instrumentals.pth
	wget https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/hubert_base.pt -O hubert_base.pt

run-ui: ## Run the python GUI
	python infer-web.py --paperspace --pycmd python

run-cli: ## Run the python CLI
	python infer-web.py --pycmd python --is_cli

tensorboard: ## Start the tensorboard (Run on separate terminal)
	echo https://tensorboard-$$(hostname).clg07azjl.paperspacegradient.com
	tensorboard --logdir logs --bind_all
