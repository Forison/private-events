module EventsHelper
    def upcoming_events
        #events that are less than time.now
        Event.where('date > ?',DateTime.now)
    end
    def previous_events
        #events that are greater than time.now
        Event.where('date < ?',DateTime.now)
    end
end
