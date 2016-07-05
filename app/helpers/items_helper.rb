module ItemsHelper
    def time_remaining_to_delete_item(from_time, to_time)
        distance_of_time_in_words(from_time, to_time, include_seconds: true)
    end
end
