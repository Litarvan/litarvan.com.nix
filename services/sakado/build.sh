export PATH="$coreutils/bin:$unzip/bin:$gradle/bin"

rm -rf /tmp/sakado-build

cp -r --no-preserve=mode,ownership $src /tmp/sakado-build
cd /tmp/sakado-build

export GRADLE_USER_HOME="/tmp"
gradle distZip

unzip /tmp/sakado-build/build/distributions/$name.zip
cp -r $name $out

rm -rf /tmp/sakado-build
