defmodule CardsElixirTutorial do
  @moduledoc """
  Provides methods to handle with decks of cards.
  """

  @doc """
  Returns a list of string with a complete deck of cards.
  """
  def create_list do
    numbers = [
      "Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
      "Ten", "Valete", "Queen", "King"
    ]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, number <- numbers do
      "#{number} of #{suit}"
    end
  end

  @doc """
  It shuffles a bunch of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks if a card exists in a deck or hand

  ## Examples

      iex> deck = CardsElixirTutorial.create_list
      iex> {hand, deck} = CardsElixirTutorial.deal(deck, 2)
      iex> CardsElixirTutorial.contains?(hand, "Two of Spades")
      true
      iex> CardsElixirTutorial.contains?(deck, "Two of Spades")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  Argument `hand_size` indicates how many cards will be in the hand

  ## Examples

      iex> deck = CardsElixirTutorial.create_list
      iex> {hand, _deck} = CardsElixirTutorial.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck into a file

  ## Examples

      iex> deck = CardsElixirTutorial.create_deck(10)
      iex> CardsElixirTutorial.save(deck, "my_file")
      :ok

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Returns a saved deck file

  ## Examples

      iex> filename = "my_file"
      iex> content = "my_content"
      iex> CardsElixirTutorial.save(content, filename)
      iex> CardsElixirTutorial.load(filename)
      "my_content"

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} ->
        case reason do
          :enoent -> "This file does not exists"
          _ -> "Error to read the file"
        end
    end
  end

  @doc """
  Generate a randomized hand from a complete deck and returns the hand and
  remainder cards.
  With this function you don't need create a list, shuffle and get a hand. It
  is automatical.
  """
  def create_deck(hand_size) do
    CardsElixirTutorial.create_list
    |> CardsElixirTutorial.shuffle
    |> CardsElixirTutorial.deal(hand_size)
  end
end
