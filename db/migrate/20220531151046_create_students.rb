class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.string :profile_image
      t.string :cover_photo
      t.string :description
      t.string :university
      t.string :career
      t.integer :year
      t.string :country
      t.string :region
      t.string :commune
      t.string :phono
      t.integer :state

      t.timestamps
    end
  end
end
