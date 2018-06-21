class Message < ApplicationRecord
  after_create_commit { MessaageBroadcastJob.perform_later(self) }
end
