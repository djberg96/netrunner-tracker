class CorporationsController < ApplicationController
  # GET /corporations
  # GET /corporations.json
  def index
    @corporations = Corporation.order('faction', 'slogan')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corporations }
    end
  end

  # GET /corporations/1
  # GET /corporations/1.json
  def show
    @corporation = Corporation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corporation }
    end
  end

  # GET /corporations/new
  # GET /corporations/new.json
  def new
    @corporation = Corporation.new
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to create a corporation!"
      redirect_to corporations_path
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corporation }
    end
  end

  # GET /corporations/1/edit
  def edit
    @corporation = Corporation.find(params[:id])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to edit a corporation!"
      redirect_to corporations_path
      return
    end
  end

  # POST /corporations
  # POST /corporations.json
  def create
    @corporation = Corporation.new(params[:corporation])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to create a corporation!"
      redirect_to corporations_path
      return
    end

    respond_to do |format|
      if @corporation.save
        format.html { redirect_to @corporation, notice: 'Corporation was successfully created.' }
        format.json { render json: @corporation, status: :created, location: @corporation }
      else
        format.html { render action: "new" }
        format.json { render json: @corporation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corporations/1
  # PUT /corporations/1.json
  def update
    @corporation = Corporation.find(params[:id])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to edit a corporation!"
      redirect_to corporations_path
      return
    end

    respond_to do |format|
      if @corporation.update_attributes(params[:corporation])
        format.html { redirect_to @corporation, notice: 'Corporation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corporation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corporations/1
  # DELETE /corporations/1.json
  def destroy
    @corporation = Corporation.find(params[:id])
    @current = User.find_by_id(session[:user_id])

    unless @current.admin?
      flash[:error] = "You do not have permission to delete a corporation!"
      redirect_to corporations_path
      return
    end

    @corporation.destroy

    respond_to do |format|
      format.html { redirect_to corporations_url }
      format.json { head :no_content }
    end
  end
end
