FROM basedev:v0
RUN git clone --depth=1 https://github.com/tiagoti/dotfiles.git "$HOME/.yadr"
WORKDIR /root/.yadr
COPY . /root/.yadr
CMD [ "/bin/zsh" ]
