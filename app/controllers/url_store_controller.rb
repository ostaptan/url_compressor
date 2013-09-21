class UrlStoreController < ApplicationController
  
  def index
    @urls = UrlStore.all
  end

  def new
    @url = UrlStore.new()
  end

  def create
    @url = UrlStore.new().save_with_alias(options)

    respond_to do |format|
      format.html {redirect_to url_store_index_path}
    end
  end
  
  def handle_url
    @url = UrlStore.find_by_alias(get_alias).add_audit(request.remote_ip)
    respond_to do |format|
      format.html { redirect_to @url.generic_url }
    end    
  end

  private

  def options
    unless params[:url_store][:generic_url].blank?
      return {generic_url: params[:url_store][:generic_url], remote_ip: request.remote_ip}
    end
    {}
  end
  
  def get_alias
    params[:token] unless params[:token].blank?
  end
  
end
