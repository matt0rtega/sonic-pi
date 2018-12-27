##| in_thread do
##|   live_loop :foo do
##|     play 62
##|     sleep 0.5
##|   end
##| end

##| in_thread do
##|   live_loop :foo2 do
##|     with_synth :prophet do
##|       if one_in(2)
##|         play chord(:E3, :minor)
##|         ##| play rrand(60, 72), decay: rrand(0.01, 0.2), sustain: 0, release: 0
##|       else
##|         play_pattern_timed scale(:e3, :minor), 0.125, release: 0.01, attack: 0.5
##|       end
##|     end
##|     if one_in( )
##|       sample :bd_haus, rate: rrand(1, 12), decay: 0.1, release: 0, sustain: 0
##|     else
##|       sample :sn_dolf
##|     end
##|     sleep 0.25
##|   end
##| end

in_thread do
  live_loop :foo do
    with_fx :reverb, room: 1.0 do
      sample :ambi_choir, pitch: [2, 4, 6, 6, 1, -1].choose
      sleep 1
    end
  end
end

in_thread do
  use_synth :tb303
  live_loop :foo2 do
    with_fx :pitch_shift, pitch: [1, 2, 4, 12, 0].choose do
      with_fx :flanger, depth: 1.0, feedback: 1.0 do
        
        with_fx :reverb, room: 0.9, mix: 0.1 do
          
          n = (ring :e1, :e2, :e3, :e4, :g4, :c4, :c3).choose
          play n, release: 0.125, cutoff: rrand(50, 90), res: rrand(0.2, 1.0), attack:
            [0.1, 0.5, 2.0].choose , wave: [0, 1, 2].choose
        end
      end
    end
    sleep 1
  end
  
  use_synth :tb303
  with_fx :reverb, room: 1.0 do
    live_loop :space_scanner do
      play :e1, cutoff: 40, release: 1, attack: 1, cutoff_attack: 4, cutoff_release: 4
      sleep 8
    end
    
    live_loop :space_scanner2 do
      play [:e4, :c4].choose, cutoff: 40, release: 2, attack: 1, cutoff_attack: 4, cutoff_release: 1
      sleep 8
    end
  end
end
