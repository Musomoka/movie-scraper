class FeedEntriesController < ApplicationController

    before_action :set_feed_entry, only: [:show, :edit, :update, :destroy,:review_query]
    before_action :set_reviews, only: [:show]
    # GET /feed_entries
    # GET /feed_entries.json
    def movie_update



    end


    def index
      HardWorker.perform_async


      @feed_entries = FeedEntry.all
    end

    # GET /feed_entries/1
    # GET /feed_entries/1.json

    def show

        @reviews = @feed_entry.reviews



    end

    # GET /feed_entries/new
    def new
      @feed_entry = FeedEntry.new
    end

    # GET /feed_entries/1/edit
    def edit
    end

    # POST /feed_entries
    # POST /feed_entries.json
    def create
      @feed_entry = FeedEntry.new(feed_entry_params)

      respond_to do |format|
        if @feed_entry.save
          format.html { redirect_to @feed_entry, notice: 'Feed entry was successfully created.' }
          format.json { render :show, status: :created, location: @feed_entry }
        else
          format.html { render :new }
          format.json { render json: @feed_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /feed_entries/1
    # PATCH/PUT /feed_entries/1.json
    def update
      respond_to do |format|
        if @feed_entry.update(feed_entry_params)
          format.html { redirect_to @feed_entry, notice: 'Feed entry was successfully updated.' }
          format.json { render :show, status: :ok, location: @feed_entry }
        else
          format.html { render :edit }
          format.json { render json: @feed_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /feed_entries/1
    # DELETE /feed_entries/1.json
    def destroy
      @feed_entry.destroy
      respond_to do |format|
        format.html { redirect_to feed_entries_url, notice: 'Feed entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def review_query
      Review.query(@feed_entry.id, @feed_entry.url)
      redirect_to @feed_entry, notice: 'Review was successfully created.'



    end








    private

      # Use callbacks to share common setup or constraints between actions.
      def set_feed_entry
        @feed_entry = FeedEntry.find(params[:id])
      end
        # Never trust parameters from the scary internet, only allow the white list through.
      def feed_entry_params
        params.require(:review).permit(:id, :name, :summary,:url)
      end

      def set_reviews
       @reviews = @feed_entry.reviews

      end


end

