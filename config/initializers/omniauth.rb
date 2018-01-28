GOOGLE_CLIENT_ID = '218261769806-7jqbe6qnul15cnh9p60adrmokk5jk08c.apps.googleusercontent.com'
GOOGLE_CLIENT_SECRET = '6LEXNAPyBGXXtdLc--LTOrG8'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET
end
