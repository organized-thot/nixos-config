{ stdenv, fetchurl, kernel }:

stdenv.mkDerivation {
  name = "nvidia-drivers-${version}";
  version = "525.116.03";

  src = fetchurl {
    url = "https://download.nvidia.com/X11/Linux-64-bit/${version}/NVIDIA-Linux-x86_64-${version}.run";
    sha256 = "your-sha256-hash"; # Calculate this hash or use the one provided by Nvidia
  };

  buildInputs = [ kernel.dev ];

  # Build and installation script
  buildPhase = ''
    sh NVIDIA-Linux-*-${version}.run --extract-only
    cd NVIDIA-Linux-*-${version}
    ./nvidia-installer --no-depmod
  '';

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';

  meta = {
    description = "Nvidia Quadro P3200 Linux Graphics Driver";
    homepage = https://www.nvidia.com;
    license = stdenv.lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
