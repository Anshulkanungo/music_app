namespace :batch do
  desc "TODO"
  task add_role: :environment do
    puts 'updated'
    @user = User.where(role: 'listner')
    @user.update(role: nil)
  end

end
