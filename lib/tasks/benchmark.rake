namespace :benchmark do

  desc "simulate static content website"
  task :static, [:endpoint] => :environment do |task, args|
    endpoint = args.endpoint
    require 'httparty'

    start = Time.now
    10.times do |i|
      HTTParty.get("http://localhost:3000/answers/#{endpoint}")
    end
    milestone1 = Time.now

    10.times do |i|
      HTTParty.get("http://localhost:3000/questions/#{endpoint}")
    end
    milestone2 = Time.now

    10.times do |i|
      HTTParty.get("http://localhost:3000/users/#{endpoint}")
    end
    milestone3 = Time.now


    p "total: #{milestone3-start} answers: #{milestone1-start} questions: #{milestone2-milestone1} users: #{milestone3-milestone2}"
  end

  desc "simulate dynamic content website"
  task :dynamic, [:endpoint, :r, :c] => :environment do |task, args|
    endpoint = args.endpoint
    r = args.r.to_i
    c = args.c.to_i
    require 'httparty'

    start = Time.now
    10.times do |i|
      HTTParty.get("http://localhost:3000/answers/#{endpoint}")
      Answer.limit(30).shuffle[0...c].map(&:touch) if (i+1) % r == 0
    end
    milestone1 = Time.now

    10.times do |i|
      HTTParty.get("http://localhost:3000/questions/#{endpoint}")
      Question.limit(30).shuffle[0...c].map(&:touch) if (i+1) % r == 0
    end
    milestone2 = Time.now

    10.times do |i|
      HTTParty.get("http://localhost:3000/users/#{endpoint}")
      User.limit(30).shuffle[0...c].map(&:touch) if (i+1) % r == 0
    end
    milestone3 = Time.now


    p "Request: #{r}, Change: #{c}"
    p "total: #{milestone3-start} answers: #{milestone1-start} questions: #{milestone2-milestone1} users: #{milestone3-milestone2}"
  end

  namespace :ams do
    desc "simulate static content website"
    task static: :environment do
      Rake::Task["benchmark:static"].invoke("ams")
    end

    desc "simulate dynamic content website"
    task :dynamic, [:r, :c] => :environment do |task, args|
      r = args.r.to_i
      c = args.c.to_i
      Rake::Task["benchmark:dynamic"].invoke('ams', r, c)
    end
  end

  namespace :jbuilder do
    desc "simulate static content website"
    task static: :environment do
      Rake::Task["benchmark:static"].invoke("jbuilder")
    end

    desc "simulate dynamic content website"
    task :dynamic, [:r, :c] => :environment do |task, args|
      r = args.r.to_i
      c = args.c.to_i
      Rake::Task["benchmark:dynamic"].invoke('ams', r, c)
    end
  end
end
