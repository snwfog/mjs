require 'sqlite3'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Import all the data
DB_LOCATION  = 'db/ISJ_7.0.sqlite'
DEV_LOCATION = 'db/development.sqlite'

db = SQLite3::Database.new DB_LOCATION
db.query(<<-SQL).each_hash do |row|
  select * from zchapter
SQL
  Chapter.create :title       => row['ZCHAPTER_TITLE'],
                 :description => row['ZCHAPTER_DESC']
end

db.query('select * from zlesson').each_hash do |row|
  Lesson.create :chapter_id  => row['ZCHAPTER'],
                :title       => row['ZLESSON_TITLE'],
                :description => row['ZLESSON_DESC']
end

# Create the narrator
tom    = Narrator.create :name => 'Tom'
takako = Narrator.create :name => 'Takako'
daiki  = Narrator.create :name => 'Daiki'

narrators = {
  :'tom'    => tom,
  :'takako' => takako,
  :'daiki'  => daiki
}

db.query('select * from ztutorline').each_hash do |row|
  Tutorline.create :narrator_id  => narrators[row['ZNARRATOR_NAME'].downcase.to_sym].id,
                   :num       => row['ZTUTOR_NUM'],
                   :audio     => row['ZAUDIO'],
                   :english_1 => row['ZTEXT_ENGLISH1'],
                   :english_2 => row['ZTEXT_ENGLISH2'],
                   :foreign_1 => row['ZTEXT_FOREIGN1'],
                   :foreign_2 => row['ZTEXT_FOREIGN2']
end


