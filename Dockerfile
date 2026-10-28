# syntax=docker/dockerfile:1.7
#
# PCOM - BRC - GraalVM
# --------------------
# GraalVM Community JDK 21 re-published under the Nubo Native Platform (NNP)
# runtime images, so workloads can pull the JDK from the NNP Docker Hub
# namespace instead of depending on an external registry.
#
# Upstream: https://github.com/graalvm/container
#
# Build:
#   docker build -t pcom-brc-graalvm:21 .

# Upstream image. Overridable at build time (pin a dated tag or digest for
# reproducible builds).
ARG base_image=ghcr.io/graalvm/jdk-community
ARG base_version=21

FROM ${base_image}:${base_version}

# --- OCI image metadata (populated by CI, overridable at build time) ---------
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION="21"

LABEL org.opencontainers.image.title="pcom-brc-graalvm" \
      org.opencontainers.image.description="GraalVM Community JDK 21 for the Nubo Native Platform runtime images." \
      org.opencontainers.image.vendor="Nubo Native Platform" \
      org.opencontainers.image.source="https://github.com/NNP-Platform-Components-PCOM/PCOM-BRC-GraalVM" \
      org.opencontainers.image.url="https://github.com/NNP-Platform-Components-PCOM/PCOM-BRC-GraalVM" \
      org.opencontainers.image.base.name="${base_image}:${base_version}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.created="${BUILD_DATE}"

RUN java --version
