# docker secops

- how to enhance your pipeline to ensure you docker builds are safe, secure and production ready

- the entire pipeline is automated to run it locally just follow the normal docker commands of build and container run

```bash
docker build -t checker:v1.0.0 .
```

```bash
docker run --name checker -d checker:v1.0.0
```

[local url](http://localhost:4000/latest-launch)

## References

### Github Actions

[git checkout](https://github.com/actions/checkout)
[trivy](https://github.com/aquasecurity/trivy-action)
[gitleaks](https://github.com/gitleaks/gitleaks-action)
[docker lint](https://github.com/hadolint/hadolint-action)
[software components](https://github.com/anchore/sbom-action)
[docker login](https://github.com/docker/login-action)
[docker image sign](https://github.com/sigstore/cosign-installer)
[docker build](https://docs.docker.com/reference/cli/docker/buildx/build/)
[docker push](https://docs.docker.com/reference/cli/docker/image/push/)

### Slack

[app and webhooks](https://api.slack.com/quickstart)

### Cosign

[install](https://docs.sigstore.dev/cosign/system_config/installation/)

```bash
cosign verify --certificate-identity "<certificate_identity>" <image_with_tag> --certificate-oidc-issuer-regexp "<issuer>"
```
