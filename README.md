![Logo of the project](./Logo.png)

## Docking Project Ruby v2.7.1, Ruby On Rails 6.0.3.6 and Nginx

Docking an example of a Ruby On Rails project


## Technology 

Here are the technologies used in this project.

* Docker version 20.10.5, build 55c4c88 (https://www.docker.com/)
* PostgreSQL version 9.6.7 Alpine (Docker Image: https://hub.docker.com/_/postgres/)
* Ruby version 2.7.1 (https://www.ruby-lang.org/pt/)
* Ruby On Rails version 6.0.3.6 (https://rubyonrails.org/)
* Nginx version 1.18 (https://nginx.org/en/)
* NodeJS version 12 (https://nodejs.org/en/)
* Puma version 3.12.6 (https://puma.io/)

## Services Used

* Dockerhub (https://hub.docker.com/)


## Getting started

* To start, you need to have docker installed (Docker Engine overview: https://docs.docker.com/engine/)

## How to use

* Dockerize the PostgreSQL (for dockerize the PostgreSQL look https://github.com/Fernando-Altir-Bastian/postgresql_with_docker)

* Change the name folder "name_project_rails_app" to your name Rails Project

* In the folder "nginx/Dockerfile" change the line 3, the word "NAME_RAILS_PROJECT" to your name Rails Project:
    ```
    ENV RAILS_ROOT /var/www/NAME_RAILS_PROJECT
    ```

* In the file "docker-compose.yml" change the line 17, the word "NAME_RAILS_PROJECT" to your name Rails Project:
    ```
    - ./NAME_RAILS_PROJECT:/NAME_RAILS_PROJECT
    ```

* Yet in the file "docker-compose.yml" change the line 21, 22 e 23, data for connection to postgres:
    ```
    - POSTGRES_USER=enter_the_user_postgres
    - POSTGRES_PASSWORD=enter_the_password_postgres
    - POSTGRES_HOST="enter_the_ip_connection_postgres"
    ```

* Yet in the file "docker-compose.yml" change the line 28, the word "name_network_connection_bd" to the bd connection name that created in dockerize PostgreSQL
    ```
    name: name_network_connection_bd
    ```

* In the file "Dockerfile" change the line 14, the word "NAME_RAILS_PROJECT" to your name Rails Project:
    ```
    ENV PATH_PROJECT /NAME_RAILS_PROJECT
    ```

* Access the project name folder and run the command to create the Ruby On Rails project:
>   $ docker compose run app rails new . -d postgresql -T

* Add this Gems to Gemfile
    gem 'net-http', require: false
    gem 'net-imap', require: false
    gem 'net-protocol', require: false
    gem 'net-smtp', require: false  

* Build de project:
>    $ docker compose build

* In the file "database.yml" add to the method "default: &default", data for connection to postgres:
    ```
    username: <%= ENV.fetch('POSTGRES_USER') %>
    password: <%= ENV.fetch('POSTGRES_PASSWORD') %>
    host: <%= ENV.fetch('POSTGRES_HOST') %>
    ```
    
* In the file /NAME_RAILS_PROJECT/.gitignore overwrite the lines 11-14 to:
    ```
    /log/*
    /tmp/*
    /tmp/pids/*              # this line
    !/log/.keep
    !/tmp/.keep
    !/tmp/pids               # this line
    !/tmp/pids/.keep         # and this line
    ```

* Add manualy the folder "pids/" in folder "tmp/" to version control using a .keep file.
    ```
        ...
        tmp
           |_> pids
                 |_> .keep
        ...
    ```

* Create de BD of project
>   $ docker compose run --rm app rails db:create

* To run the project:
>    $ docker compose up

## Versioning of this project 

    release_v_beta_0_0_1


## Authors

* **Fernando Altir Bastian**: https://github.com/Fernando-Altir-Bastian


