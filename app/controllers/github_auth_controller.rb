class GithubAuthController < ApplicationController

  def callback
    uri = URI.parse("https://github.com/login/oauth/access_token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    @user = User.create

    parameters = { client_id: ENV["GITHUB_CLIENT_ID"],
                   client_secret: ENV["GITHUB_CLIENT_SECRET"],
                   code: params[:code],
                   redirect_uri: authorized_github_auth_index_url
                 }

    response = http.post(uri.path, parameters.to_json, {'Accept' => 'application/json',
                                                        'Content-Type' => 'application/json'})
    User.create( { access_token: JSON.parse(response.body)["access_token"] } )

    redirect_to authorized_github_auth_index_url
  end

  def authorized
   
  end

end
