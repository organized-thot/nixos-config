let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    libusbmuxd 
    usbmuxd 
    usbmuxd2 
    usbfluxd 

		libimobiledevice 
		libimobiledevice-glue 
		libgeneral 

		ideviceinstaller 
		idevicerestore 
		libideviceactivation 
		ios-deploy

	  ios-safari-remote-debug
    ios-webkit-debug-proxy

    checkra1n
    rcodesign  
    xpwn 

    bark-server
		mactrack
   

  ];
}
