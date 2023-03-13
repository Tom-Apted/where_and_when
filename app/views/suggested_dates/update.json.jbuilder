if @our_date.persisted?
  json.inserted_item render(partial: "suggested_dates/acceptdate", formats: :html, locals: {our_date: @our_date})
end
