class EventsController < ApplicationController

  def index
    render json: Event.limit(100)
  end

  def rollup
    render json: "Not implemented".to_json
  end

private

  # @return [Array, nil]
  def event_type_filter
    String(params[:event_types]).split(',') if params[:event_types].present?
  end

  # @return [Date]
  def month_filter
    params[:month].present? ? Date.parse(params[:month]) : Date.today
  end

end
