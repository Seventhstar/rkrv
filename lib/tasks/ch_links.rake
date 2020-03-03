namespace :safe_links do 

  task change: :environment do
    puts "change task #{SafeLink.all.length}"
    SafeLink.all.each do |sl|
      puts "sl #{sl.from_id} - #{sl.to_id}"
      f = sl.from_id
      t = sl.to_id
      sl.update(from_id: t, to_id: f)
    end
  end
end