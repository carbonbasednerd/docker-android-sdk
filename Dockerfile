FROM openjdk:8

ENV ANDROID_HOME /opt/android-sdk-linux		
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# For running 32 bit Android tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

RUN mkdir -p $ANDROID_HOME

RUN wget -q https://dl.google.com/android/repository/tools_r25.2.3-linux.zip?hl=zh-cn -O /opt/tools.zip \
	&& unzip /opt/tools.zip -d $ANDROID_HOME \
	&& rm -f /opt/tools.zip

RUN echo y | android update sdk --no-ui --all --filter tools,platform-tools,build-tools-25.0.2,android-25,extra-google-m2repository,extra-google-google_play_services,extra-android-m2repository