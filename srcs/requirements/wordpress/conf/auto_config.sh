#!/bin/sh

if [ -f "/var/www/wordpress/.already_init" ]; then
	echo "-> Wordpress is already installed"
else
	sleep 10

	echo "-> Starting wordpress installation."

	wp core install --path=/var/www/wordpress \
        		--url=https://vrigaudy.42.fr \
        		--title="Inception" \
        		--admin_user=${WP_ADMIN} \
        		--admin_password=${WP_ADMIN_PWD} \
        		--admin_email=${WP_ADMIN_EMAIL} \
			--skip-email \
			--allow-root

	echo "-> Add user to wordpress"

	wp user create ${USER_ENTITY} ${USER_EMAIL} \
			--path=/var/www/wordpress \
			--role=author \
			--user_pass=${USER_PWD} \
			--display_name=${USER_DISPLAY_NAME} \
			--first_name=${USER_FIRST_NAME} \
			--last_name=${USER_LAST_NAME} \
			--allow-root

	touch /var/www/wordpress/.already_init
fi

exec /usr/sbin/php-fpm7.3 -F
