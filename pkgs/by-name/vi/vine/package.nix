{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "vine";
  version = "0-unstable-2026-07-04";

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "VineLang";
    repo = "vine";
    rev = "6620059fe341285d6a22b58ce4d3d9dc1b1e9036";
    hash = "sha256-sWzJflnDNXN/Cddj/J8AOVy1Lu7w1We1k+KyJf1FoLw=";
  };

  cargoHash = "sha256-RHAC09589XQuewvSZ5UAaM1i0/fF9S5vTAoD6/cbGNc=";

  # cargoExtraArgs = "--bin vine";
  env.VINE_ROOT_PATH = "../lib/root";

  postInstall = ''
    mkdir -p $out/lib
    cp -r root $out/lib/root
  '';

  meta = {
    description = "Experimental new programming language based on interaction nets";
    homepage = "https://github.com/VineLang/vine";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ choco98 ];
    mainProgram = "vine";
  };
})

