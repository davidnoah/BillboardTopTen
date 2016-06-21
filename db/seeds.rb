#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

charts = {}


lines = File.readlines("billboard-data.txt")
lines.each.with_index do |line, idx|
  next unless idx % 63 == 1
  date_key = lines[idx][0..-2]
  charts[date_key] = []

  i = 0
  while i < 10
    factor = 6 * i
    track = {
      title: lines[idx + 1 + (factor)][0..-2],
      artist: lines[idx + 2 + (factor)][0..-2],
      rank: lines[idx + 4 + (factor)][0..-2],
      spotify_id: lines[idx + 5 + (factor)][0..-2],
      spotify_link: lines[idx + 6 + (factor)][0..-2]
    }
    charts[date_key] << track
    i += 1
  end
end

p charts
