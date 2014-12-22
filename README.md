# ¿Cómo Vamos?

[![Build Status](https://travis-ci.org/nhocki/como_vamos.svg?branch=master)](https://travis-ci.org/nhocki/como_vamos)
[![Code Climate](https://codeclimate.com/github/nhocki/como_vamos/badges/gpa.svg)](https://codeclimate.com/github/nhocki/como_vamos)
[![Coverage Status](https://img.shields.io/coveralls/nhocki/como_vamos.svg)](https://coveralls.io/r/nhocki/como_vamos)

¿Cómo Vamos? is an application to share solutions for competitive programming problems.

It was born out of necessity to keep track of solved problems among team members and to
share solutions with other teams.

## Contributing

If you find something's missing or could be better, feel free to open an
[issue](https://github.com/nhocki/como_vamos/issues/new) or create a Pull Request
(I'd really appreciate this).

If you're gonna open a Pull Request, please install [EditorConfig](http://editorconfig.org/),
it will keep most of the code styling consistent and will.

Feel free to contact me for any feedback, I'll happily respond.

## Deploying

All important secret keys are read from the environment. If you're deploying this
application, make sure you have the following env variables:

* `GITHUB_KEY`: GitHub's application key.
* `GITHUB_SECRET`: GitHub's application secret.
* `SECRET_KEY_BASE`: A very long, random script for cookies. Generate one with `rake secret`.
* `AWS_ACCESS`: The AWS access key.
* `AWS_SECRET`: The AWS secret key.
* `AWS_BUCKET`: The AWS bucket to store the solutions.
* `DATABASE_URL`: The URL of the production database. E.g `postgres://myuser:mypass@localhost/somedatabase`
* `MEMCACHED_SERVERS`:  The memcached server list (comma separated list).
* `MEMCACHED_USERNAME`: The memcached username.
* `MEMCACHED_PASSWORD`: The memcached password.
* `GAUGES_ID`: [Gaug.es](http://gaug.es/) tracking id.
* `GOOGLE_ANALYTICS_ID`: [Google Analytics](https://www.google.com/analytics) tracking id.
* `AIRBRAKE_KEY`: [Airbrake](https://www.airbrake.io/) project id.

Most of these keys are referenced in the `config/secrets.yml` file.

### Skylight Integration:

* `SKYLIGHT_AUTHENTICATION`: The Skylight authentication token
* `SKYLIGHT_APPLICATION`: The Skylight application id.

### Using a CDN for assets

If you use a CDN for assets, you'll need two extra environment variables:

* `ASSETS_HOST`: The host for the CDN (E.g http://assets.comovamos.co)
* `FONTS_ORIGIN_HOST`: The Origin host for the fonts to load. [More Info](https://github.com/ericallam/font_assets)

---

[This is a rewrite. The original can be found here.](https://github.com/andmej/como_vamos)
