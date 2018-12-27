# Welcome to Sonic Pi v3.1

live_loop :foo do
  
  if one_in(10)
    with_fx :reverb do |r|
      play 50
      sleep 0.5
      control r, mix: 0.7
      play 55
      sleep 1
      control r, mix: 1
      control r, damp: 1
      sleep 1
      play 62
      
      s = play 60, release: 5, note_slide: 1
      sleep 0.5
      control s, note: 65
      sleep 0.5
      control s, note: 67
      sleep 3
      control s, note: 72
    end
  end
  
  with_fx :reverb do |r|
    s = play 60, release: rrand(0.1, 2)
    sleep 0.1
    control r, mix: rrand(0.2, 1), room: 1
    control s, note: 65
    sleep 0.1
    control r, mix: 1.0, room: rrand(0.2, 1)
    control s, note: 67
    sleep rrand(0.3, 0.5)
    control s, note: 72
  end
end
