class CommentsController < ApplicationController

  def create
    one_comment = params.fetch("comment_query")
    one_author = params.fetch("author_query")
    one_id = params.fetch("id_query")

    new_comment = Comment.new

    new_comment.photo_id = one_id

    new_comment.author_id = one_author.to_i
    new_comment.body = one_comment

    new_comment.save
    
    redirect_to("/photos/#{new_comment.photo_id}")
  end

end
