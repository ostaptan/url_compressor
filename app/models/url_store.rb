class UrlStore < ActiveRecord::Base
  attr_accessible :generic_url
  
  has_many :audits, :foreign_key => "url_id"

  validates_presence_of :generic_url
  validates_uniqueness_of :alias
  validates_format_of :generic_url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/

  before_create :create_unique_alias

  def save_with_alias(options)
    self.transaction do
      self.generic_url = options[:generic_url]
      add_audit(options[:remote_ip]).save!
    end
    self
  end

  def link_to_display
    "http://localhost:3000/#{self.alias}"
  end
  
  def add_audit(remote_ip)
    self.audits << Audit.create!(remote_ip: remote_ip) 
    self   
  end

  private

  def create_unique_alias
    begin
      self.alias = SecureRandom.urlsafe_base64(4)
    end while self.class.exists?(alias: self.alias)
  end

end
