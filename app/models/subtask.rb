class Subtask < ApplicationRecord
  belongs_to :task

  scope(:done, -> do
    where({:done => true})
  end)
end
