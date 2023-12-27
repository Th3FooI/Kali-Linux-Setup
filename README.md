##Kali Linux Setup

#Welcome to Kali-Linux-Setup
The setup script will install everything needed to properly run lscript, and will also install 2 other DOS tools, Xerxes (enhanced) and MHDDoS to help set up a new install of Kali Linux

A copy of the rockyou password list is also included for all of your brute-forcing needs (such as in hydra).

**I, the author, won't be taking any legal responsibility for anything illegal users of the script(s)/tool(s) do. If you do something stupid, you are on your own.**

------------------------------------------------------------------------------
#Installation steps
**MADE FOR KALI LINUX**

the setup script for Kali Linux VMs (UTM) is here: 

```

git clone [placeholder]

```

#How to run

**always run as superuser (sudo)**

```

cd Kali-Linux-Setup
chmod a+x setup.sh
sudo ./setup.sh

clear #(or restart your terminal/shell session.)
./INSTALL.sh #(NEVER run this as root.)

```

-------------------------------------------------------------------------------

#Post setup

Install the Lazy script at https://github.com/arismelachroinos/lscript

#Lazy Script installation

**ALWAYS INSTALL AND RUN LSCRIPT AS ROOT**
**CHECK IF YOU INSTALLED DBUSX11**

```
sudo -i
cd
apt-get update
git clone https://github.com/arismelachroinos/lscript.git
cd lscript
chmod +x install.sh
./install.sh
```

#Running lscript
```
sudo -i
cd lscript
./l
```
#Uninstalling lscript

```
sudo -i
cd /root/lscript
./uninstall.sh
rmdir -r /root/lscript 
```

#Running Xerxes (enhanced)
(xerxes (enhanced) will have been already installed if you ran the setup.sh script.)

github repo: https://github.com/sepehrdaddev/Xerxes.git

```
cd ~
cd Xerxes
cd build
cd bin
./Xerxes {options}
```

#Running MHDDoS
(MHDDoS will have been already installed if you ran the setup.sh script.)

github repo: https://github.com/MatrixTM/MHDDoS.git

```
cd ~
cd MHDDoS
python3 start.py {options}
```

**Have Fun!**