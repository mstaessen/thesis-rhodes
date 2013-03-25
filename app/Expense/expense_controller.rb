class ExpenseController < Rho::RhoController
  include BrowserHelper

  # GET /Expense
  def index
    @expenses = Expense.find(:all)
    render :back => '/app'
  end

  # GET /Expense/{1}
  def show
    @expense = Expense.find(@params['id'])
    if @expense
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Expense/new
  def new
    @expense = Expense.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Expense/{1}/edit
  def edit
    @expense = Expense.find(@params['id'])
    if @expense
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Expense/create
  def create
    @expense = Expense.create(@params['expense'])
    redirect :action => :index
  end

  # POST /Expense/{1}/update
  def update
    @expense = Expense.find(@params['id'])
    @expense.update_attributes(@params['expense']) if @expense
    redirect :action => :index
  end

  # POST /Expense/{1}/delete
  def delete
    @expense = Expense.find(@params['id'])
    @expense.destroy if @expense
    redirect :action => :index  
  end
end
