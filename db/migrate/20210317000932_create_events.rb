class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :occurred_at
      t.string :email
      t.string :event_type
    end
  end
end
