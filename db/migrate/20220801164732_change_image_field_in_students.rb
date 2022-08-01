class ChangeImageFieldInStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :profile_image
    add_column :students, :profile_image_id, :integer
  end
end
