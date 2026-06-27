{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  glaze,
  pkg-config,
  hyprwire,
  hyprutils,
  hyprtoolkit,
  pixman,
  aquamarine,
  hyprgraphics,
  hyprwire-protocols,
  libuuid,
  libdrm,
  cairo,
  pango,
  libGL,
  libxkbcommon,
  openssl,
  version ? "git",
  shortRev ? "",
}:

stdenv.mkDerivation {
  pname = "hyprtavern";
  inherit version;

  src = fetchFromGitHub {
    owner = "hyprwm";
    repo = "hyprtavern";
    rev = "8cb7cf336e5ceb0146ef745815490353dfa28223";
    hash = "sha256-fe4MUqZPGLZP+CMy/yFhAozFqkFThkrB0Uq3rHogB2Q=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    glaze
    hyprwire
    hyprutils
    libuuid
    libdrm
    pixman
    openssl
    cairo
    pango
    hyprgraphics
    hyprtoolkit
    hyprwire-protocols
    aquamarine
    libGL
    libxkbcommon
  ];

  cmakeFlags = lib.mapAttrsToList lib.cmakeFeature {
    HYPRTAVERN_COMMIT = shortRev;
    HYPRTAVERN_VERSION_COMMIT = "";
  };

  meta = {
    homepage = "https://github.com/hyprwm/hyprtavern";
    description = "A modern, simple and consistent session bus for IPC discovery.";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
    mainProgram = "hyprtavern";
  };
}
