namespace :safe_owners do 

  task make: :environment do
    # puts "change task #{SafeLink.all.length}"
    User.where('NOT safe_id is null').each do |u|
      puts "sl #{u.safe_id} - #{u.username}"
      u.safe.update(owner_id: u.id)
      
    end
  end
end