#!/bin/bash  

installdir = ""

while [ ! -e $installdir ]
do
read -p "Installation directory? " installdir
done


if [ ! -e /home/$USER/Executables/ ]
then
    mkdir /home/$USER/Executables/
fi
       
clear
read -p "Install Git? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
sudo apt-get update
sudo apt-get install git
fi

cd ~

clear
read -p "Link home directories to DATA? [y/N]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
  if [ -e Documents ]
  then rmdir Documents
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Documents" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Documents"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Documents" /home/$USER/ 

  if [ -e Downloads ]
  then rmdir Downloads
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Downloads" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Downloads"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Downloads" /home/$USER/ 

  if [ -e sketchbook ]
  then rmdir sketchbook
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/sketchbook" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/sketchbook"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/sketchbook" /home/$USER/

  if [ -e cuda-workspace ]
  then rmdir cuda-workspace
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/cuda-workspace" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/cuda-workspace"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/cuda-workspace" /home/$USER/

  if [ -e Music ]
  then rmdir Music
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Music" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Music"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Music" /home/$USER/ 

  if [ -e Pictures ]
  then rmdir Pictures
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Pictures" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Pictures"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Pictures" /home/$USER/ 

  if [ -e Public ]
  then rmdir Public
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Public" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Public"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Public" /home/$USER/ 

  if [ -e Templates ]
  then rmdir Templates
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Templates" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Templates"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Templates" /home/$USER/ 

  if [ -e Videos ]
  then rmdir Videos
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Videos" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Videos"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Videos" /home/$USER/ 

  if [ -e Executables ]
  then rmdir Executables
  fi
  if [ ! -e "/media/$USER/DATA/Ubuntu Home/Executables" ]
  then mkdir "/media/$USER/DATA/Ubuntu Home/Executables"
  fi
  ln -s "/media/$USER/DATA/Ubuntu Home/Executables" /home/$USER/ 

read -p "Press enter to continue."
fi


clear
read -p "Install gksu? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing gksu ..."
sudo apt-get install "gksu"
fi

clear
read -p "Do you want to automatically mount an NTFS partition? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
echo "Select the right drive  and the right partition, click more actions (gears), Edit Mount Options, check Mount at startup, uncheck Show in user interface because of a bug, and change the mount point."
read -p "Press [Enter] key to open Disks."
gnome-disks
fi

clear
read -p "Install Google Chrome? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Google Chrome ..."
cd /tmp/
rm "google-chrome-stable_current_amd64.deb"
echo "Downloading ..."
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
echo "Installing ..."
sudo dpkg -i "google-chrome-stable_current_amd64.deb"
sudo apt-get -f install
fi

clear
read -p "Install Ubuntu Restricted Extras? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Ubuntu Restricted Extras ..."
sudo apt-get install "ubuntu-restricted-extras"
fi

clear
read -p "Install Oracle Virtualbox? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Oracle Virtualbox ..."
cd /tmp/
rm "virtualbox-5.0_5.0.22-108108~Ubuntu~xenial_amd64.deb"
echo "Downloading ..."
wget "http://download.virtualbox.org/virtualbox/5.0.22/virtualbox-5.0_5.0.22-108108~Ubuntu~xenial_amd64.deb"
echo "Installing ..."
sudo apt-get install libqt4-opengl
sudo dpkg -i "virtualbox-5.0_5.0.22-108108~Ubuntu~xenial_amd64.deb"
sudo apt-get -f install
fi

clear
read -p "Do you want to connect the subwoofer? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
sudo apt-get install alsa-tools alsa-tools-gui
echo "Select Show unconnected pins, find pin 0x10, choose Internal Speaker (LFE) and install Boot Override. This will take effect after you restart."
read -p "Press [Enter] key to open HdaJackRetask."
hdajackretask
fi

clear
read -p "Install Spotify? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Spotify ..."
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client
fi

clear
read -p "Install CPU indicator? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing  CPU indicator ..."
sudo apt-get install "indicator-cpufreq"
fi

clear
read -p "Install Oracle Java 8? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Adding ppa ..."
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
clear
echo "Installing Oracle Java 8 ..."
sudo apt-get install oracle-java8-installer
fi

clear
read -p "Install CUDA? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing CUDA ..."
cd /tmp/
# if [ ! -e cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb ]
if [ ! -e cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb ]
then
echo "Downloading ..."
# wget "http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb"
wget "http://developer.download.nvidia.com/compute/cuda/8.0/secure/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb"
fi
# sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
fi

clear
read -p "Install Blender 2.77a? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ ! -e blender-2.77a-linux-glibc211-x86_64.tar.bz2 ]
then
echo "Downloading Blender ..."
wget "http://download.blender.org/release/Blender2.77/blender-2.77a-linux-glibc211-x86_64.tar.bz2"
fi
echo "Extracting ..."
tar jxf blender-2.77a-linux-glibc211-x86_64.tar.bz2
mv blender-2.77a-linux-glibc211-x86_64/ /home/$USER/Executables/blender-2.77a 
sudo touch /usr/share/applications/blender.desktop
echo "[Desktop Entry]
Version=2.77a
Name=Blender
Comment=Blender
Exec=/home/$USER/Executables/blender-2.77a/blender
Icon=/home/$USER/Executables/blender-2.77a/icons/scalable/apps/blender.svg
Terminal=false
Type=Application
Categories=AudioVideo;Video;Game;Graphics;" | sudo tee /usr/share/applications/blender.desktop
sudo chmod a+x /usr/share/applications/blender.desktop 
echo "application/x-blender=blender.desktop" | sudo tee --append /usr/share/applications/defaults.list
fi

clear
read -p "Install Processing 3.1.1? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ ! -e processing-3.1.1-linux64.tgz ]
then
echo "Downloading Processing 3.1.1 ..."
wget "http://download.processing.org/processing-3.1.1-linux64.tgz"
fi
echo "Extracting ..."
tar -xzf processing-3.1.1-linux64.tgz
mv processing-3.1.1/ /home/$USER/Executables/processing-3.1.1/
sudo touch /usr/share/applications/processing.desktop && echo "[Desktop Entry]
Version=3.1.1
Name=Processing
Comment=Processing
Exec=/home/$USER/Executables/processing-3.1.1/processing
Icon=/home/$USER/Executables/processing-3.1.1/lib/icons/pde-256.png
Terminal=false
Type=Application
Categories=AudioVideo;Video;Game;Graphics;Education;Development;" | sudo tee /usr/share/applications/processing.desktop
sudo chmod a+x /usr/share/applications/processing.desktop 
sudo touch /usr/share/mime/packages/processing.xml && echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
    <mime-type type=\"text/x-processing\">
        <comment>Processing source code</comment>
        <sub-class-of type=\"text/x-csrc\"/>
        <glob pattern=\"*.pde\"/>
    </mime-type>
</mime-info>" | sudo tee /usr/share/mime/packages/processing.xml
sudo update-mime-database /usr/share/mime
echo "text/x-processing=processing.desktop" | sudo tee --append /usr/share/applications/defaults.list
fi

clear
read -p "Install Arduino 1.6.8? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ -e arduino-1.6.8-linux64.tar.xz ]
then
    rm arduino-1.6.8-linux64.tar.xz
fi
echo "Downloading Arduino 1.6.8 ..."
wget "https://downloads.arduino.cc/arduino-1.6.8-linux64.tar.xz"
echo "Extracting ..."
tar -xf arduino-1.6.8-linux64.tar.xz
mv arduino-1.6.8/ /home/$USER/Executables/arduino-1.6.8
cd ~/Executables/arduino-1.6.8/
./install.sh
sudo usermod -a -G dialout $USER
fi

clear
read -p "Install Teensyduino 1.28? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
cd /tmp/
if [ -e 49-teensy.rules ]
then
    rm 49-teensy.rules
fi
wget https://www.pjrc.com/teensy/49-teensy.rules
sudo cp 49-teensy.rules /etc/udev/rules.d/

if [ -e TeensyduinoInstall.linux64 ]
then
    rm TeensyduinoInstall.linux64
fi
wget https://www.pjrc.com/teensy/td_128/TeensyduinoInstall.linux64
chmod +x TeensyduinoInstall.linux64
./TeensyduinoInstall.linux64
fi

## Brackets
clear
read -p "Install Brackets 1.7? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Brackets 1.7 ..."
cd /tmp/
if [ -e "libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb" ]
    then rm "libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb"
fi
if [ -e "Brackets.Release.1.7.64-bit.deb" ]
    then rm "Brackets.Release.1.7.64-bit.deb"
fi
echo "Downloading ..."
wget "https://github.com/adobe/brackets/releases/download/release-1.7/Brackets.Release.1.7.64-bit.deb"
wget https://launchpadlibrarian.net/201289896/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
echo "Installing ..."
sudo dpkg -i "libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb"
sudo apt-get -f install
sudo dpkg -i "Brackets.Release.1.7.64-bit.deb"
sudo apt-get -f install
fi

## Visual Studio Code
clear
read -p "Install Visual Studio Code 1.4.0? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing Visual Studio Code 1.4.0 ..."
cd /tmp/
if [ -e "code_1.4.0-1470329130_amd64.deb" ]
    then rm "code_1.4.0-1470329130_amd64.deb"
fi
echo "Downloading ..."
wget "https://az764295.vo.msecnd.net/stable/6276dcb0ae497766056b4c09ea75be1d76a8b679/code_1.4.0-1470329130_amd64.deb"
echo "Installing ..."
sudo dpkg -i "code_1.4.0-1470329130_amd64.deb"
sudo apt-get -f install
fi

## Code::Blocks
clear
read -p "Install Code::Blocks? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
sudo add-apt-repository ppa:damien-moore/codeblocks-stable
sudo apt-get update
sudo apt-get install codeblocks
fi

## Installer for JUCE (https://www.juce.com/)
clear
read -p "Install Juce Grapefruit? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
    cd ~ 
    if [ -e "JUCE/Projects" ]
    then
        mv JUCE/Projects/ /tmp/tmpJUCEProjects/
    fi
    if [ -e "JUCE" ]
    then
        rm -rf JUCE
    fi

    ## https://forum.juce.com/t/freeze-when-opening-filechooser/16026/38
    echo "Cloning Juce Grapefruit (developer) ..."
    #git clone -b develop https://github.com/julianstorer/JUCE
    git clone https://github.com/julianstorer/JUCE.git

    ## Install dependencies for Juce: (https://forum.juce.com/t/juce-4-2-1-setup-on-apt-based-linux-ubuntu-16-04-lts-mint-elementary-os-freya/17164)
    sudo apt-get -q update
    sudo apt-get -y --force-yes install llvm clang libfreetype6-dev libx11-dev libxinerama-dev libxrandr-dev libxcursor-dev mesa-common-dev libasound2-dev freeglut3-dev libxcomposite-dev libcurl4-gnutls-dev
    
    ## change the default compiler path
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++

    ## Create a 'Projects' folder or put the old one back
    if [ -e "/tmp/tmpJUCEProjects" ]
    then
        mv /tmp/tmpJUCEProjects/ JUCE/Projects/
    else
        mkdir JUCE/Projects
    fi

    ## Build the Projucer from Source code
    cd JUCE/extras/Projucer/Builds/LinuxMakefile
    make -j 8 CONFIG=Release

    if [ ! $? -eq 0 ]
    then
        echo "Building the Projector failed."
        exit
    fi

    mv build/Projucer ~/JUCE/

    ## Create a Desktop launcher
    sudo touch /usr/share/applications/projucer.desktop
    echo "[Desktop Entry]
Name=Projucer
Comment=Juce Grapefruit Projucer
Exec=/home/$USER/JUCE/Projucer
Icon=/home/$USER/JUCE/extras/Projucer/Source/BinaryData/juce_icon.png
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Graphics;Development;IDE;ProjectManagement;" | sudo tee /usr/share/applications/projucer.desktop
    sudo chmod a+x /usr/share/applications/projucer.desktop

    ## Add the MIME type to the system, so .jucer files will automatically open with the Projucer
    sudo touch /usr/share/mime/packages/juce.xml
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
        <mime-type type=\"application/x-juce\">
            <comment>JUCE project</comment>
            <sub-class-of type=\"application/xml\"/>
            <glob pattern=\"*.jucer\"/>
        </mime-type>
    </mime-info>" | sudo tee /usr/share/mime/packages/juce.xml
    sudo update-mime-database /usr/share/mime
    echo "application/x-juce=projucer.desktop" | sudo tee --append /usr/share/applications/defaults.list
    echo "Installed"
fi
## Steinberg VST SDK 3
clear
read -p "Download Steinberg VST SDK 3? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
    cd /tmp/
    if [ -e vstsdk365_12_11_2015_build_67.zip ]
    then
        rm vstsdk365_12_11_2015_build_67.zip
    fi
    echo "Downloading Steinberg VST3 SDK ..."
    wget http://www.steinberg.net/sdk_downloads/vstsdk365_12_11_2015_build_67.zip
    echo "Extracting ..."
    unzip -q vstsdk365_12_11_2015_build_67.zip
    if [ ! -e "/home/$USER/SDKs" ]
    then
        mkdir "/home/$USER/SDKs"
    fi
    if [ -e "/home/$USER/SDKs/VST3 SDK" ]
    then
        rm -r "/home/$USER/SDKs/VST3 SDK"
    fi
    mv "VST3 SDK/" "/home/$USER/SDKs"

    echo "Downloaded."
fi

clear
read -p "Install Boost 1.61.0? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ -e boost_1_61_0.tar.bz2 ]
then
    rm boost_1_61_0.tar.bz2
fi
echo "Downloading Boost 1.61.0 ..."
wget "http://downloads.sourceforge.net/project/boost/boost/1.61.0/boost_1_61_0.tar.bz2?r=&ts=1466631392&use_mirror=liquidtelecom"
echo "Extracting ..."
mv "boost_1_61_0.tar.bz2?r=&ts=1466631392&use_mirror=liquidtelecom" boost_1_61_0.tar.bz2
tar -jxf boost_1_61_0.tar.bz2
cd boost_1_61_0/
sudo ./bootstrap.sh
sudo ./b2 install
sudo ldconfig
read -p "Press enter to continue."
fi

clear
read -p "Install qjackctl? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
echo "Installing qjackctl ..."
cd /tmp/
rm "qjackctl_0.4.2-0ubuntu2_amd64.deb"
echo "Downloading ..."
wget "http://launchpadlibrarian.net/252204219/qjackctl_0.4.2-0ubuntu2_amd64.deb"
echo "Installing ..."
sudo dpkg -i "qjackctl_0.4.2-0ubuntu2_amd64.deb"
sudo apt-get -f install
fi

clear
read -p "Install Eclipse Neon? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ -e eclipse-inst-linux64.tar.gz ]
then
    rm eclipse-inst-linux64.tar.gz
fi
echo "Downloading Eclipse Neon ..."
wget "http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/oomph/epp/neon/R/eclipse-inst-linux64.tar.gz"
echo "Extracting ..."
tar -xzf eclipse-inst-linux64.tar.gz
eclipse-installer/eclipse-inst
fi

clear
read -p "Install Android Studio? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then 
cd /tmp/
if [ -e android-studio-ide-145.3330264-linux.zip ]
then
    #rm android-studio-ide-145.3330264-linux.zip
echo "No download"
fi
echo "Downloading Android Studio ..."
#wget "https://dl.google.com/dl/android/studio/ide-zips/2.2.1.0/android-studio-ide-145.3330264-linux.zip"
echo "Extracting ..."
unzip android-studio-ide-145.3330264-linux.zip
# sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386 lib32bz2-1.0 
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo usermod -a -G libvirtd $USER

mv android-studio/ ~/Executables/android-studio
cd ~/Executables/android-studio
./bin/studio.sh
fi

clear
read -p "Install Eagle 7.7? [Y/n]: " inst
if [ "$inst" = y ] || [ "$inst" = Y ]
then
	if [ ! -e ~/Downloads/eagle-lin64-7_7_0.run ]
	then 
	    echo -e "Please download Eagle 7.7.0 for Linux x64 from https://cadsoft.io/download/ to your ~/Downloads folder.\r\n[ Enter ] to continue."
		read -p ""
	fi
	if [ -e ~/Downloads/eagle-lin64-7_7_0.run ]
	then
		echo -e "${LGREEN}Eagle 7.7.0 found${NC}"
		cd ~/Downloads/
		chmod +x eagle-lin64-7_7_0.run
		sudo apt-get install libxrender1:i386 libxrandr2:i386 libxcursor1:i386 libfreetype6:i386 libfontconfig1:i386 libxext6:i386 libx11-6:i386 libxi6:i386 libssl1.0.0:i386 libstdc++6:i386 libgcc1:i386 libc6:i386 libc6-i386 libxfixes3:i386 libexpat1:i386 libxcb1:i386 libxdmcp6:i386 libxau6:i386
		sudo ./eagle-lin64-7_7_0.run
		sudo ln -s /opt/eagle-7.7.0/bin/eagle /usr/bin
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Epf.svg /usr/share/icons/hicolor/scalable/apps/eagle.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Sch.svg /usr/share/icons/Humanity/mimes/48/x-eagle-schematic.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Brd.svg /usr/share/icons/Humanity/mimes/48/x-eagle-board.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Lbr.svg /usr/share/icons/Humanity/mimes/48/x-eagle-library.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Epf.svg /usr/share/icons/Humanity/mimes/48/x-eagle-project.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Scr.svg /usr/share/icons/Humanity/mimes/48/x-eagle-script.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Ulp.svg /usr/share/icons/Humanity/mimes/48/x-eagle-ulp.svg
		sudo ln -s /opt/eagle-7.7.0/bin/icons/Cam.svg /usr/share/icons/Humanity/mimes/48/x-eagle-cam.svg
		
		sudo touch /usr/share/applications/eagle.desktop && echo "[Desktop Entry]
Name=Eagle
Comment=Eagle CAD
Version=7.7.0
Exec=eagle
Icon=eagle
Terminal=false
Type=Application
Categories=Development;ProjectManagement;" | sudo tee /usr/share/applications/eagle.desktop
        sudo chmod a+x /usr/share/applications/eagle.desktop
		
		sudo touch /usr/share/mime/packages/eagle.xml && echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
    <mime-type type=\"application/x-eagle-schematic\">
        <comment>Eagle Schematic</comment>
        <sub-class-of type=\"text/xml\"/>
        <generic-icon name=\"x-eagle-schematic\"/>
        <glob pattern=\"*.sch\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-board\">
        <comment>Eagle Board</comment>
        <sub-class-of type=\"text/xml\"/>
        <generic-icon name=\"x-eagle-board\"/>
        <glob pattern=\"*.brd\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-library\">
        <comment>Eagle Library</comment>
        <sub-class-of type=\"text/xml\"/>
        <generic-icon name=\"x-eagle-library\"/>
        <glob pattern=\"*.lbr\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-project\">
        <comment>Eagle Project</comment>
        <sub-class-of type=\"text/plain\"/>
        <generic-icon name=\"x-eagle-project\"/>
        <glob pattern=\"*.epf\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-script\">
        <comment>Eagle Script</comment>
        <sub-class-of type=\"text/plain\"/>
        <generic-icon name=\"x-eagle-script\"/>
        <glob pattern=\"*.scr\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-ulp\">
        <comment>Eagle User Language Program</comment>
        <sub-class-of type=\"text/plain\"/>
        <generic-icon name=\"x-eagle-ulp\"/>
        <glob pattern=\"*.ulp\"/>
    </mime-type>
    <mime-type type=\"application/x-eagle-cam\">
        <comment>Eagle CAM Job</comment>
        <sub-class-of type=\"text/plain\"/>
        <generic-icon name=\"x-eagle-cam\"/>
        <glob pattern=\"*.cam\"/>
    </mime-type>
</mime-info>" | sudo tee /usr/share/mime/packages/eagle.xml
        sudo gtk-update-icon-cache /usr/share/icons/Humanity
        sudo update-mime-database /usr/share/mime
        sudo gtk-update-icon-cache /usr/share/icons/hicolor
        echo "application/x-eagle-schematic=eagle.desktop
application/x-eagle-board=eagle.desktop
application/x-eagle-library=eagle.desktop
application/x-eagle-project=eagle.desktop
application/x-eagle-script=eagle.desktop
application/x-eagle-ulp=eagle.desktop
application/x-eagle-cam=eagle.desktop" | sudo tee --append /usr/share/applications/defaults.list
		
		sudo eagle
	else
		echo -e "${LRED}Eagle 7.7.0 not found. Installation canceled.${NC}"
	fi
fi

