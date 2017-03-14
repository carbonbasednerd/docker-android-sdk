FROM openjdk:8

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

ENV ANDROID_HOME /android/android-sdk-linux		
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN mkdir -p /android
RUN wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O /android/android-sdk.tgz \
    && tar -xvzf /android/android-sdk.tgz -C /android \
    && rm -f /android/android-sdk.tgz

RUN echo y | android update sdk --no-ui --all --filter tools,platform-tools,build-tools-25.0.2,android-25,extra-google-m2repository,extra-google-google_play_services,extra-android-m2repository
