FROM ubuntu:latest

# Installiere autossh und den SSH-Client
RUN apt-get update && apt-get install -y autossh openssh-client

# Standard-Ports als Umgebungsvariablen
ENV LOCAL_PORT=2222
ENV VPS_PORT=2022
ENV VPS_IP=127.0.0.1

# Befehl zum Starten des Tunnels
CMD ["/bin/bash", "-c", "autossh -M 0 -f -N -T -L $LOCAL_PORT:localhost:22 sshuser@$VPS_IP -p $VPS_PORT -i /root/.ssh/id_rsa"]
