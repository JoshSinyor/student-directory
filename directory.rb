# This directory contains an array of Villains' Academy's students.

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

# This section prints the list of students, and a headcount.

students.each do |student|
  puts student
end

puts "In total, we have #{students.count} great students."
