# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# TODOs
- [ ] Add completed scope/view
- [ ] Add past_due scope/view
- [ ] add sort scope/view
- [ ] add hotwire task builder for index view
- [ ] adjust routing for create/edit flow
- [ ] docker-ize
- [ ] add accounts and auth
- [ ] hosting
- [ ] stress test sqlite3
- [ ] Devise prod setup†
- [ ] Devise styling
- [ ] Look into PicoCSS
- [ ] click to expand task details








†  
```
Ensure you have defined default url options in your environments files. Here
is an example of default_url_options appropriate for a development environment
in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *
```
