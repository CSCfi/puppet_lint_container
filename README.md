# Run puppet-lint in a CentOS 7 container

## Description

This is a working proof of concept to run puppet-lint in a CentOS 7 container.

## Usage

```bash
./build_container.sh
./run_puppet-lint_container.sh ~/src/puppet-module/
```
### Git pre-commit hook
You could have a pre-commit [git-hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) script in your repository (~/my_puppet_repository/.git/hooks/pre-commit) that calls this container to test your code, no matter if you are using another kind of computer. It should support Mac and Linux but not Windows (pull request welcome).

## Troubleshooting

### no UID/GID for your user

This might happen if your local computer user is deployed via LDAP

https://github.com/containers/podman/blob/main/troubleshooting.md#10-rootless-setup-user-invalid-argument

TL;DR
```bash
echo "${USER}:100000:65536" | sudo tee /etc/subuid
echo "$(id -gn):100000:65536" | sudo tee /etc/subgid
podman system migrate
```

### Error: OCI runtime error: chown `/dev/pts/0`: Invalid argument

cgroup v2 host running cgroup v1 images

Add to kernel boot 
systemd.unified_cgroup_hierarchy=false
