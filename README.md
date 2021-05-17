![github workflow](https://github.com/thiagoesteves/calori_app/workflows/Elixir%20Staging/badge.svg)
![github workflow](https://github.com/thiagoesteves/calori_app/workflows/Elixir%20Develop/badge.svg)
![ubuntu-20.04](https://actionvirtualenvironmentsstatus.azurewebsites.net/api/status?imageName=ubuntu20&badge=1)

# Welcome to the source code webpage of Calori Software Ltda

Welcome! you are now invited to have a look and check the source code for Calori Software Webpage. Here we are sharing our development environment as well as the deployment environment. The webpage is using CloudFormation + Ec2 + S3 + Github Actions + Elixir + Phoenix + Ecto and hot upgrades with distillery. All is configured to serve automatically the EC2 instance that is running in AWS. You can achieve the same environment with just a few clicks and you are ready to push a change in github and see these changes being applied automatically on your website.

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