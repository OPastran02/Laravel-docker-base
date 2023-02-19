# Establecer la imagen base de Docker
FROM php:7.4-apache

# Copiar los archivos de la aplicación a la imagen de Docker
COPY . /var/www/html/

# Instalar las dependencias de la aplicación
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip && \
    docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar Apache
RUN a2enmod rewrite

# Exponer el puerto 80 de Apache
EXPOSE 80

# Ejecutar el servidor web de Apache al iniciar el contenedor de Docker
CMD ["apache2-foreground"]