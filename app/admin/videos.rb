ActiveAdmin.register Video do
 form do |f|
   f.inputs "Details" do
     f.input :url
     f.input :past_event_id, :as => :select, :collection => PastEvent.all.map { |event| [event.date, event.id] }
   end
   f.buttons
 end
end
