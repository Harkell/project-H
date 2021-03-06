class RationalesController < ApplicationController
  before_action :set_rationale, only: [:edit, :update, :destroy]
  before_action :ticker_association, only: [:show, :new, :edit]
  before_action :set_position, only: [:show, :new, :edit]
  before_action :position_active, only: [:new]
  #before_action :rationale_params, only: [:new, :update] ##SORT THIS OUT

  # GET /rationales
  # GET /rationales.json
  #def index
    #@rationales = Rationale.all
  #end

  # GET /rationales/1
  # GET /rationales/1.json
  def show
    @rationale = Rationale.find_by_position_id(params[:position_id])
    @norationale = false if @rationale
  end

  # GET /rationales/new
  def new
    @rationale = Rationale.new
    @position_id = params[:position_id]
    @findrationale = Rationale.find_by_position_id(@position_id)
    @completed = true if @findrationale.to_s != "" 
  end

  # GET /rationales/1/edit
  def edit
  end

  # POST /rationales
  # POST /rationales.json
  def create
    @rationale = Rationale.new(rationale_params)

    respond_to do |format|
      if @rationale.save
        format.html { redirect_to position_rationale_path, notice: 'Rationale was successfully added.' }
        format.json { render :show, status: :created, location: @rationale }
      else
        format.html { render :new }
        format.json { render json: @rationale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rationales/1
  # PATCH/PUT /rationales/1.json
  def update
    respond_to do |format|
      if @rationale.update(rationale_params)
        format.html { redirect_to position_rationale_path, notice: 'Rationale was successfully updated.' }
        format.json { render :show, status: :ok, location: @rationale }
      else
        format.html { render :edit }
        format.json { render json: @rationale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rationales/1
  # DELETE /rationales/1.json
  #def destroy
    #@rationale.destroy
    #respond_to do |format|
      #format.html { redirect_to rationales_url, notice: 'Rationale was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rationale
      @rationale = Rationale.find_by_position_id(params[:position_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rationale_params
      params.require(:rationale).permit(:position_id, :reasons, :merits, :concerns)
    end

    def ticker_association
      @position_ticker = if params[:id]
        Position.find(params[:id]).ticker
      else
        nil
      end
    end

    def set_position  
      @position = if params[:position_id]# != nil
        #one = Rationale.find_by_id(params[:id])
        #two = one.position_id
        Position.find_by_id(params[:position_id])
      else
        nil
      end
    end

    def position_active
      @active_group = if @position.active
        'Portfolio'
      else
        'Historical'
      end
    end
end
