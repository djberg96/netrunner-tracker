class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.order(sort_column + ' ' + sort_direction).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new
    @current_user = User.find_by_id(session[:user_id])

    unless @current_user.admin?
      flash[:error] = "You do not have permission to create a card"
      redirect_to cards_path(@cards)
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])

    unless @current_user.admin?
      flash[:error] = "You do not have permission to edit a card"
      redirect_to cards_path(@cards)
      return
    end
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(params[:card])
    @current_user = User.find_by_id(session[:user_id])

    unless @current_user.admin?
      flash[:error] = "You do not have permission to create a card"
      redirect_to cards_path(@cards)
      return
    end

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])

    unless @current_user.admin?
      flash[:error] = "You do not have permission to update a card"
      redirect_to cards_path(@cards)
      return
    end

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])

    @current_user = User.find_by_id(session[:user_id])

    unless @current_user.admin?
      flash[:error] = "You do not have permission to update a card"
      redirect_to cards_path(@cards)
      return
    end

    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Card.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
