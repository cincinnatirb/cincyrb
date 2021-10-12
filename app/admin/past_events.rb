ActiveAdmin.register PastEvent do
  permit_params :date, :description, :topic

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :date, as: :datetime_picker
      f.input :topic
      f.input :speakers, as: :select, collection: Speaker.all.map { |speaker|
                                                    [speaker.name, speaker.id]
                                                  }.sort, selected: object.speaker_ids
      f.input :description
    end
    f.actions
  end
end
