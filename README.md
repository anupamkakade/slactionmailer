# Slactionmailer

Slactionmailer is a mailer for ActionMailer that sends your message to a Slack channel.

[![Gem Version](https://badge.fury.io/rb/slactionmailer.svg)](http://badge.fury.io/rb/slactionmailer)
## Installation

Simple include the gem in your gemfile.
```ruby
gem 'slactionmailer'
```
Or install from the command line.
```ruby
gem install slactionmailer
```

## Setup

In your environment or `.env` file, declare the following variables:
```
SLACK_WEBHOOK_URL=your incoming webhook url
SLACK_CHANNEL=#your slack channel
SLACK_USERNAME=SlactionMailer (or whaterver you want to call it)
```

## Usage

Slactionmailer can be used as the default mailer
```ruby
#config/environments/development.rb
config.action_mailer.delivery_method => :slack
```
Or only be used for certain messages 

```ruby
def notification
  mail(:from => 'from@example.com',           
       :to => 'to@example.com', 
       :subject => 'Subject',
       :delivery_method => :slack)
end
```
Either way, your mailer messages will appear like this:
![image](https://cloud.githubusercontent.com/assets/1783498/7716846/c7859bf2-fe5d-11e4-85a0-cc740a573585.png)

If you want to change the default message template, add the following to your config
```ruby
config.slaction_mailer.template = File.read('my_template.text.erb')
```

##About

Slactionmailer uses `slack-notify` to communicate with Slack and takes inspiration from the `letter-opener` gem.


This project rocks and uses MIT-LICENSE.
