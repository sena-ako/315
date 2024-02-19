class OmikuzisController < ApplicationController
def index
    @random_topic = Topic.order("RANDOM()").first
end

def top
end

end
