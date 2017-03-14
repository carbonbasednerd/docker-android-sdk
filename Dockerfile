FROM openjdk:8

RUN cd /opt \
    && wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O android-sdk.tgz \
    && tar -xvzf android-sdk.tgz \
    && rm -f android-sdk.tgz

RUN echo y | android update sdk --no-ui --all --filter tools,platform-tools,build-tools-25.0.2,android-25,extra-google-m2repository,extra-google-google_play_services,extra-android-m2repository
