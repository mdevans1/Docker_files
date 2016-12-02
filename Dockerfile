<<<<<<< HEAD
FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense
RUN kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/1.0.0.zip

CMD ["/tmp/entrypoint.sh"]
=======
FROM kibana:5
>>>>>>> a776151221182dcfaec7df727459e208c895d25b
