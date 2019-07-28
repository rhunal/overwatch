================
Overwatch
================
This application requires:

- Ruby 2.4.1
- Rails 5.2.3

================
API Docs
================
Overwatch API has a very simple RESTful API to get information.
As the API is read-only, the only method required is GET.

API is having the following endpoints:

- /api/heros - hero list
- /api/heros/{hero_id} - hero data
- /api/heros/{hero_id}/abilities - hero ability list
- /api/abilities/ - ability list
- /api/abilities/{ability_id} - ability data

================
Run using Docker
================

docker build -t overwatch_app .
docker run -itP overwatch_app


================
Running an instance
================

Installation steps:

1. Clone the repository.

git clone https://github.com/rhunal/overwatch.git

2. configure database with postgres credentials

3. install required gems

bundle install

4. start local server

rails s