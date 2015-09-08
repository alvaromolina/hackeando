class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:new, :create, :update, :edit]


  autocomplete :entity, :name, :full => true

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
    #if @complaint.url
    #  @parsed_link = LinkThumbnailer.generate(@complaint.url)
    #end
    #puts @parsed_link
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
    @image = Image.new
  end

  # GET /complaints/1/edit
  def edit
  end

  def preview
    post = Complaint.new(url: params[:url])
    render :text => post.url_html
  end


  # POST /complaints
  # POST /complaints.json
  def create


    @complaint = Complaint.new(complaint_params)

    entity_name = complaint_params[:entity_name]

    if entity_name
      entity = Entity.where(name: entity_name.upcase.strip).first_or_create
      @complaint.entity_id = entity.id

    end


    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:title, :detail, :entity_id,:entity_name,:image,:url)
    end
end
