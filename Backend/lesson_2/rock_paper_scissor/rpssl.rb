VALID_CHOICE = %w(rock lizard spock scissors paper)

choice_list = %w(r l sp sc p)

choice_list_prompt = <<-msg
  Please choose one:
  r: rock
  p: paper
  sc: scissors
  sp: spock
  l: lizard
msg

def win?(choice1, choice2)
  i1 = VALID_CHOICE.index(choice1)
  i2 = VALID_CHOICE.index(choice2)
  base = VALID_CHOICE.length

  (i1 + 1) % base == i2 || (i1 + 3) % base == i2
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  player_choice_abb = ''
  loop do
    prompt(choice_list_prompt)
    player_choice_abb = Kernel.gets().chomp()
    if choice_list.include?(player_choice_abb)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  player_choice = case player_choice_abb
  when "r"
    "rock"
  when "p"
    "paper"
  when "sc"
    "scissors"
  when "sp"
    "spock"
  when "l"
    "lizard"
  end

  computer_choice = VALID_CHOICE.sample()

  prompt("You chose #{player_choice.upcase}, computer chose #{computer_choice.upcase}")

  display_result(player_choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing RPSSL. Good bye!")
