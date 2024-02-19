class TopicsController < ApplicationController

  def index
    if params[:latest]
      @topics= Topic.latest
    elsif params[:old]
      @topics= Topic.old
    elsif params[:most_favorited]
      @topics= Topic.most_favorited
    else
      @topics= Topic.all
    end
    @tags = Tag.all
    @topics = @topics.where("contents LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    #もしタグ検索したら、post_idsにタグを持ったidをまとめてそのidで検索
    if params[:tag_ids].present?
      topic_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).topics.each do |p| 
            topic_ids << p.id
          end
        end
      end
      topic_ids = topic_ids.uniq
      #キーワードとタグのAND検索
      @topics = @topics.where(id: topic_ids) if topic_ids.present?
    end

    if params[:tag].present?
      existing_tag = Tag.find_by(name: params[:tag])
    
      unless existing_tag
        Tag.create(name: params[:tag])
      end
    end

  end

  def new
    @topics = Topic.new
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @topics = Topic.find(params[:id])
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to action: :index
  end

  private
  def topic_params
    params.require(:topic).permit(:contents, tag_ids: [])
  end

end
