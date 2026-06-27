{
  lib,
  gcc15Stdenv,
  fetchFromGitHub,
  cmake,
  glaze,
  pkg-config,
}:

gcc15Stdenv.mkDerivation (finalAttrs: {
  pname = "hyprwire-protocols";
  version = "0-unstable-19-07-2026";

  src = fetchFromGitHub {
    owner = "hyprwm";
    repo = "hyprwire-protocols";
    rev = "ad380992d10640d69dab2b9c6b9508a4316af0db";
    hash = "sha256-jusPoIN0PjUmmryMLsJjciBEBEVn4UdhOQsxUhvGpwE=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [ glaze ];

  meta = {
    homepage = "https://github.com/hyprwm/hyprwire-protocols";
    description = "Wayland protocol extensions for Hyprland";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.hyprland ];
    platforms = lib.platforms.linux;
  };
})
