# PCOM - BRC - GraalVM

**Base Runtime Component: GraalVM** — GraalVM Community JDK 21 re-published for
the Nubo Native Platform (NNP), so Java workloads pull their JDK from the NNP
Docker Hub namespace instead of an external registry.

The image is built `FROM ghcr.io/graalvm/jdk-community:21` and adds only OCI
metadata; the JDK itself is unchanged from upstream.

## Image

Published to Docker Hub on every push to `main`:

```
docker.io/nubonativesolution/pcom-brc-graalvm:21
docker.io/nubonativesolution/pcom-brc-graalvm:latest
```

Architecture: `linux/amd64`.

## Use

```dockerfile
FROM docker.io/nubonativesolution/pcom-brc-graalvm:21
COPY target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

## Build locally

```bash
docker build -t pcom-brc-graalvm:21 .

# Pin a different upstream tag or digest:
docker build --build-arg base_version=21 -t pcom-brc-graalvm:21 .
```

## CI/CD

`.github/workflows/build.yml` is a thin caller for the shared
[`PCOM-CICD`](https://github.com/NNP-Platform-Components-PCOM/PCOM-CICD)
reusable pipeline: build with Buildx, publish with SBOM + provenance, sign with
**cosign keyless** (OIDC), and scan with Trivy and Grype (results in the
**Security** tab). Pull requests build and scan without publishing. The image
is rebuilt weekly to pick up upstream security updates.

## License

Apache-2.0 for the packaging in this repository. GraalVM Community Edition is
distributed by its upstream project under its own license terms.
