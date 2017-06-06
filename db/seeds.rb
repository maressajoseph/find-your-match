admin = User.create!(email: "hi@hi.com", password: "123456", admin: true)

student_a = User.create!(email: "h1@ho.com", password: "123456", admin: false)
student_b = User.create!(email: "h2@ho.com", password: "123456", admin: false)
student_c = User.create!(email: "h3@ho.com", password: "123456", admin: false)
student_d = User.create!(email: "h4@ho.com", password: "123456", admin: false)
student_e = User.create!(email: "h5@ho.com", password: "123456", admin: false)
student_f = User.create!(email: "h6@ho.com", password: "123456", admin: false)
student_g = User.create!(email: "h7@ho.com", password: "123456", admin: false)
student_h = User.create!(email: "h8@ho.com", password: "123456", admin: false)
student_i = User.create!(email: "h9@ho.com", password: "123456", admin: false)


combinations = AvailableCombination.create!(combis: [])

today = MatchDay.create!(day: Date.today, available_combination: combinations)

match1 = Match.create!(match_day: today, student1: student_a, student2: student_b)
