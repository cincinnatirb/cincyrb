ActiveAdmin.register Video do
  permit_params %i[url past_event_id]

  form do |f|
    f.inputs "Details" do
      f.input :url
      f.input :past_event_id, :as => :select, :collection => PastEvent.all.map { |event| [event.display_name, event.id] }
    end
    f.actions
  end
end
