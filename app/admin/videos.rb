ActiveAdmin.register Video do
  permit_params :past_event_id, :url

  collection = PastEvent.all.map do |event|
    ["#{event.date.strftime('%Y-%m')} #{event.topic.truncate(32)}", event.id]
  end.sort.reverse

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :url
      f.input :past_event_id, as: :select, collection: collection
    end
    f.actions
  end
end
