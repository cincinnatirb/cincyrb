ActiveAdmin.register PastEvent do
  form do |f|  
    f.inputs "Details" do
      f.input :date
      f.input :topic
      f.input :speakers, :as => :check_boxes, :collection => Speaker.all.map { |speaker| [speaker.name, speaker.id] }
      f.input :description
    end
    f.buttons
  end
end
