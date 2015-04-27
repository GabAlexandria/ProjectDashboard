class GithubAuthController < ApplicationController

  def callback
    parameters = { client_id:     ENV["GITHUB_CLIENT_ID"],
                   client_secret: ENV["GITHUB_CLIENT_SECRET"],
                   code:          params[:code],
                   redirect_uri:  authorized_github_auth_index_url
                 }

    headers = {'Accept' => 'application/json','Content-Type' => 'application/json'}
    response = post("https://github.com/login/oauth/access_token", parameters, headers)
    current_user.update_attribute(:access_token, JSON.parse(response.body)["access_token"])

    redirect_to user_projects_url
  end

  def authorized
   
  end 

  private

  def post(url, parameters, headers)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    http.post(uri.path, parameters.to_json, headers)
  end
end
