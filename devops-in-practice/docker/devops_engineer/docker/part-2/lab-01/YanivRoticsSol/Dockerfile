# Build Stage
FROM node:18 AS builder
WORKDIR /app
RUN echo "🏗️ Starting Build Stage..."

# Copy package files
COPY package*.json ./
RUN echo "📦 Installing dependencies..."
RUN npm install

# Copy and build
COPY . .
RUN echo "🔨 Running build process..."
RUN npm run build --if-present
RUN echo "✅ Build Stage completed"

# Test Stage
FROM builder AS tester
WORKDIR /app
RUN echo "🧪 Starting Test Stage..."
RUN echo "Running tests..."
RUN npm test
RUN echo "✅ Test Stage completed yaniv"

# Production Stage
FROM node:18-slim AS production
WORKDIR /app
RUN echo "🚀 Starting Production Stage..."

# Copy only necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js ./
RUN echo "📝 Verifying files copied correctly..."
RUN ls -la
RUN echo "✅ Production Stage ready"

EXPOSE 3000
CMD ["node", "server.js"]