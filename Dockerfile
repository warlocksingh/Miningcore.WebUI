# Use official nginx image as base
FROM nginx:alpine

# Copy web files to nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
