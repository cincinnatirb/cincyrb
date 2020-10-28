ActiveAdmin.register Video do
  permit_params :past_event_id, :url

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :url
      f.input :past_event_id, as: :select, collection: PastEvent.all.map { |event| ["#{event.date.strftime('%Y-%m')} #{event.topic.truncate(32)}", event.id] }.sort.reverse
    end
  f.actions
  end
end
