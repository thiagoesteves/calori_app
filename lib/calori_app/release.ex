defmodule CaloriApp.Release do
  @moduledoc """
  Copied from https://elixirforum.com/t/how-to-create-database-on-release/28443
  I know it is not a good practice to create a database automatically, but my goal
  here is to deploy since the first installation, so I was happy to use this code
  Copied from https://elixirforum.com/t/how-to-create-database-on-release/28443
  """

  @start_apps [:postgrex, :ecto, :ecto_sql]

  @myapps [:calori_app]

  def create_and_migrate() do
    createdb()
    migrate()
  end

  def createdb do
    # Start postgrex and ecto
    IO.puts("Starting dependencies...")

    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    Enum.each(@myapps, &create_db_for/1)
    IO.puts("createdb task done!")
  end

  def create_db_for(app) do
    for repo <- get_repos(app) do
      :ok = ensure_repo_created(repo)
    end
  end

  defp ensure_repo_created(repo) do
    IO.puts("create #{inspect(repo)} database if it doesn't exist")

    case repo.__adapter__.storage_up(repo.config) do
      :ok -> :ok
      {:error, :already_up} -> :ok
      {:error, term} -> {:error, term}
    end
  end

  def migrate() do
    IO.puts("Start running migrations..")
    Enum.each(@myapps, &run_migrations_for/1)
    IO.puts("migrate task done!")
  end

  def run_migrations_for(app) do
    IO.puts("Running migrations for '#{app}'")

    for repo <- get_repos(app) do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end

    IO.puts("Finished running migrations for '#{app}'")
  end

  defp get_repos(app) do
    Application.load(app)
    Application.fetch_env!(app, :ecto_repos)
  end

  def rollback(repo, version) do
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end
end
