I18n.load_path << "#{File.dirname(__FILE__)}/en.yml"
I18n.t('date.formats').each do |key, value|
  Date::DATE_FORMATS[key] = value
end

WickedPdf.config = {
  exe_path: 'C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe',
  enable_local_file_access: true
}

def write_pdf(template)
  html = Slim::Template.new(template.name('slim')).render(template)
  pdf = WickedPdf.new.pdf_from_string(html)
  File.write(template.filename, pdf, mode: 'wb')
end
