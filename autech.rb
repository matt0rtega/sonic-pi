
st = 0

define :my_beat do
  s = rrand(0.1, 0.5)
  st = s
  10.times do
    if one_in(4)
      with_synth :prophet do
        play [48, 36, 42].choose, cutoff: rrand(30, 72), decay: rrand(0.01, 0.2), sustain: 0, attack: rrand(0.01, 0.5), resonance: 50
        else
          sample :bd_gas, rate: rrand(0.1, 2)
          sample :ambi_soft_buzz, rate: rrand(0.1, 2)  if one_in(4)
          sample :ambi_haunted_hum, rate: rrand(0.1, 2)  if one_in(2)
          sample :ambi_drone, rate: rrand(0.1, 2) if one_in(6)
          sample :glitch_perc5, rate: rrand(0.1, 2) if one_in(8)
        end
      end
      
      sample :bd_pure if one_in(4)
      sleep s
    end
  end
  
  
  
  in_thread do
    live_loop :foo4 do
      with_fx :reverb, room: rrand(0.5, 1.0), mix: rrand(0.1, 0.5) do
        with_synth :hollow do
          2.times do
            s = play 60, note_slide: rrand(0.1, 1), cutoff: rrand(50, 100), resonance: 100, decay: 0.1, sustain: 0, slide: 1
            control s, note: 65, cutoff: 100, resonance: 100
            sleep [0.25, 0.5, 1].choose
            control s, note: 67, cutoff: 50, resonance: 25
            sleep [0.25, 0.5, 1].choose
            control s, note: 40, cutoff: 25, resonance: 150
            sleep [0.25, 0.5, 1].choose
          end
        end
      end
      sleep [0.25, 0.5, 1, 2].choose
    end
  end
  
  
  live_loop :foo do
    my_beat
    sleep 0.25
  end
  
  in_thread do
    live_loop :foo3 do
      10.times do
        sample :drum_tom_hi_hard, amp: 1, rate: rrand(0.1, 1), start: rrand(0.1, 0.5), decay: 0.1
        sleep rrand(0.1, 0.5)
        sleep 0.25
      end
    end
  end
  
  in_thread do
    live_loop :foo2 do
      with_fx :reverb, mix: rrand(0.1, 1), room: rrand(0.1, 1) do
        with_fx :bitcrusher do
          if one_in(2)
            sample :sn_zome, start: 0.25, decay: 0.1, release: 1, sustain_level: 0.5, rate: rrand(0.1, 1)
          else
            sample :drum_cymbal_soft, amp: 0.2, rate: rrand(0.1, 1), attack: rrand(0.01, 1)
          end
          sleep 0.25
        end
      end
    end
  end
  
  
  
