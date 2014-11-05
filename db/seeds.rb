# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  "Ad Hoc",
  "Backtracking",
  "Complete Search",
  "Dynamic Programming",
  "Graphs",
  "Greedy",
  "Hashes",
  "Search",
  "Simulation",
  "Sorting",
]

categories.each do |category_name|
  Category.where(name: category_name).first_or_create
end

judges = [
  { name: 'UVa Online Judge', url: 'http://uva.onlinejudge.org/' },
  { name: 'TopCoder', url: 'http://topcoder.com/tc' },
  { name: 'COCI', url: 'http://hsin.hr/coci/' },
  { name: 'SPOJ', url: 'http://spoj.pl' },
  { name: 'Live Archive', url: 'https://icpcarchive.ecs.baylor.edu/' },
  { name: 'Google Code Jam', url: 'http://code.google.com/codejam/contest' },
  # { name: 'TJU Online Judge', url: 'http://acm.tju.edu.cn/' },
  # { name: 'USACO', url: 'http://www.usaco.org/' },
  # { name: 'PKU Online Judge', url: 'http://poj.org/' },
  # { name: 'ZOJ Online Judge', url: 'http://acm.zju.edu.cn/' },
  # { name: 'Hangzou Dianzi University', url: 'http://acm.hdu.edu.cn/' },
  # { name: 'FZU Online Judge', url: 'http://acm.fzu.edu.cn/' },
  # { name: 'Codeforces', url: 'http://codeforces.com/' },
]

judges.each do |attrs|
  Judge.where(name: attrs[:name]).first_or_create(attrs)
end




