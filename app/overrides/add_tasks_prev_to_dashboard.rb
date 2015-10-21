Deface::Override.new(:virtual_path => "iuris/dashboard/index",
										:name => "add_tasks_prev_to_dashboard",
										:insert_after => "[data-iuris-hook='dashboard']",
										:partial => "overrides/tasks_prev",
										:namespaced => true,
										:original => '')