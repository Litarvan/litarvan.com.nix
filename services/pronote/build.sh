export PATH="$gnutar/bin:$coreutils/bin:$gzip/bin"
tar -xzf $src
cd $name
mkdir $out
cp -r ./* $out