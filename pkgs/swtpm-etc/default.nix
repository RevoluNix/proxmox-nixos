{ lib, pkg-config, stdenv, fetchgit, fetchurl, ... }:

stdenv.mkDerivation rec {
  pname = "swtpm-etc";
  version = "2024.05.2";


  src = fetchurl {
    url = "http://ftp.de.debian.org/debian/pool/main/s/swtpm/swtpm-tools_0.7.1-1.3_amd64.deb";
    sha256 = "sha256-LqrF7D0h5vAqvkZtUEmPS4jCkgtTYqlg03gs0b11x4w=";
  };

  unpackPhase = ''
    ar x $src
    tar -xvf data.tar.xz
  '';

  buildInputs = [ ];

  nativeBuildInputs = [ ];

  installPhase = ''
    cp -r etc $out/
  '';

  meta = {
    description = "swtmp-tools missing etc file";
    homepage = "";
    maintainers = with lib.maintainers; [ ];
  };
}
