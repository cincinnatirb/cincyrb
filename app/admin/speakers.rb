ActiveAdmin.register Speaker do
  permit_params :bio, :email, :image_url, :name
end
