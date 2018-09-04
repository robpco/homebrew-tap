# Custom Homebrew Formula

## CUSTOM UTILITIES

### mcc - multi cloud control of VM Instances across AWS, Azure, GCP and AliCloud

[github.com/robertpeteuil/multi-cloud-control](https://github.com/robertpeteuil/multi-cloud-control)

```bash
brew install robpco/tap/mcc
```

### sysis - lightweight system-information utility

[github.com/robertpeteuil/sysis](https://github.com/robertpeteuil/sysis)

```bash
brew install robpco/tap/sysis
```

Alternatively, this utility can be executed without installation with the command:

```bash
curl -s iac.sh/sysis | sh
```

## ALTERNATE INSTALLERS

### terraform - tool to build, change, and version infrastructure

An alternative to the official brew `terraform` formula which compiles from source and therefore requires `go` and `gox`

- On macOS, it downloads the binary directly from Hashicorp's server
- On Linux, it runs the installer from [https://github.com/robertpeteuil/terraform-installer](https://github.com/robertpeteuil/terraform-installer)

```bash
brew install robpco/tap/terraform
```

### packer - tool for creating identical machine images for multiple platforms

An alternative to the official brew `packer` formula which compiles from source and therefore requires `go` and `gox`

- On macOS, it downloads the binary directly from Hashicorp's server
- On Linux, it runs the installer from [https://github.com/robertpeteuil/packer-installer](https://github.com/robertpeteuil/packer-installer)

```bash
brew install robpco/tap/packer
```
