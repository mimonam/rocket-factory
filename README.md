# Rocket factory

> A microservices platform for managing rocket-parts orders.

## About

A learning project that implements a microservices platform for managing orders
of rocket parts.

**Architecture:** 7 services, gRPC + REST, Kafka, PostgreSQL, MongoDB, and a full
observability stack.

## Tech stack

- **Go** 1.26
- **devenv** (Nix) — reproducible dev environment (`devenv.nix`)
- **direnv** — auto-activates the environment (`.envrc`)
- **golangci-lint**, **gofumpt** — linting & formatting

## Prerequisites

- [Nix](https://nixos.org/)
- [devenv](https://devenv.sh/getting-started/)
- [direnv](https://direnv.net/)

## Getting started

```sh
direnv allow     # one-time: auto-activate the dev shell on cd
# …or enter it manually:
devenv shell
```

The Go module is already initialized (`go.mod`). Pull and tidy dependencies:

```sh
task tidy
```

## Ignored files

`.gitignore` is project-scoped: it ignores only artifacts of this repo's toolchain (.devenv/, .direnv/). OS and editor files (.DS_Store, .idea/, .vscode/) are intentionally left out — set up a global ignore once and forget:
```sh
git config --global core.excludesfile ~/.config/git/ignore
cat >> ~/.config/git/ignore <<'EOF'
.DS_Store
.idea/
.vscode/
EOF
```

## Common tasks

Tasks are defined in [`Taskfile.yml`](Taskfile.yml) and run with
[`task`](https://taskfile.dev/) (installed via devenv). Run `task --list` to see
them all.

| Command       | Description                        |
|---------------|------------------------------------|
| `task build`  | Build all packages                 |
| `task test`   | Run tests with the race detector   |
| `task lint`   | Run golangci-lint                  |
| `task fmt`    | Format the code (gofumpt)          |
| `task tidy`   | `go mod tidy`                      |
| `task update` | Upgrade dependencies (`go get -u`) |
| `task check`  | Check code before push to github   |

## CI

[`.github/workflows/check.yml`](.github/workflows/check.yml) runs on pushes to `main`
and on pull requests:

- **Lint** — `golangci-lint`
- **Build** — `go build ./...`
- **Test** — `go test -race ./...`

## Project structure

```
.
├── .envrc                  # direnv — auto-activates the devenv shell
├── .gitignore
├── devenv.nix              # dev environment definition
├── devenv.lock             # pinned devenv inputs
├── go.mod                  # Go module (rocket-factory)
├── LICENSE                 # MIT
└── README.md
```


## License

This project is licensed under the [MIT License](LICENSE).