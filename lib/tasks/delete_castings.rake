desc 'delete'
task delete_castings: :environment do
  Casting.where("created_at <= ?", Time.now - 2.minutes).each do |casting|
    casting.destroy
  end
end