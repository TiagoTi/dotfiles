FROM basedev:v0
COPY . /root/.yadr
WORKDIR /root/.yadr
CMD [ "/bin/zsh" ]
