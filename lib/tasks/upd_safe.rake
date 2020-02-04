namespace :upd do 

  task safes: :environment do 
    Safe.where('name like ?', 'Упр.%').each do |s|
      puts s.to_json
      s.update_attribute(:safe_type_id, 2)
    end

    Safe.where('name like ?', 'Сейф%').each do |s|
      puts s.to_json
      s.update_attribute(:safe_type_id, 1)
    end
  end
  
end