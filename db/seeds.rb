admin = User.create!(email: "hi@hi.com", password: "123456", admin: true)

student_a = User.create!(email: "hu@hu.com", password: "123456", admin: false)
student_b = User.create!(email: "ho@ho.com", password: "123456", admin: false)

today = MatchDay.create!(day: Date.today)

match1 = Match.create!(match_day: today, student1: student_a, student2: student_b)

combinations = AvailableCombination.create!(combis: [])
