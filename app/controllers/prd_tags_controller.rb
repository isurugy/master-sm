class PrdTagsController < ApplicationController
  before_action :set_prd_tag, only: [:show, :edit, :update, :destroy]

  # GET /prd_tags
  # GET /prd_tags.json
  def index
    @prd_tags = PrdTag.all
  end

  # GET /prd_tags/1
  # GET /prd_tags/1.json
  def show
  end

  # GET /prd_tags/new
  def new
    @prd_tag = PrdTag.new
  end

  # GET /prd_tags/1/edit
  def edit
  end

  # POST /prd_tags
  # POST /prd_tags.json
  def create
    @prd_tag = PrdTag.new(prd_tag_params)

    respond_to do |format|
      if @prd_tag.save
        format.html { redirect_to @prd_tag, notice: 'Prd tag was successfully created.' }
        format.json { render :show, status: :created, location: @prd_tag }
      else
        format.html { render :new }
        format.json { render json: @prd_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prd_tags/1
  # PATCH/PUT /prd_tags/1.json
  def update
    respond_to do |format|
      if @prd_tag.update(prd_tag_params)
        format.html { redirect_to @prd_tag, notice: 'Prd tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @prd_tag }
      else
        format.html { render :edit }
        format.json { render json: @prd_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prd_tags/1
  # DELETE /prd_tags/1.json
  def destroy
    @prd_tag.destroy
    respond_to do |format|
      format.html { redirect_to prd_tags_url, notice: 'Prd tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prd_tag
      @prd_tag = PrdTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prd_tag_params
      params.require(:prd_tag).permit(:name)
    end
end
