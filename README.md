## Description 

I chose Laravel PHP and Node JS for this task. As a user prompt, I used CLI. I love console APPs.Also, the beauty of this solution. Laravel uses Seeds and migrations to create DB and Node JS reuses the data. The same data Laravel generated. Even the DB connection is from the same .env file. 

 
## To install :
```
git clone https://github.com/Genaker/ATAcomposer 
composer install
install npm install
```
## add .env DB connections 
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=movie_theater
DB_USERNAME=root
DB_PASSWORD=
```

## Run all migrations and seed 
```
php artisan migratephp 
artisan db:seed
```

Now we are ready to run user input via the console:<\br>
## PHP: 
```
php artisan app:top-theater
```
## NodeJS:
```
node js_src/js-cli.js
```