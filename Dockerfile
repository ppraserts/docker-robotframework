FROM ubuntu:trusty
RUN echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu trusty main" > /etc/apt/sources.list.d//mozillateam-firefox-next-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE49EC21
RUN apt-get update
RUN apt-get install -y firefox xvfb python-pip
RUN apt-get install -y wget
RUN pip install robotframework
RUN pip install --pre --upgrade robotframework-seleniumlibrary
RUN pip install robotframework-xvfb
RUN mkdir -p /root/robotframework_test
ADD robot_test /root/robotframework_test
CMD (Xvfb :10 -ac & export DISPLAY=:10; wget -qO- https://github.com/mozilla/geckodriver/releases/download/v0.19.0/geckodriver-v0.19.0-linux64.tar.gz | tar -xz -C /usr/bin/; pybot -d /root/reports/ /root/robotframework_test/*.robot)