#!/bin/bash
# To  Check whether Docker is installed on our system or not?
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
fi

# To Check whether Docker Compose is installed or not?
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    sudo apt update
    sudo apt install -y docker-compose
fi

# Function to create Nginx configuration
create_nginx_config() {
    local nginx_config_dir="nginx-config"
    local nginx_config_file="$nginx_config_dir/nginx.conf"

    mkdir -p "$nginx_config_dir"

    cat <<EOT > "$nginx_config_file"
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://wordpress:80;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOT
}

# Here is our  function to create a WordPress site
create_site() {
    local site_name="$1"
    
    # Create directory for the site
    mkdir "$site_name"
    cd "$site_name"

    # Here is our docker-compose.yml file
    cat <<EOT > docker-compose.yml
version: '3'
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress_password
    volumes:
      - './wordpress:/var/www/html'
    depends_on:
      - db
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress_password
  nginx:
    image: nginx:latest
    volumes:
      - './nginx-config:/etc/nginx/conf.d'
    ports:
      - "8080:80"
    depends_on:
      - wordpress
EOT
    # Creating a directory to store our  WordPress files
    mkdir wordpress 

    # Create Nginx configuration
    create_nginx_config
    
    # Create /etc/hosts entry
    echo "127.0.0.1 $site_name" | sudo tee -a /etc/hosts

    # Start containers in deamon mode (i.e detached mode)
    sudo docker-compose up -d

    echo "Site $site_name created and running at http://$site_name"
}

# Our function to enable/disable the site
manage_site() {
    local site_name="$1"
    local action="$2"
    
    cd "$site_name"
    
    if [ "$action" == "enable" ]; then
        sudo docker-compose start
        echo "Site $site_name enabled"
    elif [ "$action" == "disable" ]; then
        sudo docker-compose stop
        echo "Site $site_name disabled"
    else
        echo "Invalid action. Use 'enable' or 'disable'"
    fi
}

# Here is the function to delete the site
delete_site() {
    local site_name="$1"
    
    cd "$site_name"
    sudo docker-compose down
    cd ..
    sudo rm -rf "$site_name"
    
    # To Remove /etc/hosts entry
    sudo sed -i "/$site_name/d" /etc/hosts
    
    echo "Site $site_name deleted"
}

# Our Main function/script which will execute first

if [ $# -lt 2 ]; then
    echo "Usage: $0 create <site_name>"
    echo "       $0 manage <site_name> enable|disable"
    echo "       $0 delete <site_name>"
    exit 1
fi

command="$1"
site_name="$2"

case "$command" in
    "create")
        create_site "$site_name"
        ;;
        
    "manage")
        manage_action="$3"
        manage_site "$site_name" "$manage_action"
        ;;
    "delete")
        delete_site "$site_name"
        ;;
    *)
        echo "Invalid command. Use 'create', 'manage', or 'delete'"
        exit 1
        ;;
esac
