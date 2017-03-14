FROM openjdk:8

ENV ANDROID_HOME /android/android-sdk-linux		
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN mkdir -p /android
RUN wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O /android/android-sdk.tgz \
    && tar -xvzf /android/android-sdk.tgz -C /android \
    && rm -f /android/android-sdk.tgz

# RUN echo y | android update sdk --no-ui --all --filter tools,platform-tools,build-tools-25.0.2,android-25,extra-google-m2repository,extra-google-google_play_services,extra-android-m2repository
