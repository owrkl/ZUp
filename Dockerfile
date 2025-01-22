FROM python:3.9-slim-buster

# Install dependencies in one layer
RUN apt-get update && \
    apt-get install -y git curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install requirements and heroku3
RUN pip3 install heroku3 && \

# Clone repo
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl

# Set working directory
WORKDIR /root/zlzl

# Install requirements
RUN npm i -g npm && \
    pip3 install --no-cache-dir -r requirements.txt

# Fix the PATH to match working directory
ENV PATH="/root/zlzl/bin:$PATH"

CMD ["python3","-m","zlzl"]
