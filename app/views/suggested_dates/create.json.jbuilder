if @suggested_date.persisted?
  json.inserted_item render(partial: "suggested_dates/date", formats: :html, locals: {suggested_date: @suggested_date})
end
