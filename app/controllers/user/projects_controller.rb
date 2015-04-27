class User::ProjectsController < User::BaseController 

  def index
  end

  def repositories
    client = Octokit::Client.new(access_token: current_user.access_token)
    user = client.user
    @repos = user.rels[:repos].get.data
    #repo = Octokit.repo("GabAlexandria/ygexoticherbs")
    render :index
  end


end
