class AddEmailToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :email, :string
  end
end
