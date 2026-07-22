# Imagem base leve (Alpine)
FROM node:18-alpine

# Diretório de trabalho
WORKDIR /app

# Copia dependências primeiro (cache do Docker)
COPY package*.json ./
RUN npm ci --only=production

# Copia o código
COPY src/ ./src/

# Porta exposta
EXPOSE 3000

# Comando de inicialização
CMD ["node", "src/index.js"]