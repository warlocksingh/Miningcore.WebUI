# Use official nginx image as base
FROM nginx:alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY . .

# Create necessary directories
RUN mkdir -p /usr/share/nginx/html && \
    mkdir -p /usr/share/nginx/html/poolconfig

# Copy web files to nginx directory
COPY . /usr/share/nginx/html/

# Copy default nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create a default config.js if it doesn't exist
RUN if [ ! -f /usr/share/nginx/html/config.js ]; then \
    echo "// Default configuration\nvar WebURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/'\nvar API = 'http://miningcore:4000/api/'\nvar stratumAddress = window.location.hostname" > /usr/share/nginx/html/config.js; \
    fi

# Create a default pools.json if it doesn't exist
RUN if [ ! -f /usr/share/nginx/html/poolconfig/pools.json ]; then \
    mkdir -p /usr/share/nginx/html/poolconfig && \
    echo '{"pools":[{"id":"example","coin":{"type":"EXAMPLE","name":"Example Coin","symbol":"EXM","algorithm":"example"}}]}' > /usr/share/nginx/html/poolconfig/pools.json; \
    fi

# Set permissions
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
