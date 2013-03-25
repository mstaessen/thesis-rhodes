class EvidenceController < Rho::RhoController
  include BrowserHelper

  # GET /Evidence
  def index
    @evidences = Evidence.find(:all)
    render :back => '/app'
  end

  # GET /Evidence/{1}
  def show
    @evidence = Evidence.find(@params['id'])
    if @evidence
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Evidence/new
  def new
    @evidence = Evidence.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Evidence/{1}/edit
  def edit
    @evidence = Evidence.find(@params['id'])
    if @evidence
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Evidence/create
  def create
    @evidence = Evidence.create(@params['evidence'])
    redirect :action => :index
  end

  # POST /Evidence/{1}/update
  def update
    @evidence = Evidence.find(@params['id'])
    @evidence.update_attributes(@params['evidence']) if @evidence
    redirect :action => :index
  end

  # POST /Evidence/{1}/delete
  def delete
    @evidence = Evidence.find(@params['id'])
    @evidence.destroy if @evidence
    redirect :action => :index  
  end
end
