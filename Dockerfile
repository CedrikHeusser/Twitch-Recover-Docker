FROM python:3.8

RUN apt update
RUN apt install -y default-jre

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY Twitch.Recover.jar /Twitch.Recover.jar

ENTRYPOINT ["java", "-jar", "/Twitch.Recover.jar"]
