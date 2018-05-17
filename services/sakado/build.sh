export PATH="$coreutils/bin:$unzip/bin:$gradle/bin"

rm -rf /tmp/sakado-build

cp -r --no-preserve=mode,ownership $src /tmp/sakado-build
cd /tmp/sakado-build

export GRADLE_USER_HOME="/tmp"
gradle distZip

mkdir $out
cd $out
unzip /tmp/sakado-build/build/distributions/$name.zip

rm -rf /tmp/sakado-build
