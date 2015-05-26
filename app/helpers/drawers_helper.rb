module DrawersHelper
  def qr(drawer)
    filename = "#{Rails.root}/tmp/#{drawer.name}_#{drawer.slug}.png".gsub(/\s+/, "")
    Qr4r::encode(drawers_url(drawer),filename, :pixel_size => 7 )
    Base64.encode64(open(filename) { |io| io.read })
  end

  def qr_image_tag(drawer, width = '100%', heigth = '100%')
    "<img src='data:image/jpeg;base64,#{qr(drawer)}'/ width=#{width} heigth=#{heigth}>".html_safe
  end

  def qr_data(drawer)
    "data:image/jpeg;base64,#{qr(drawer)}"
  end
end
