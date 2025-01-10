FROM amd64/ubuntu:latest

# Set image locale.
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=Europe/Warsaw

# Expose some ports to host by default.
EXPOSE 8080 8081 8082 8083 8084 8085
WORKDIR /root

COPY dotFiles/.config/shell ~/.config/
COPY dotFiles/vale ~/
COPY dotFiles/vale.ini ~/
COPY dotFiles/.clangd ~/
COPY dotFiles/.clang-format ~/
COPY dotFiles/.clang-tidy ~/
COPY dotFiles/.cmake-format.yaml ~/
COPY dotFiles/.cpplint ~/
COPY dotFiles/.flake8 ~/

# COPY sources.list /etc/apt/sources.list
# RUN rm -Rf /var/lib/apt/lists/*
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# # getconf GNU_LIBC_VERSION # for glibc 2.17
# # curl -LO https://github.com/neovim/neovim-releases/releases/latest/download/nvim-linux64.tar.gz
# tar -xzvf nvim-linux64.tar.gz
# ln -s ~/tools/nvim-linux64/bin/nvim ~/.local/bin/
# rm nvim-linux64.tar.gz

# deno vale cmakeformat
RUN apt-get update && apt-get -y install curl fzf ripgrep tree git xclip python3 python3-pip nodejs npm tzdata ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config zip unzip python3-venv texlive-latex-extra wget make gawk scdoc build-essential apt-transport-https ca-certificates luarocks doxygen bear fd-find bat clang-tidy clang cmake-format dconf-editor rustup tree-sitter-cli node-json5 python3-pynvim && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O /opt/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && tar -xzvf /opt/nvim-linux64.tar.gz -C /opt && ln -s /opt/nvim-linux64/bin/nvim /usr/bin/ && rm /opt/nvim-linux64.tar.gz && \
    git clone https://github.com/TioeAre/nvim.git ~/.config/nvim && \
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
    wget -P /tmp https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz && tar -xvzf /tmp/lazygit_0.44.1_Linux_x86_64.tar.gz -C /tmp && mv /tmp/lazygit*/lazygit /usr/bin/ && \
    rm -rf /tmp && \
    nvim --headless +PlugInstall +qall
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# pip install cmakelang

CMD ["nvim"]

# docker build --build-arg "HTTP_PROXY=http://127.0.0.1:7890/" --build-arg "HTTPS_PROXY=http://127.0.0.1:7890/"
