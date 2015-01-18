class CommentsController < ApplicationController
def index 
	@comment = Comment.all
end

def show
	@Comment = Comment.find(params[:id])
	@article = Article.new
	@comment.comment_id = @comment.id
	redirect_to comments_path(@article.comment)
end

def new
	@comment = Comment.new
end

def create
	article = Article.find(params[:article_id])
	@comment = article.comments.new(comment_params)
	@comment.save
	redirect_to article_path(article)
end

def comment_params
  params.require(:comment).permit(:title, :body)
end

def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect_to comments_path 
end

def edit
  @comment = Comment.find(params[:id])
end

def update
  @comment = Comment.find(params[:id])
  @comment.update(comment_params)

  flash.notice = "comment '#{@comment.title}' Updated!"
  
  redirect_to comment_path(@comment)
end
end
