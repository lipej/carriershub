# CarriersHub

#### COVERAGE

[![Coverage Status](https://coveralls.io/repos/github/lipejose/carriershub-elixir/badge.svg?branch=main)](https://coveralls.io/github/lipejose/carriershub-elixir?branch=main)

### About

---

Carriershub is a project written in elixir with the main objective learn about elixir, the application is based on a plugin management architecture, to make easy the implementation of any new carriers. It's incredibly simple because code never needs to know anything about the shipping company, everything you need to do is create a new file in plugins dir with all functions you need from the shipping company and set up the integrations keys in the client account.

### How to use

---

First, you need elixir in your machine, if you don't know how to install, you can learn [here](https://elixir-lang.org/install.html). You also need a Postgres database running.

With elixir installed, follow these steps:

1. Open the file config/configs.ex and set up your database env.
2. In the project folder run `mix deps.get`.
3. Now you can run `mix ecto.setup` to setup the database.
4. If you want to run the tests just run `mix test` or run the app with `iex -S mix phx.server`.

Now you have the project running in port 4000, you can edit this in config files if need. To use the first thing you need to do is create a client, after this, you can create integrations with carriers for the client and perform actions.

### API Documentation

---

You can grab all route documentation in this [link](https://www.getpostman.com/collections/f3c26f25951867fb3309) or inside the project in the collections folder, just import it in postman. Everything you need to CRUD a client, integrations or perform actions is there.
