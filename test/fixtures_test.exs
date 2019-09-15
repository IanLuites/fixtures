defmodule FixturesTest do
  use ExUnit.Case

  defmodule Example do
    defstruct [:name, :birthday]
  end

  use Fixtures

  fixture Example do
    [
      name: name,
      birthday: date_of_birth
    ]
  end

  test "generates and fills with data" do
    example = Fixtures.create!(Example)

    assert String.printable?(example.name)
    assert example.birthday.__struct__ == Date
  end
end
