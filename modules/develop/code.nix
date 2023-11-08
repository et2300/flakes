{ config, lib, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = 
    (with pkgs;[
      # Language Analysis
      # sbcl # required by emacs lsp vfork
      universal-ctags

      # CPP
      gcc
      gnumake
      cmake
      clang
      clang-tools

      # Embedded Software
      openocd

      # Rust
      rustup

      # IDE
      jetbrains.clion

      # Warning:
      # The following nixpkgs are packaged by leesin wihout any test!

      # package: nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'
      # install: nix-env -i /nix/store/XXXX

      # Or directly call in the following
      # (callPackage ./stm32cubeide.nix {})
    ]) ++
    (with pkgs-unstable;[
      # stm32cubemx
    ]);
  services.udev.packages = with pkgs;[
    stlink
  ];

}
