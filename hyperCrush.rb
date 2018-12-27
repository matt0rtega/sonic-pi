in_thread do
  live_loop :foo do
    cue :tick
    sleep 1
  end
end

in_thread do
  live_loop :foo3 do
    with_fx :bitcrusher, bits: rrand(0.1, 5), cutoff: rrand(20, 100) do
      if one_in(4)
        sample :bd_haus, rate: rrand(-1, 4)
      end
      sleep [0.125, 0.25, 0.5].choose
    end
  end
end

in_thread do
  live_loop :foo2 do
    sample :bd_haus, rate: rrand(-1, 4) if one_in(4)
    if one_in(3)
      with_fx :reverb, mix: rrand(0.1, 1.0), room: rrand(0.1, 1.0) do
        with_fx :bitcrusher, bits: rrand(0.1, 4), cutoff: rrand(20, 100) do
          sample :ambi_choir, decay: 1, attack: 1.0, sustain: 0, rate: [0.25,1].choose, pitch: [6, 3, 12, 5].choose
          sleep 0.125
        end
      end
    end
    sleep [0.125, 0.25, 0.5].choose
  end
end

in_thread do
  live_loop :foo4 do
    with_fx :bitcrusher, bits: rrand(0.1, 4), cutoff: rrand(20, 100) do
      sample :sn_generic, rate: rrand(-1, 4), decay: 0.2, sustain: 0 if one_in(4)
      sleep 0.33
    end
  end
end
