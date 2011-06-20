# Opentrak: Simple pixel-based tracking for Rails

This is a simple system for tracking open rates of emails using a tracking pixel. 

## Compatibility

This release has been tested in Rails 3.0.7 on Heroku. It should work on non-Heroku hosts with minimal modification. Heroku has a unique way of accessing user IPs so you'll likely need to just make a slight in trackers#track to properly retrieve the user IP.

## Usage

Trackers are created on the fly when referenced for the first time. For example, http://opentrak/track/new_tracker.gif will create a new tracker called new_tracker. After it's created, you can edit the tracker by going to http://opentrak/ and selecting edit.

## Authentication

Opentrak uses Devise for authentication. In order to approve access for a user, you'll need to use the Rails console to update the user's admin attribute to true.

## Contact & Help

If you have questions, feel free to email scott AT causes.com. If you find a bug you can [open an issue](https://github.com/causes/opentrak/issues).