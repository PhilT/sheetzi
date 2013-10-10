require 'active_support/time'
require 'pdfkit'
require 'redcarpet'

def year_month(date)
  "#{date.year}_#{"%02d" % date.month}"
end

def write_timesheet(date, days_off)
  csv = "Timesheet #{Date.MONTHNAMES[date.month]} #{date.year}\n\n"
  csv += "Day,Hours\n"
  (date..date.end_of_month).each do |day|

  end
  File.open("timesheet_#{year_month(date)}.csv" {|f| f.write csv }
end

def write_pdf(date)
  html = markdown.render(invoice)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  invoice = File.read('invoice.md')
  kit = PDFKit.new(html, page_size: 'A4', margin_top: 10, margin_bottom: 10, margin_left: 10, margin_right: 10)
  kit.to_file("invoice_#{year_month(date)}.pdf")
end

date = 1.month.ago.beginning_of_month
total_hours = write_timesheet(date, ARGV)
write_pdf(date)

