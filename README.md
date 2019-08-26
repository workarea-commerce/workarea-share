Workarea Share
================================================================================

A Workarea Commerce plugin that provides functionality for sharing a product via social media or email.

Overview
--------------------------------------------------------------------------------

* Simple configuration and view customization
* Injected Style Guide to help aide development
* Uses reCAPTCHA to protect from misuse

Getting Started
--------------------------------------------------------------------------------

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-share'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

Features
--------------------------------------------------------------------------------

### Easy customizability

Change the maximum length of the message of the sent email via Admin configuration page. Customize the sharable offerings by editing `views/workarea/storefront/shares/_share_buttons.html.haml`

### reCAPTCHA

Workarea Share utilizes [reCAPTCHA](https://github.com/ambethia/recaptcha) in the share by email form to prevent abuse. You'll need to configure each environment (except test) in order for email sharing to work properly. The plugin will look to your secrets file for the required values.

```ruby
production:
  recaptcha:
    site_key: YOUR_SITE_KEY
    secret_key: YOUR_SECRET_KEY
    proxy: http://your.proxy.address:8080 # proxy not set if this key is missing
```
[Obtain your keys from the reCAPTCHA site](https://www.google.com/recaptcha/admin)

Workarea Commerce Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

License
--------------------------------------------------------------------------------

Workarea Share is released under the [Business Software License](LICENSE)
