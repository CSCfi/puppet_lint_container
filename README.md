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
