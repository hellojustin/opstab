namespace :searchify do

  namespace :index do

    desc 'Delete all documents in the environment\'s index, and recreate them from the database'
    task :rebuild => :environment do
      start_time = Time.now

      puts "Deleting the current searchify index."
      Searchify.index.delete
      puts "Creating a new searchify index."
      Searchify.index.add
      print "Waiting for index to start..."

      until Searchify.index.running?
        print '.'
        sleep 0.5
      end
      puts
      puts

      puts "Indexing user records..."
      users        = User.all
      user_count   = users.size
      current_user = 1
      users.each do |user|
        puts "  -- #{user.id} #{user.email} #{user.name} - #{current_user} of #{user_count}"
        user.update_searchify_index
        current_user += 1
      end
      puts

      puts "Indexing event records..."
      events = Event.all
      event_count   = events.size
      current_event = 1
      events.each do |event|
        puts "  -- #{event.id} #{event.kind} #{event.created_at} - #{current_event} of #{event_count}"
        event.update_searchify_index
        current_event += 1
      end
      puts

      end_time = Time.now

      puts "Done! (in #{end_time - start_time} seconds)"

    end

  end

end
