ActiveAdmin.register PastEvent do
  permit_params %i[date topic description], speaker_ids: []

  show do |past_event|
    attributes_table do
      row :date
      row :topic
      row :speakers do
        past_event.speakers.each do |speaker|
          div auto_link speaker
        end
        nil
      end
      row :description
    end
    attributes_table do
      row :updated_at
      row :created_at
    end
    active_admin_comments
  end

  form do |f|  
    f.inputs "Details" do
      f.input :date
      f.input :topic
      f.input :speakers, :as => :check_boxes, :collection => Speaker.all.map { |speaker| [speaker.name, speaker.id] }
      f.input :description
    end
    f.actions
  end
end
