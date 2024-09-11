{ lib, pkg-config, stdenv, fetchgit, fetchurl, ... }:

stdenv.mkDerivation rec {
  pname = "pve-edk2-firmware";
  version = "2024.05.2";


  src = fetchurl {
    url = "http://ftp.de.debian.org/debian/pool/main/e/edk2/ovmf_2022.11-6+deb12u1_all.deb";
    sha256 = "sha256-LqrF7D0h5vAqvkZtUEmPS4jCkgtTYqlg03gs0b11x4w=";
  };

  unpackPhase = ''
    ar x $src
    tar -xvf data.tar.xz
  '';

  buildInputs = [ ];

  nativeBuildInputs = [ ];

  installPhase = ''
    TARGET=$out/usr/share/pve-edk2-firmware
    mkdir -p $TARGET
    cp -r usr/share/OVMF/* $TARGET
  '';

  meta = {
    description = "pve-edk2-firmware 4M for UEFI bios firmwares";
    homepage = "";
    maintainers = with lib.maintainers; [ ];
  };
}
