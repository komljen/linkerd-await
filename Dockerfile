FROM rust:1.48 AS build-stage
WORKDIR /src
COPY . .
RUN cargo build --release

FROM scratch AS export-stage
COPY --from=build-stage /src/target/release/linkerd-await /
