class AddStateToIurisTasks < ActiveRecord::Migration
  def change
    add_column :iuris_tasks_tasks, :state, :string
  end
end
