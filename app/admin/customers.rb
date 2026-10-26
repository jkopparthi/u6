ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :province, :image

  filter :full_name
  filter :email_address
  filter :phone_number
  filter :province
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :province
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :province
      row :notes
      row(:image) { |c| image_tag url_for(c.image), width: 150 if c.image.attached? }
    end
  end
end