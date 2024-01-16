FROM --platform=${BUILDPLATFORM} debian:bullseye as dep

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates \
    cmake golang \
    clang lld build-essential nasm && \
    rm -rf /var/lib/apt/lists/* && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable --no-modify-path --profile minimal
ENV PATH="/root/.cargo/bin:$PATH"

FROM dep as builder

WORKDIR /workdir
COPY . .

RUN git clone https://github.com/google/boringssl deps/boringssl/src

RUN --mount=type=cache,target=/root/.cargo/git/db \
    --mount=type=cache,target=/root/.cargo/registry/cache \
    --mount=type=cache,target=/root/.cargo/registry/index \
    cargo fetch

RUN --mount=type=cache,target=/root/.cargo/git/db \
    --mount=type=cache,target=/root/.cargo/registry/cache \
    --mount=type=cache,target=/root/.cargo/registry/index \
    cargo fix --lib -p clash_lib --allow-no-vcs && \
    rustup target add x86_64-unknown-linux-gnu && \
    cargo build -p clash --target x86_64-unknown-linux-gnu --release && \
    ls -l ./target/x86_64-unknown-linux-gnu/release && \
    mv ./target/x86_64-unknown-linux-gnu/release/clash /clash-rs

FROM debian:bullseye-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /clash-rs /usr/local/bin/clash-rs
ENTRYPOINT ["clash-rs"]