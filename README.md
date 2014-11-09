# ¿Cómo Vamos?

[![Build Status](https://travis-ci.org/nhocki/como_vamos.svg?branch=master)](https://travis-ci.org/nhocki/como_vamos)

¿Cómo Vamos? is an application to share solutions for competitive programming problems.

It was born out of necessity to keep track of solved problems among team members and to
share solutions with other teams.

## Deploying

All important secret keys are read from the environment. If you're deploying this
application, make sure you have the following env variables:

* `GITHUB_KEY`: GitHub's application key.
* `GITHUB_SECRET`: GitHub's application secret.
* `SECRET_KEY_BASE`: A very long, random script for cookies. Generate one with `rake secret`.
* `DATABASE_URL`: The URL of the production database. E.g `postgres://myuser:mypass@localhost/somedatabase`

All these keys are referenced in the `config/secrets.yml` file.

---

[This is a rewrite. The original can be found here.](https://github.com/andmej/como_vamos)
