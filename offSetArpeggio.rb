##| play_pattern chord(:E3, :m7), 0.1


in_thread do
  live_loop :foo do
    with_fx :reverb, mix: 0.5, room: 1 do
      with_synth :prophet do
        play_pattern_timed chord(:D2, :m11), 1.75, release: 4, attack: 0
      end
    end
  end
end

in_thread do
  
  live_loop :foo2 do
    with_fx :reverb, mix: 0.5, room: 1 do
      with_synth :supersaw do
        play_pattern_timed chord(:D5, :major7), [choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1])], release: rrand(0.25, 2), attack: 0, cutoff: rrand(72, 100)
      end
    end
  end
end

in_thread do
  live_loop :foo3 do
    with_fx :reverb, mix: 0.5, room: 1 do
      with_synth :dsaw do
        play choose(chord(choose([:e3, :d3]), :m11)), release: 4, cutoff: rrand(60, 120)
        ##| play_pattern_timed scale(:c3, :major, num_octaves: 3), 0.125, release: 0.1
        play_pattern_timed chord(:G4, :m11), [choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1])], release: 2, attack: 0, cutoff: rrand(72, 100)
      end
    end
  end
end



##| //sleep 0.25 Welcome to Sonic Pi v3.1

