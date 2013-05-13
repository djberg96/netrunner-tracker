# Seed data.

cards = Card.create([
  # H-B Core
  {:title => 'Accelerated Beta Test',     :kind => 'Agenda',      :faction => 'Haas-Bioroid'},
  {:title => 'Adonis Campaign',           :kind => 'Asset',       :faction => 'Haas-Bioroid'},
  {:title => 'Aggressive Secretary',      :kind => 'Asset',       :faction => 'Haas-Bioroid'},
  {:title => 'Heimdall 1.0',              :kind => 'Ice',         :faction => 'Haas-Bioroid'},
  {:title => 'Ichi 1.0',                  :kind => 'Ice',         :faction => 'Haas-Bioroid'},
  {:title => 'Rototurret',                :kind => 'Ice',         :faction => 'Haas-Bioroid'},
  {:title => 'Viktor 1.0',                :kind => 'Ice',         :faction => 'Haas-Bioroid'},
  {:title => 'Haas-Bioroid',              :kind => 'Identity',    :faction => 'Haas-Bioroid'},
  {:title => 'Archived Memories',         :kind => 'Operations',  :faction => 'Haas-Bioroid'},
  {:title => 'Biotic Labor',              :kind => 'Operations',  :faction => 'Haas-Bioroid'},
  {:title => 'Shipment from MirrorMorph', :kind => 'Operations',  :faction => 'Haas-Bioroid'},
  {:title => 'Corporate Troubleshooter',  :kind => 'Operations',  :faction => 'Haas-Bioroid'},
  {:title => 'Experiential Data',         :kind => 'Operations',  :faction => 'Haas-Bioroid'},
  # Anarch Core
  {:title => 'Deja Vu',                   :kind => 'Event',       :faction => 'Anarch'},
  {:title => 'Demolition Run',            :kind => 'Event',       :faction => 'Anarch'},
  {:title => 'Stimhack',                  :kind => 'Event',       :faction => 'Anarch'},
  {:title => 'Grimoire',                  :kind => 'Hardware',    :faction => 'Anarch'},
  {:title => 'Cyberfeeder',               :kind => 'Hardware',    :faction => 'Anarch'},
  {:title => 'Noise',                     :kind => 'Identity',    :faction => 'Anarch'},
  {:title => 'Corroder',                  :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Datasucker',                :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Djinn',                     :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Medium',                    :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Mimic',                     :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Parasite',                  :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Wyrm',                      :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Yog.0',                     :kind => 'Program',     :faction => 'Anarch'},
  {:title => 'Ice Carver',                :kind => 'Resource',    :faction => 'Anarch'},
  {:title => 'WyldSide',                  :kind => 'Resource',    :faction => 'Anarch'},
])

leagues = League.create([
  {:name => 'Dark Matter Sundays', :comments => 'Dark Matter Games, Colorado'},
  {:name => 'OCTGN',               :comments => 'Online meetup group'},
  {:name => 'Test',                :comments => 'Test group'}
])

users = User.create([
  {
    :userid => 'djberg96', :email => 'djberg96@gmail.com',
    :first_name => 'Daniel', :last_name => 'Berger', :password => 'asdfasdf', :admin => true
  },
  {
    :userid => 'test', :email => 'test@bar.com',
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
