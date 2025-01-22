FROM python:3.9-slim-buster

# Install git
RUN apt-get update && \
    apt-get install -y git

# Install node and npm first
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    # Install git since we needed it earlier
    apt-get install -y git

#clonning repo
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl
#working directory
WORKDIR /root/zlzl

# Install requirements
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN pip3 install --no-cache-dir -r requirements.txt

ENV PATH="/home/zlzl/bin:$PATH"

CMD ["python3","-m","zlzl"]
