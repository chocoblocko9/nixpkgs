{
  lib,
  stdenv,
  fetchgit,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "smdev";
  version = "0.2.3-unstable-2015-04-12";

  __structuredAttrs = true;

  src = fetchgit {
    url = "https://git.suckless.org/smdev";
    rev = "8d07540c417e3a31942028318197c89b640278d5";
    hash = "sha256-k/DEYf5h9NHpw9aV4bvblr4tiOOHHYaG3BeiGP0viM0=";
  };

  strictDeps = true;
  enableParallelBuilding = true;

  makeFlags = [ "PREFIX=${placeholder "out"}" ];

  postPatch = ''
    substituteInPlace smdev.c \
      --replace '#include <sys/types.h>' '#include <sys/sysmacros.h>'
  '';

  meta = {
    description = "Mostly mdev-compatible suckless program to manage device nodes";
    homepage = "https://core.suckless.org/smdev";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "smdev";
    maintainers = with lib.maintainers; [ choco98 ];
  };
})
