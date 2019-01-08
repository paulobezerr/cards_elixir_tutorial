defmodule CardsElixirTutorialTest do
  use ExUnit.Case
  doctest CardsElixirTutorial

  test "create list returns 52 cards - a complete deck" do
    complete_deck = CardsElixirTutorial.create_list
    assert length(complete_deck) == 52
  end

  test "create a deck and get a hand" do
    complete_deck_size = 52
    hand_size = 10
    {hand, deck} = CardsElixirTutorial.create_deck(hand_size)

    assert length(hand) == hand_size
    assert length(deck) == (complete_deck_size - hand_size)
  end

  test "shuffling a deck randomizes it" do
    deck = CardsElixirTutorial.create_list
    refute deck == CardsElixirTutorial.shuffle(deck)
  end
end
