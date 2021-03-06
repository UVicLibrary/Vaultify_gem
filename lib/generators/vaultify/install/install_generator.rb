class Vaultify::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def inject_routes
    insert_into_file "config/routes.rb", after: ".draw do" do
      %(\n mount Vaultify::Engine => '/vaultify'\n)
    end
  end

  def inject_vaultify_yml
    copy_file "config/vaultify.yml", "config/vaultify.yml"
  end
end