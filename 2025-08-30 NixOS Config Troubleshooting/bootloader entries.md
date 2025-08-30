```
[root@nixos:/]# cat boot/loader/entries/nixos-generation-25.conf 
title NixOS
sort-key nixos
version Generation 25 NixOS Vicuna 24.11.718051.9b5ac7ad4529 (Linux 6.6.90), built on 2025-08-30
linux /EFI/nixos/zkb1s1pzk2100nlfipi5kffigs6a73ny-linux-6.6.90-bzImage.efi
initrd /EFI/nixos/3vjnb91pk8mbpax81izan4d1i6n756d0-initrd-linux-6.6.90-initrd.efi
options init=/nix/store/636lac29pzmm1m8zm8lahzn5halxbb0z-nixos-system-nixos-24.11.718051.9b5ac7ad4529/init loglevel=4
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-24.conf 
title NixOS
sort-key nixos
version Generation 24 NixOS Xantusia 25.11pre-git (Linux 6.12.43), built on 2025-08-30
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/9a4ll2fhgb4skmgv22x955caq5skr40b-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/bikwpnrz9g3chflgx6wbqqhgwsqbbzdx-nixos-system-nixos-25.11pre-git/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-23.conf 
title NixOS
sort-key nixos
version Generation 23 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-30
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/zppkkcxddc4iizr0y7rf858x1i1jf3qj-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-22.conf 
title NixOS
sort-key nixos
version Generation 22 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/82virc0sg59hvb53djk3hp32mihkbsjn-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-21.conf 
title NixOS
sort-key nixos
version Generation 21 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/z8lfkyx3vvsxgpk4cy6089bpdm9kcjpj-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-20.conf 
title NixOS
sort-key nixos
version Generation 20 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/pmz2ak9cfab93r580w7xiflvq6cr838h-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-19.conf 
title NixOS
sort-key nixos
version Generation 19 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/s137qw290h04cl6ff1lf4ckb7k3gs8cf-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-18.conf 
title NixOS
sort-key nixos
version Generation 18 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/z8vakwsjyaxh858f9l5a7dav77l2jdch-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/vp24q7v4b2vmqpsp9q9s9bfb1mnhbhd4-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d


[root@nixos:/]# cat boot/loader/entries/nixos-generation-17.conf 
title NixOS
sort-key nixos
version Generation 17 NixOS Warbler garuda-nix-subsystem-25.05.20250823.b1b3291 (Linux 6.15.11), built on 2025-08-26
linux /EFI/nixos/d80f2cmfgdrrgiprxvziwrclq96kzav2-linux-6.15.11-bzImage.efi
initrd /EFI/nixos/81vlhybgr3yr09bxl5vyf2x99688fm2q-initrd-linux-6.15.11-initrd.efi
options init=/nix/store/4z97hi8dn5sxlxsf3y0y2l3h8w46yl3m-nixos-system-nixos-fh-garuda-nix-subsystem-25.05.20250823.b1b3291/init acpi_call quiet root=fstab loglevel=0 lsm=landlock,yama,bpf nvidia-drm.modeset=1 nvidia-drm.fbdev=1 nvidia.NVreg_OpenRmEnableUnsupportedGpus=1
machine-id dc813fdb44664f839481aba9206f816d
```
title NixOS
sort-key nixos
version Generation 17 NixOS Warbler garuda-nix-subsystem-25.05.20250823.b1b3291 (Linux 6.15.11), built on 2025-08-26
linux /EFI/nixos/d80f2cmfgdrrgiprxvziwrclq96kzav2-linux-6.15.11-bzImage.efi
initrd /EFI/nixos/81vlhybgr3yr09bxl5vyf2x99688fm2q-initrd-linux-6.15.11-initrd.efi
options init=/nix/store/4z97hi8dn5sxlxsf3y0y2l3h8w46yl3m-nixos-system-nixos-fh-garuda-nix-subsystem-25.05.20250823.b1b3291/init acpi_call quiet root=fstab loglevel=0 lsm=landlock,yama,bpf nvidia-drm.modeset=1 nvidia-drm.fbdev=1 nvidia.NVreg_OpenRmEnableUnsupportedGpus=1
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 18 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/z8vakwsjyaxh858f9l5a7dav77l2jdch-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/vp24q7v4b2vmqpsp9q9s9bfb1mnhbhd4-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 19 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/s137qw290h04cl6ff1lf4ckb7k3gs8cf-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 20 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/pmz2ak9cfab93r580w7xiflvq6cr838h-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 21 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/z8lfkyx3vvsxgpk4cy6089bpdm9kcjpj-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 22 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-29
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/82virc0sg59hvb53djk3hp32mihkbsjn-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 23 NixOS Xantusia 25.11.20250828.dfb2f12 (Linux 6.12.43), built on 2025-08-30
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/bspnqz9z718nys6ysw705q9686k4x34v-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/zppkkcxddc4iizr0y7rf858x1i1jf3qj-nixos-system-nixos-25.11.20250828.dfb2f12/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 24 NixOS Xantusia 25.11pre-git (Linux 6.12.43), built on 2025-08-30
linux /EFI/nixos/2pcjcww53jjir5j239w0kwi3z63z1gdg-linux-6.12.43-bzImage.efi
initrd /EFI/nixos/9a4ll2fhgb4skmgv22x955caq5skr40b-initrd-linux-6.12.43-initrd.efi
options init=/nix/store/bikwpnrz9g3chflgx6wbqqhgwsqbbzdx-nixos-system-nixos-25.11pre-git/init loglevel=4 lsm=landlock,yama,bpf
machine-id dc813fdb44664f839481aba9206f816d

title NixOS
sort-key nixos
version Generation 25 NixOS Vicuna 24.11.718051.9b5ac7ad4529 (Linux 6.6.90), built on 2025-08-30
linux /EFI/nixos/zkb1s1pzk2100nlfipi5kffigs6a73ny-linux-6.6.90-bzImage.efi
initrd /EFI/nixos/3vjnb91pk8mbpax81izan4d1i6n756d0-initrd-linux-6.6.90-initrd.efi
options init=/nix/store/636lac29pzmm1m8zm8lahzn5halxbb0z-nixos-system-nixos-24.11.718051.9b5ac7ad4529/init loglevel=4
machine-id dc813fdb44664f839481aba9206f816d

