FROM cimg/rust:1.71.1 AS tools-builder

RUN sudo apt update && sudo apt install -qq libssl-dev && sudo rm -rf /var/apt/lists/*

RUN cargo install --root /home/circleci/project just --version ^0.10
RUN cargo install --root /home/circleci/project cargo-readme --version ^3.2
RUN cargo install --root /home/circleci/project cargo-deadlinks --version ^0.8
RUN cargo install --root /home/circleci/project lychee --version ^0.8

FROM cimg/rust:1.71.1

USER root

RUN apt-get update && apt-get install -y \
    libsdl2-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

USER circleci

RUN rustup toolchain add nightly --profile minimal --component rustfmt

COPY --from=tools-builder /home/circleci/project/* /home/circleci/.cargo/bin/
