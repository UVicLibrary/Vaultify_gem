class Vaultify::InstallGenerator < Rails::Generators::Base

  def inject_routes
    insert_into_file "config/routes.rb", after: ".draw do" do
      %(\n mount Vaultify::Engine => '/vaultify'\n)
    end
  end
end