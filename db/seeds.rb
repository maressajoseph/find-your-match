User.destroy_all
Group.destroy_all
MatchDay.destroy_all
Match.destroy_all



admin = User.create!(email: "admin@admin.com", password: "123456", admin: true)

student_dummy = User.create!(email: "dummy@dummy.com", password: "123456", admin: false, dummy: true, first_name: "NIEMAND, SUKKEL")

student_a = User.create!(email: "h1@ho.com", password: "123456", admin: false, first_name: "henk")
student_b = User.create!(email: "h2@ho.com", password: "123456", admin: false, first_name: "jan")
student_c = User.create!(email: "h3@ho.com", password: "123456", admin: false, first_name: "aad")
student_d = User.create!(email: "h4@ho.com", password: "123456", admin: false, first_name: "bob")
student_e = User.create!(email: "h5@ho.com", password: "123456", admin: false, first_name: "daan")
student_f = User.create!(email: "h6@ho.com", password: "123456", admin: false, first_name: "frans")
student_g = User.create!(email: "h7@ho.com", password: "123456", admin: false, first_name: "Aaron")
student_h = User.create!(email: "h8@ho.com", password: "123456", admin: false, first_name: "mark")
student_i = User.create!(email: "h9@ho.com", password: "123456", admin: false, first_name: "bram")


group1 = Group.create!(combis: [])

#daybeforeyesterday = MatchDay.create!(day: Date.today-2, group: group1)
#yesterday = MatchDay.create!(day: Date.today-1, group: group1)
today = MatchDay.create!(day: Date.today, group: group1)
#tomorrow = MatchDay.create!(day: Date.today+1, group: group1)
#dayaftertomorrow = MatchDay.create!(day: Date.today+2, group: group1)


#match1 = Match.create!(match_day: today, student1: student_a, student2: student_b)
