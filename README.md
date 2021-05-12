# CaloriApp

The current local deploy using docker:

  * Create the docker container `docker-compose up`
  * Access the container `docker exec -it CaloriWeb /bin/bash`
  * Start Phoenix endpoint with `mix phx.server`

If the current deploy is enterily new, you should setup the environment before running
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).