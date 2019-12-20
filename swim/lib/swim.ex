defmodule Swim do
  def hello do
    Swim.Bucket.start_link
    Swim.Node.create(:a)
    Swim.Node.create(:b)
    Swim.Node.create(:c)
    Swim.Node.create(:t)
    Swim.Node.create(:q)
    Swim.Node.create(:u)
    Swim.Node.create(:n)
  end
end
