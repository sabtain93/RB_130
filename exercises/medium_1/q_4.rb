birds = %w(raven finch hawk eagle)

def types(arr)
  yield(arr)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}"
end