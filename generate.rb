# gem install wkhtmltopdf-binary active_support pdfkit slim

require 'active_support/time'
require 'pdfkit'
require 'slim'

PAGE_OPTIONS = {page_size: 'A4', margin_top: 10, margin_bottom: 10, 
                margin_left: 10, margin_right: 10}

def year_month(date)
  "#{date.year}_#{"%02d" % date.month}"
end

def hours(day_date, days_off)
  if day_date.saturday? || day_date.sunday?
    ''
  else
    7.5 - days_off[day_date.day].to_f
  end
end

def write_timesheet(date, hours_off)
  csv = "Timesheet for #{::Date::MONTHNAMES[date.month]} #{date.year}\n\n"
  csv += "Day,Hours\n"
  total = 0
  (date.to_date..date.end_of_month.to_date).each do |d|
    hours = hours(d, hours_off)
    total += hours.to_f
    csv += "#{d.day},#{hours}\n"
  end
  csv += "\n"
  csv += "Total,#{total}\n"
  File.open("timesheet_#{year_month(date)}.csv", 'w') {|f| f.write csv }
  total
end

class Invoice
  def initialize(date, total_hours)
    @date = date
    @total_hours = total_hours
  end

  def invoice_num
    '%03d' % (Dir['invoice_*'].size + 1)
  end

  def full_date
    @date.strftime("%d %B %Y")
  end

  def total_hours
    @total_hours
  end

  def rate(rate = nil)
    @rate ||= rate
  end

  def days
    days = total_hours / 7.5
  end

  def subtotal
    rate * days
  end
end

def write_pdf(date, total_hours)
  invoice = Invoice.new(date, total_hours)

  html = Slim::Template.new('invoice.slim').render(invoice)
  kit = PDFKit.new(html, PAGE_OPTIONS)
  kit.to_file("invoice_#{year_month(date)}.pdf")
end

def to_hours_off(args)
  days = {}
  args.first.split(',').each do |day|
    hours = day =~ /am|pm/ ? 3.75 : 7.5
    days[day.to_i] = hours
  end
  days
end

date = 1.month.ago.beginning_of_month
total_hours = write_timesheet(date, to_hours_off(ARGV))
write_pdf(date, total_hours)

