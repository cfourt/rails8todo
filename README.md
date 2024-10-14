# README

A task app to play with the latest Rails 

- Ruby version: 3.3.4
- Rails 8-beta1
- Sqlite3

* Database creation
potentially might need to run: `touch storage/development_queue.sqlite3` (and others like cache and cable )
then `bin/setup`

* How to run the test suite
I'd like to set up TLDR to get this running every save with a focus on performance

* Services (job queues, cache servers, search engines, etc.)
Solid trio to start
* Deployment instructions
TODO
* ...

# TODOs
- [ ] Add completed, past_due scope/view
- [ ] add hotwire task builder for index view (compare turbo-frame vs stimulus experience)
- [ ] adjust routing for create/edit flow
- [ ] docker-ize
- [ ] hosting
- [ ] stress test sqlite3
- [ ] Devise prod setup†
- [ ] Devise styling
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
