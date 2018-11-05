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

Alternatively, execute utility without installation:

```bash
curl -s iac.sh/sysis | sh
```

## ALTERNATE INSTALLERS

### [terraform](https://www.terraform.io/) - alternative to official brew `terraform` formula

- Doesn't require `go` and `gox` (unlike official installer)
- macOS - downloads binary directly from Hashicorp
- Linux - runs installer from [https://github.com/robertpeteuil/terraform-installer](https://github.com/robertpeteuil/terraform-installer)

```bash
brew install robpco/tap/terraform
```

### [packer](https://www.packer.io/) - alternative to official brew `packer` formula

- Doesn't require `go` and `gox` (unlike official installer)
- macOS - downloads binary directly from Hashicorp
- Linux - runs installer from [https://github.com/robertpeteuil/packer-installer](https://github.com/robertpeteuil/packer-installer)

```bash
brew install robpco/tap/packer
```
