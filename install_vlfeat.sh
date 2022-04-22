#!/bin/bash
# Created by: nlickey 20160408
# Checks to see if vlfeat has been installed before, if so, it removes associated info
# so that it can be re-installed
vlfeat=$(ls -l | grep 'vlfeat' | cut -d ' ' -f 11)
if [ "$vlfeat" = install_vlfeat.sh ];then
        rm -rf /usr/lib/vlfeat
        rm /usr/lib/libvl.so
        sed -i "s/addpath \/usr\/lib\/vlfeat\/toolbox//g" /usr/share/octave/site/m/startup/octaverc
fi

# Downloads VLFeat from GitHub
git clone git://github.com/vlfeat/vlfeat.git /usr/lib/vlfeat

# Compiles VLFeat from source to work with Octave
cd /usr/lib/vlfeat
MKOCTFILE=/usr/bin/mkoctfile make
echo "addpath /usr/lib/vlfeat/toolbox" >> /usr/share/octave/site/m/startup/octaverc
ln -s /usr/lib/vlfeat/bin/glnxa64/libvl.so /usr/lib/libvl.so
