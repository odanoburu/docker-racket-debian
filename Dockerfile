FROM debian:9

RUN apt-get update \
    && apt-get install -y \
       wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash racketeer

USER racketeer
WORKDIR /home/racketeer
ENV PATH="~/.local/bin:${PATH}"

RUN mkdir -p .local/bin .local/share/applications .local/share/man/man1 \
    && wget -q https://download.racket-lang.org/releases/6.12/installers/racket-minimal-6.12-x86_64-linux.sh \
    && echo 'no\n3\n/home/racketeer/.local/\n' | sh racket-minimal-6.12-x86_64-linux.sh \
    && rm racket-minimal-6.12-x86_64-linux.sh
