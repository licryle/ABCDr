class WordsController < ApplicationController
  before_action :authenticate_user!, :set_word, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:home, :show]
  #For adding new words without Admin UI skip_before_action :authenticate_user!, only: [:new, :create]

  # Special Home Page with Letters & words list
  def home
    words = Word.all
    @alphabet = self.index_by_letter(words)
    @daily_random = self.daily_random(words)
  end

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def index_by_letter(words)
      alphabet = Hash.new

      for word in words
        letter = word.word[0,1].capitalize

        if not alphabet.key?(letter)
          alphabet[letter] = Array.new
        end

        alphabet[letter].push(word)
      end

      return alphabet.slice(*alphabet.keys.shuffle)
    end

    def daily_random(words)
      time = Time.new
      daily_key = time.year * 10000 + time.month * 100 + time.day
      daily_key = daily_key % words.size()

      i = 0
      for word in words
        if i == daily_key
          return word
        end

        i = i + 1
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:word, :title, :creation_date, :published, :content, :author)
    end
end
