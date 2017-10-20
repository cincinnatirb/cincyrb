ActiveAdmin.register Speaker do
  permit_params %i[name bio image_url email]
end
