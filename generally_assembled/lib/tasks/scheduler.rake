desc "This task updates repo data from Github"
task git_repos: :environment do

  user = 'sf-wdi-35'
  github = Github.new oauth_token: User.first.token                     ## sets github client
  renderer = Redcarpet::Render::HTML.new      ## sets HTML renderer for RedCarpet
  markdown = Redcarpet::Markdown.new renderer ## RedCarpet renderer
  repos = github.repos.list user:user ## gets list of repos

  repos.each do |repo|
    readme = github.repos.contents.readme user, repo.name
    # readme = readme.content.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_') #, :invalid => :replace, :undef => :replace, :replace => '_')
    p readme.content.encoding
    # readme.content = readme.content.force_encoding("UTF-8")
    rendered_readme_md = Base64.decode64 readme.content
    rendered_readme_HTML = markdown.render rendered_readme_md
    rendered_readme_HTML = rendered_readme_HTML.force_encoding("UTF-8")
    ## Create new Repo from response
    Repo.find_or_create_by!(
                github_id:repo.id,
                name:repo.name,
                content:rendered_readme_HTML
                )
  end
  # Repo.reindex
end
