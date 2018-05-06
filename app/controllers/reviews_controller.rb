class ReviewsController < ApplicationController

    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_feed_entry, except: [:words]

    # GET /reviews
    # GET /reviews.json





  def index
    tgr = EngTagger.new
    @reviews =@feed_entry.reviews
    @revs = []

    @reviews.each do |comp|
      @revs =@revs.push(comp.body)


    end
    tagged = tgr.add_tags(@revs.join(" "))
    @adj = tgr.get_adjectives(tagged)




  end













    # GET /reviews/1
    # GET /reviews/1.json
    def show
    end

    # GET /reviews/new
    def new
         @review = @feed_entry.review.build
    end

    # GET /reviews/1/edit
    def edit
    end

    # POST /reviews
    # POST /reviews.json
    def create
       @review = @feed_entry.reviews.build(review_params)


        if @review.save
         redirect_to feed_entry_path(@feed_entry), notice: 'Review was successfully created.'

        else
          render :new

        end

    end

    # PATCH/PUT /reviews/1
    # PATCH/PUT /reviews/1.json
    def update
      respond_to do |format|
        if @feed_entry.reviews.update(review_params)
          format.html { redirect_to @review, notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /reviews/1
    # DELETE /reviews/1.json
    def destroy
      @review.destroy
      respond_to do |format|
        format.html { redirect_to @reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end



    private
      # Use callbacks to share common setup or constraints between actions.


      def set_review
        @review = Review.find(params[:id])
      end

      def set_feed_entry
        @feed_entry = FeedEntry.find(params[:feed_entry_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def review_params
        params.require(:review).permit(:movie, :author, :body, :feed_entry_id)
      end

      def feed_entry_params
        params.require(:review).permit(:id, :name, :summary,:url)
      end
end
