##| ##| loop do
##| ##|   with_fx :compressor
##| ##|   if one_in(2)
##| ##|     sample :drum_heavy_kick
##| ##|     sleep 0.3
##| ##|   else
##| ##|     sample :drum_cymbal_closed
##| ##|     sleep 0.2
##| ##|   end
##| ##|   sample :ambi_drone
##| ##|   sample :ambi_dark_woosh
##| ##|   sleep 1
##| ##|   play 36
##| ##|   sleep 0.5
##| ##| end
##| ##| end

##| live_loop :beats do
##|   with_fx :reverb, mix: 0.5, damp: 1, room: 0.2, amp: 0.25, pre: 1.0, pre_mix: 1 do
##|     times = rrand(5, 10)
##|     5.times do
##|       sample :perc_bell, start: 0, finish: rrand(0, 1.0), rate: rrand(-1, 1), attack: 0, release: 1.0
##|       sleep 0.3

##|       2.times do
##|         sample :ambi_choir, rate: rrand(0.1, 0.5)
##|         sleep rrand(0.1, 1)
##|       end
##|     end
##|     sleep rrand(0.2, 2)
##|   end
##| end

##| live_loop :cymbals do
##|   with_fx :reverb, mix: 1, damp: 1, room: 0.5, amp: 0.25, pre: 1.0, pre_mix: 1 do
##|     with_fx :distortion, distort: 0.2, mix: 1 do
##|       amp = rrand(0.1, 0.5)
##|       times = rrand(1, 10)
##|       times.times do
##|         sample :drum_cymbal_closed, start: rrand(0, 0), finish: rrand(0, 1.0), rate: rrand(0, 2), attack: 0, release: 1.0, amp: amp
##|         sleep 0.1
##|       end
##|       sleep rrand(0.2, 1)
##|     end
##|   end
##| end

##| live_loop :organ do
##|   with_synth :pluck do
##|     with_fx :reverb, mix: 1, room:1 do
##|       play note 72
##|       play_pattern_timed chord(choose([:e4, :d4]), :m11), [choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1])], release: 2, attack: 0, cutoff: rrand(72, 100)
##|       play_pattern_timed chord(choose([:g4, :d4]), :m11), [choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1]), choose([0.5, 1.25, 0.75, 1])], release: 2, attack: 0, cutoff: rrand(72, 100)
##|       sleep 0.25
##|     end
##|   end
##| end

##| live_loop :organ do
##|   with_synth :pluck do
##|     play note 72
##|     play note 75
##|     ##| play_pattern_timed chord(choose([:e4,:d4]), :m11), :e4, attack:
##|     play_pattern_timed :e5
##|     sleep 0.25
##|   end
##| end

##| s = play 60, release: 5
##| sleep 0.5
##| control s, note: 65
##| sleep 0.5
##| control s, note: 67
##| sleep 3
##| control s, note: 72

define :my_loop do
  with_fx :reverb do |r|
    ##| control s, note: rrand(62, 65)
    
    10.times do
      use_synth :mod_fm
      control r, mix: rrand(0.1, 1), room: rrand(0.1, 1)
      play chord(choose([:f2, :c3, :c4, :f5, :c2, :g3, :g4, :f2, :g6]), :major), attack: rrand(0, 0.05), decay: 0.0, sustain: 0.0, release: rrand(0.3, 1)
      sleep 0.25
    end
    sleep 0.5
  end
end

define :my_beat do
  ##| with_fx :echo do
  ##|   sample :sn_dolf, rate: 0.5, start: 0.01, stop: 0.2
  ##|   sleep 2
  ##| end
  sample :bd_klub
  sleep 0.25
end

in_thread(name: :something) do
  loop do
    my_beat
  end
end

in_thread(name: :looper) do
  ##| loop do
  ##|   ##| my_loop
  ##| end
end



