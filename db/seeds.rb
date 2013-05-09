# Seed data.

leagues = League.create([
  {:name => 'None',                :comments => 'Not part of a league'},
  {:name => 'Dark Matter Sundays', :comments => 'Dark Matter Games, Colorado'},
  {:name => 'OCTGN',               :comments => 'Online meetup group'},
  {:name => 'Test',                :comments => 'Test group'}
])

users = User.create([
  {
    :userid => 'djberg96', :email => 'djberg96@gmail.com', :league_id => 1,
    :first_name => 'Daniel', :last_name => 'Berger', :password => 'asdfasdf', :admin => true
  },
  {
    :userid => 'test', :email => 'test@bar.com', :league_id => 3,
    :first_name => 'Test', :last_name => 'Jones', :password => 'asdfasdf'
  },
])

runners = Runner.create([
  {:faction => 'Criminal',  :identity => 'Cyborg',  :name => 'Gabriel Santiago'},
  {:faction => 'Shaper',    :identity => 'Natural', :name => "Kate 'Mac' McCaffrey"},
  {:faction => 'Anarchist', :identity => 'G-mod',   :name => 'Noise'}
])

corporations = Corporation.create([
  {:faction => 'Haas-Bioroid',       :slogan => 'Engineering the Future',  :identity => 'Megacorp'},
  {:faction => 'Weyland Consortium', :slogan => 'Building a Better World', :identity => 'Megacorp'},
  {:faction => 'Jinteki',            :slogan => 'Replicating Perfection',  :identity => 'Megacorp'},
  {:faction => 'NBN',                :slogan => 'Making News',             :identity => 'Megacorp'},
])
