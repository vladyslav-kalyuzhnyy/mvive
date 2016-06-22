RailsAdmin.config do |config|

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.is_admin?
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

  end
end
