module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ::ActiveRecord::RecordInvalid, with: :render_record_invalid_error
    rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found_error
    rescue_from ::ActiveRecord::RecordNotUnique, with: :render_record_conflict_error
  end

  def render_record_invalid_error
    render status: 400, json: {
      code: "400",
      message: "RecordInvalidError",
    }
  end

  def render_record_not_found_error
    render status: 400, json: {
      code: "400",
      message: "エラーが発生しました",
    }
  end

  def render_record_conflict_error
    render status: 400, json: {
      code: "400",
      message: "エラーが発生しました",
    }
  end
end
