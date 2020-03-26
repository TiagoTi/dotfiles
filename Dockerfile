FROM basedev:v0

# Install dotfiles
COPY . /root/.yadr

WORKDIR /root/.yadr
# Let the container know that there is no tty
ENV DEBIAN_FRONTEND readline
# RUN rake install

# Run a zsh session
CMD [ "/bin/zsh" ]
