A demonstration integration with [Ministry of Justice Sign On](https://github.com/ministryofjustice/moj-sso). See that repository for integration instructions.

This demo

* uses the `omniauth-oauth2` gem to handle the OAuth flows
* stores the user's id, info and SSO token details in the session
* implements the optional logout redirection back to this app
* forces re-authentication when the SSO token expires

## Usage instructions

This repo is already configured for usage with <https://www.signon.dsd.io/>. To run the demo against this OAuth provider:

* Get a login on <https://www.signon.dsd.io/> and add yourself to the Demo team within the `digital.moj` organisation. This grants your user access to the 'Demo' app.
* Run the app with `rails server`

If you'd rather run Sign On locally:

* Run moj-sso on another port (e.g. `rails server -p 5000`)
* Create an app via the Sign On super admin interface
* Configure this app within `config/initializers/omniauth.rb`
