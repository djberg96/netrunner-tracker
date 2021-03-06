class RunnersController < ApplicationController
  # GET /runners
  # GET /runners.json
  def index
    @runners = Runner.order(:faction, :identity, :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runners }
    end
  end

  # GET /runners/1
  # GET /runners/1.json
  def show
    @runner = Runner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runner }
    end
  end

  # GET /runners/new
  # GET /runners/new.json
  def new
    @runner = Runner.new
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to create a runner!"
      redirect_to runners_path
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runner }
    end
  end

  # GET /runners/1/edit
  def edit
    @runner = Runner.find(params[:id])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to edit a runner!"
      redirect_to runner_path(@runner)
      return
    end
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(params[:runner])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to create a runner!"
      redirect_to runner_path(@runner)
      return
    end

    respond_to do |format|
      if @runner.save
        format.html { redirect_to @runner, notice: 'Runner was successfully created.' }
        format.json { render json: @runner, status: :created, location: @runner }
      else
        format.html { render action: "new" }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /runners/1
  # PUT /runners/1.json
  def update
    @runner = Runner.find(params[:id])

    respond_to do |format|
      if @runner.update_attributes(params[:runner])
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.json
  def destroy
    @runner = Runner.find(params[:id])

    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to delete a runner!"
      redirect_to runners_path
      return
    end

    @runner.destroy

    respond_to do |format|
      format.html { redirect_to runners_url }
      format.json { head :no_content }
    end
  end
end
