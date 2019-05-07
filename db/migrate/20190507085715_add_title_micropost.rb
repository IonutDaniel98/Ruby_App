class AddTitleMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :title, :string, default: "Title"
  end
end
