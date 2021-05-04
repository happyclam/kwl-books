class StaticPagesController < ApplicationController
  def policy
  end
  def sitemap
    respond_to do |format|
      format.xml { redirect_to '/public/sitemap.xml' }
    end
  end
end
