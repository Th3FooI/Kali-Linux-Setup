#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "This script must be run as root."
	echo "Did you also check postgresql?"
	exit 1
fi
chmod a+x aptsources-cleanup.pyz 
sudo apt-get update
sudo apt-get install wget 
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
sudo pg_lsclusters 
sudo pg_dropcluster 16 main --stop 
sudo pg_upgradecluster 15 main
sudo pg_dropcluster 15 main
sudo apt purge postgresql-15 postgresql-client-15
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install accountsservice acl adb adduser adwaita-icon-theme aha aircrack-ng alsa-topology-conf alsa-ucm-conf amass amass-common android-libbase android-libboringssl android-libcutils android-liblog android-libziparchive android-sdk-platform-tools-common apache2 apache2-bin apache2-data apache2-utils apparmor apt apt-file apt-transport-https apt-utils arj arp-scan arping asleap aspell aspell-en at-spi2-common at-spi2-core atftpd atril atril-common attr autoconf automake autopsy autotools-dev avahi-daemon avahi-utils axel backdoor-factory base-files base-passwd base58 bash bash-completion bc beef-xss bettercap bettercap-caplets bettercap-ui bind9-dnsutils bind9-host bind9-libs binfmt-support binutils binutils-aarch64-linux-gnu binutils-common binutils-mingw-w64-i686 binutils-mingw-w64-x86-64 binwalk blt blueman bluez bluez-firmware bluez-hcidump bluez-obexd bsdextrautils bsdutils bubblewrap build-essential bulk-extractor bully bundler busybox bzip2 ca-certificates ca-certificates-java ca-certificates-mono caca-utils cadaver certipy-ad cewl chafa chntpw chromium cifs-utils clang cmake cmatrix commix console-setup coreutils cowpatty cpio crackmapexec creddump7 cron cron-daemon-common crunch cryptcat cryptsetup cryptsetup-initramfs cryptsetup-nuke-password curl curlftpfs cutycapt dash davtest dbd dbus dbus-x11 debconf debconf-i18n debian-archive-keyring debianutils default-jdk default-jdk-doc default-jdk-headless default-jre default-libmysqlclient-dev default-mysql-server diffutils dirb dirbuster dmidecode dmitry dmsetup dns2tcp dnschef dnsenum dnsmasq dnsrecon dnsutils dos2unix dpkg driftnet dsniff e2fsprogs eject enum4linux ethtool evil-winrm exe2hexbat exiv2 expect exploitdb faraday fdisk fern-wifi-cracker ffuf fierce file findutils fonts-dejavu fonts-liberation fping fuse3 gcc gcc-13-base gdisk geany gettext-base git gnome-panel gnome-terminal golang golang-github-jdkato-prose-dev golang-github-jdkato-syllables-dev golang-github-leemcloughlin-jdn-dev gophish gpgv gpp-decrypt grep groff-base grub-common grub-efi-arm64 gss-ntlmssp guymager gvfs gvfs-backends gvfs-common gvfs-daemons gvfs-fuse gvfs-libs gvm gzip hash-identifier hashcat hashcat-utils hashdeep hashid hcxdumptool hcxtools hostapd hostapd-wpe hostname hping3 htop hydra hydra-gtk i2c-tools i2p i2pd ifenslave ifupdown ike-scan impacket-scripts inetsim inetutils-telnet init init-system-helpers initramfs-tools iodine iproute2 iputils-ping isc-dhcp-client isc-dhcp-common isc-dhcp-server iw jd-gui jdim jdns jdresolve jdupes john jq jsbeautifier kali-anonsurf kali-archive-keyring kali-desktop-xfce kali-linux-core kali-linux-firmware kali-root-login kali-system-cli kali-system-core kali-system-gui kali-tools-top10 keyboard-configuration kismet kmod krb5-locales laudanum lbd ldapscripts legion less libacl1 libapache-directory-jdbm-java libapparmor1 libapt-pkg6.0 libargon2-1 libattr1 libaudit-common libaudit1 libblkid1 libbpf1 libbsd0 libbz2-1.0 libc-bin libc6 libcap-ng0 libcap2 libcap2-bin libcastor-jdo-java libcom-err2 libcoq-mathcomp-abel libcrypt1 libcryptsetup12 libcsvjdbc-java libcurl4 libcurl4-openssl-dev libdate-jd-perl libdb5.3 libdebconfclient0 libdevmapper1.02.1 libeclipse-jdt-annotation-java libeclipse-jdt-apt-core-java libeclipse-jdt-apt-pluggable-core-java libeclipse-jdt-astview-java libeclipse-jdt-compiler-apt-java libeclipse-jdt-compiler-tool-java libeclipse-jdt-core-java libeclipse-jdt-core-manipulation-java libeclipse-jdt-debug-java libeclipse-jdt-debug-ui-java libeclipse-jdt-junit-core-java libeclipse-jdt-junit-runtime-java libeclipse-jdt-junit4-runtime-java libeclipse-jdt-launching-java libeclipse-jdt-ui-java libedit2 libelf1 libext2fs2 libfdisk1 libffi8 libfido2-1 libgcc-s1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgssapi-krb5-2 libheif-plugin-libde265 libhogweed6 libhtsjdk-java libhtsjdk-java-doc libidn2-0 libimage-exiftool-perl libip4tc2 libjansson4 libjava-jdbc-clojure libjboss-jdeparser2-java libjboss-jdeparser2-java-doc libjdeb-java libjdepend-java libjdependency-java libjdns-dev libjdns2 libjdo-api-java libjdom1-java libjdom1-java-doc libjdom2-intellij-java libjdom2-java libjson-c5 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3 libkrb5support0 liblocale-gettext-perl liblockfile-bin liblz4-1 liblzma5 libmariadb-dev libmd0 libmnl0 libmongoc-1.0-0 libmount1 libncurses-dev libncursesw6 libnettle8 libnewt0.52 libnfnetlink-dev libnftables1 libnftnl11 libnl-3-dev libnl-genl-3-dev libnss-systemd libopencv-objdetect-dev libopencv-objdetect406 libp11-kit0 libpam-modules libpam-modules-bin libpam-runtime libpam-systemd libpam0g libpcap-dev libpcre2-8-0 libpopt0 libpostgresql-jdbc-java libpostgresql-jdbc-java-doc libproc2-0 libqjdns-qt5-2 libqjdns-qt5-dev libreadline8 libseccomp2 libsejda-commons-java libsejda-eventstudio-java libsejda-injector-java libsejda-io-java libsejda-java libselinux1 libsemanage-common libsemanage2 libsepol2 libslang2 libsmartcols1 libspring-jdbc-java libsqlite-jdbc-java libsqlite-jdbc-jni libss2 libssl-dev libssl3 libstdc++6 libsystemd-shared libsystemd0 libtasn1-6 libtext-charwidth-perl libtext-iconv-perl libtext-wrapi18n-perl libtinfo6 libtirpc-common libtirpc3 libtss2-tctildr0 libudev1 libunistring2 libuuid1 libxml2-utils libxtables12 libxxhash0 libzstd1 lighttpd linux-image-arm64 locales login logrotate logsave lsb-release lsof m4 macchanger magicrescue make man-db manpages maskprocessor masscan mawk mc mdk3 mdk4 mecab-naist-jdic mecab-naist-jdic-eucjp media-types metasploit-framework mime-support mimikatz mingw-w64 minicom miredo mitmproxy mono-devel mount msfpc multimac naist-jdic naist-jdic-utf8 nano nasm nbtscan ncrack ncurses-base ncurses-bin ncurses-hexedit ncurses-term neofetch net-tools netbase netcat-traditional netdiscover netmask netsed netsniff-ng nfs-common nftables ngrep nikto nmap nodejs npm offsec-awae-python2 onesixtyone open-jtalk-mecab-naist-jdic openjdk-11-dbg openjdk-11-demo openjdk-11-doc openjdk-11-jdk openjdk-11-jdk-headless openjdk-11-jre openjdk-11-jre-headless openjdk-11-jre-zero openjdk-11-source openjdk-17-dbg openjdk-17-demo openjdk-17-doc openjdk-17-jdk openjdk-17-jdk-headless openjdk-17-jre openjdk-17-jre-headless openjdk-17-jre-zero openjdk-17-source openjdk-21-dbg openjdk-21-demo openjdk-21-doc openjdk-21-jdk openjdk-21-jdk-headless openjdk-21-jre openjdk-21-jre-headless openjdk-21-jre-zero openjdk-21-source openjdk-22-dbg openjdk-22-demo openjdk-22-doc openjdk-22-jdk openjdk-22-jdk-headless openjdk-22-jre openjdk-22-jre-headless openjdk-22-jre-zero openjdk-22-source openssh-client openssh-server openssl openvpn ophcrack ophcrack-cli os-prober p7zip-full passing-the-hash passwd patator pciutils pcp pdf-parser pdfid perl perl-base php php-cgi php-curl php-mysql php-xml php8.2 pipal pixiewps plocate powershell-empire powersploit procps proxychains4 proxytunnel ptunnel pwnat python-is-python3 python3 python3-apt python3-bjdata python3-cryptography python3-dev python3-gpg python3-impacket python3-ipy python3-jdata python3-jdcal python3-lxml python3-nmap python3-packaging python3-paramiko python3-pip python3-pyqt5 python3-pyshodan python3-regex python3-requests python3-scapy python3-socks python3-tqdm python3-virtualenv qemu-guest-agent qsslcaudit radare2 rake readline-common reaver rebind recon-ng redsocks responder rfkill rpcbind rsmangler ruby sakis3g samba samdump2 sbd scalpel screen scrounge-ntfs secure-delete sed sendemail sensible-utils set shellter:i386 skipfish sleuthkit smbmap snapd snmp snmpcheck snmpd socat speedtest-cli spice-vdagent spice-webdavd spiderfoot spike spooftooph sqlitebrowser sqlmap ssldump sslh sslscan sslsplit sslstrip statsprocessor stunnel4 swaks systemd systemd-dev systemd-sysv systemd-timesyncd sysvinit-utils tar tasksel tcpick tcpreplay testdisk tftp-hpa thc-ipv6 thc-pptp-bruter theharvester tor traceroute tzdata ucf udev udptunnel ufw unix-privesc-check unrar upx-ucl urlcrazy usbutils usr-is-merged util-linux uwsgi-plugin-jvm-openjdk-17 uwsgi-plugin-jwsgi-openjdk-17 uwsgi-plugin-ring-openjdk-17 uwsgi-plugin-servlet-openjdk-17 vboot-kernel-utils vboot-utils vim vim-common vim-tiny virtualenv vlan voiphopper vpnc wafw00f wamerican wce webshells websploit weevely wfuzz wget whatweb whiptail whois wifiphisher wifite windows-binaries wine wine32:i386 winexe wordlists wpscan xdg-utils xfce4-whiskermenu-plugin xjdic xmlstarlet xsltproc xterm xvfb xz-utils zenity zlib1g zlib1g-dev zstd
sudo apt-get upgrade
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade wheel 
pip3 install -r requirements.txt
pip3 install -r requirements.txt --upgrade

./aptsources-cleanup.pyz 

sudo apt-get install docker.io
sudo systemctl enable docker --now
docker pull ghcr.io/mhprodev/mhddos:latest



cd ~ 
rm -rf ~/.pyenv
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
exec $SHELL
pyenv install 2.7.18
pyenv global 2.7.18
pyenv versions
python2 --version
python3 --version
pip2 --version
pip3 --version


echo "software installed!"
echo "now run the INSTALL.sh script.(not as root)"
exit 0 

