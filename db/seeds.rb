# Seed data.

leagues = League.create([
  {:name => 'Dark Matter Sundays', :comments => 'Dark Matter Games, Colorado'},
  {:name => 'OCTGN',               :comments => 'Online meetup group'}
])

users = User.create([
  {:userid => 'madjack', :email => 'foo@bar.com', :league_id => 1, :first_name => 'Joe', :last_name => 'Smith'},
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
