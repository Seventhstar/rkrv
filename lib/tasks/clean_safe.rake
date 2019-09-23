namespace :clean do 

  task safes: :environment do 
    Expense.delete_all
    Safe.delete_all
  end
  
end