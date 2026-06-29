# See full reference at https://devenv.sh/reference/options/
{ pkgs, ...}: {
  languages.go.enable = true; # installs environment delve, gopls, gotools, gomodifytags, impl, go-tools, gotests, iferr
  languages.go.package = pkgs.go_1_26; # holds go version, if not languages.go.enable installs latest go version
  # Install Go packages
  packages = with pkgs; [
    golangci-lint # Linter
    gofumpt # Formatter
  ];

  enterShell = ''
    git --version
  '';
}
