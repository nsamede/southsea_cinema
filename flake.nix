{
  description = "Flutter Course";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      devShells."x86_64-linux".default = pkgs.mkShell {
        packages = with pkgs; [
          dart
          flutter
          vscode
          google-chrome
        ];

        shellHook = "tmux";

        CHROME_EXECUTABLE = "${pkgs.google-chrome.out}/bin/google-chrome-stable";
      };
    };
}
