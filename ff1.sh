wait
    
        

RANDOM_CODE=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 20)
mkdir "/var/www/html/${RANDOM_CODE}"
echo "Directory created: ${RANDOM_CODE}"
echo "Folder created successfully!"

 cd /var/www/html/
 wget -O wizwizpanel.zip https://github.com/wizwizdev/wizwizxui-timebot/releases/download/9.1.3/wizwizpanel.zip

 file_to_transfer="/var/www/html/wizwizpanel.zip"
 destination_dir=$(find /var/www/html -type d -name "*${RANDOM_CODE}*" -print -quit)

 if [ -z "$destination_dir" ]; then
   echo "Error: Could not find directory containing 'wiz' in '/var/www/html'"
   exit 1
 fi

 mv "$file_to_transfer" "$destination_dir/" && yes | unzip "$destination_dir/wizwizpanel.zip" -d "$destination_dir/" && rm "$destination_dir/wizwizpanel.zip" && sudo chmod -R 755 "$destination_dir/" && sudo chown -R www-data:www-data "$destination_dir/" 


wait
