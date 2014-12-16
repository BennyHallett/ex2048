Ex2048
======

The 2048 game created in Elixir.

To play, start iex and then call `Ex2048.play`

    $ git clone git://github.com/bennyhallett/ex2048
    $ cd ex2048
    $ iex -S mix
    iex> Ex2048.play

The program will show you the current game board, and then ask for your input.
Use the `vi` keys to push the tiles around the board. They are:

    j: up
    k: down
    h: left
    l: right

### The game board

Each tile is a 4 character padded digit, with blank tiles represented by an
underscore (_)

       4    2    8    2
       _    _    2   16
       4    _    _    8
       _    _    _    2
