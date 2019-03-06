namespace :load do
  task :defaults do
    set :permissions_folders, []
    set :chmod_folder_permissions, "775"
    set :chmod_file_permissions, "664"
    set :chown_owner, ""
    set :chown_group, "web"
  end
end

namespace :deploy do
  namespace :simple_permissions do

    task :set_permissions do
      on roles(:web) do
        execute :find, *fetch(:permissions_folders), '-type', :d, '-exec', :chmod, fetch(:chmod_folder_permissions), '{}', '\\;'
        execute :find, *fetch(:permissions_folders), '-type', :f, '-exec', :chmod, fetch(:chmod_file_permissions), '{}', '\\;'
        execute :chown, '-R', "#{fetch(:chown_owner)}:#{fetch(:chown_group)}", *fetch(:permissions_folders)
      end
    end
  end
end

after "deploy:log_revision", "deploy:simple_permissions:set_permissions"
