class CreatePreLessonSurveys < ActiveRecord::Migration
  def change
    create_table :pre_lesson_surveys do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :goals

      t.timestamps null: false
    end
  end
end
