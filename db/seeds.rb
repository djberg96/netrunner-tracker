# Seed data.

runners = Runner.create([
  {:faction => 'Criminal',  :identity => 'Cyborg',  :name => 'Gabriel Santiago'},
  {:faction => 'Shaper',    :identity => 'Natural', :name => "Kate 'Mac' McCaffrey"},
  {:faction => 'Anarchist', :identity => 'G-mod',   :name => 'Noise'}
])

corporations = Corporation.create([
  {:faction => 'Haas-Bioroid',       :identity => 'Megacorp'},
  {:faction => 'Weyland Consortium', :identity => 'Megacorp'},
  {:faction => 'Jinteki',            :identity => 'Megacorp'},
  {:faction => 'NBN',                :identity => 'Megacorp'},
])
