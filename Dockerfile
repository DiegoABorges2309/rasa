FROM rasa/rasa:3.6.10

# Copia los archivos del proyecto al contenedor
COPY . /app

WORKDIR /app

# Instala dependencias si las tienes
USER root
RUN apt-get update && apt-get install -y gcc python3-dev
RUN pip install --no-cache-dir -r requirements.txt
USER 1001

# Comando para iniciar el bot (modo servidor con API)
CMD ["run", "--enable-api", "--cors", "*", "--debug"]