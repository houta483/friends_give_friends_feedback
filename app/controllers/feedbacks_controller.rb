class FeedbacksController < ApplicationController
  def index
    @q = Feedback.ransack(params[:q])
    @feedbacks = @q.result(:distinct => true).includes(:recipient).page(params[:page]).per(10)

    render("feedback_templates/index.html.erb")
  end

  def show
    @feedback = Feedback.find(params.fetch("id_to_display"))

    render("feedback_templates/show.html.erb")
  end

  def new_form
    @feedback = Feedback.new

    render("feedback_templates/new_form.html.erb")
  end

  def create_row
    @feedback = Feedback.new

    @feedback.comments = params.fetch("comments")
    @feedback.commentor_id = params.fetch("commentor_id")
    @feedback.recipient_id = params.fetch("recipient_id")

    if @feedback.valid?
      @feedback.save

      redirect_back(:fallback_location => "/feedbacks", :notice => "Feedback created successfully.")
    else
      render("feedback_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @feedback = Feedback.find(params.fetch("prefill_with_id"))

    render("feedback_templates/edit_form.html.erb")
  end

  def update_row
    @feedback = Feedback.find(params.fetch("id_to_modify"))

    @feedback.comments = params.fetch("comments")
    @feedback.commentor_id = params.fetch("commentor_id")
    @feedback.recipient_id = params.fetch("recipient_id")

    if @feedback.valid?
      @feedback.save

      redirect_to("/feedbacks/#{@feedback.id}", :notice => "Feedback updated successfully.")
    else
      render("feedback_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_recipient
    @feedback = Feedback.find(params.fetch("id_to_remove"))

    @feedback.destroy

    redirect_to("/users/#{@feedback.recipient_id}", notice: "Feedback deleted successfully.")
  end

  def destroy_row
    @feedback = Feedback.find(params.fetch("id_to_remove"))

    @feedback.destroy

    redirect_to("/feedbacks", :notice => "Feedback deleted successfully.")
  end
end
