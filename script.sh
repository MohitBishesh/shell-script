#!/bin/bash
# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    sudo apt update
    sudo apt install -y docker-compose
fi

# Function to create WordPress site
create_site() {
    local site_name="$1"
    
    # Create directory for the site
    mkdir "$site_name"
    cd "$site_name"
    
    # Create docker-compose.yml file
    cat <<EOT > docker-compose.yml
version: '3'
services:
  wordpress:
    depends_on:
      - db
    image: 'wordpress:latest'
    ports:
      - '80:80'
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: example
    volumes:
      - './wordpress:/var/www/html'
    networks:
      - wordpress-network
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
    networks:
      - wordpress-network
networks:
  wordpress-network:
    driver: bridge
EOT
    # Create a directory for WordPress files
    mkdir wordpress 
    # Create /etc/hosts entry
    echo "54.89.146.165 $site_name" | sudo tee -a /etc/hosts

    # Start containers
    sudo docker-compose up -d

    echo "Site $site_name created and running at http://$site_name"
}

# Function to enable/disable the site
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

# Function to delete the site
delete_site() {
    local site_name="$1"
    
    cd "$site_name"
    sudo docker-compose down
    cd ..
    sudo rm -rf "$site_name"
    
    # Remove /etc/hosts entry
    sudo sed -i "/$site_name/d" /etc/hosts
    
    echo "Site $site_name deleted"
}

# Main script

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
