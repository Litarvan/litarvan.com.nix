export PATH=$coreutils/bin:$gradle/bin:$unzip/bin:$gnugrep/bin

rm -rf /tmp/sakado-build

cp -r --no-preserve=mode,ownership $src /tmp/sakado-build
cd /tmp/sakado-build

cat << EOF > src/main/resources/log4j2.xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" name="LitarvanCommons">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%d{HH:mm:ss}] [%-5level] [%logger{36}] %msg%n"/>
        </Console>
    </Appenders>
    <Loggers>
        <Root level="info">
            <AppenderRef ref="Console"/>
        </Root>
    </Loggers>
</Configuration>
EOF

export GRADLE_USER_HOME="/tmp"
gradle distZip

unzip /tmp/sakado-build/build/distributions/$name.zip
cp -r $name $out

rm -rf /tmp/sakado-build

mkdir $out/config
ln -s $firebaseConfig $out/config/fcm.json

rm $out/bin/sakado-server.bat

APP_HOME=$out
eval $(cat $out/bin/sakado-server | grep .jar)
echo "#!/usr/bin/env bash" > $out/bin/sakado-server
echo "\$JAVA_HOME/bin/java -cp $CLASSPATH fr.litarvan.sakado.server.Main" >> $out/bin/sakado-server
