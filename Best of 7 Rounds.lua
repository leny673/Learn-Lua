-- Best of 7 Rounds: Randomly determines which player gets a point or loses a point each round, then finally displays game results at the end.

function printScoreBoard(Name1, Score1, Name2, Score2)
  print(Name1.."-"..Score1.." vs "..Name2.."-"..Score2.."\n")
end

function printGameResult(Name1, Score1, Name2, Score2)
  if Score1 > Score2 then
    print("\tTimes up! "..Name1.." wins!")
  elseif Score1 < Score2 then
    print("\tTimes up! "..Name2.." wins!")
  else 
    print("\tTimes up! It\'s a draw!")
  end
end

function printGameEvents(Name, Event)
  if Event == 0 then
    print("Tied round! No point!")
  elseif Event == 1 then
    print(Name.." wins this round!")
  else 
    print(Name.." delayed and will lose a point!")
  end
end

-- Randomly decides who scored and will get a point.
function gamePlay(Name1, Score1, Name2, Score2)
  P1 = math.random(1,10)
  P2 = math.random(1,10)
  -- Player 1 scored. Calls printGameEvent and returns updated score.
  if P1 > P2 then
    printGameEvents(Name1, 1)
    return Score1 + 1, Score2
  -- Player 2 scored. Calls printGameEvent and returns updated score.
  elseif P1 < P2 then
    printGameEvents(Name2, 1)
    return Score1, Score2 + 1
  -- Unclear move by both players (P1 == P2). Call timeOut to review if it is fair or foul play.
  else
    return timeOut(Name1, Score1, Name2, Score2)
  end
end

-- Randomly decides who delayed a play and will lose a point or round ends in draw and nothing happens.
function timeOut(Name1, Score1, Name2, Score2)
  P1 = math.random(1,5)
  P2 = math.random(1,5)
  -- Player 1 fouled. 
  if P1 > P2 then
    printGameEvents(Name1, -1)
    -- If they have 0 points, then they will stay at 0. Otherwise, subtract a point.
    if Score1 == 0 then
      return 0, Score2
    else
      return Score1 - 1, Score2
    end
  -- Player 2 fouled. 
  elseif P1 < P2 then
    printGameEvents(Name2, -1)
      -- If they have 0 points, then they will stay at 0. Otherwise, subtract a point.
    if Score2 == 0 then
      return Score1, 0
    else
      return Score1, Score2 - 1
    end
  -- Fair play. No one loses a point.
  else
    printGameEvents(nil, 0)
    return Score1, Score2
  end
end

-- Variables
P1Name = "Homer Simpson"
P2Name = "Peter Griffin"
P1Score = 0
P2Score = 0

-- Each iteration (7 for each round) will call gamePlay to get the score of that round and call printScoreBoard to display it.
for i = 1, 7 do
  print("\t\tROUND "..i)
  P1Score, P2Score = gamePlay(P1Name, P1Score, P2Name, P2Score)
  printScoreBoard(P1Name, P1Score, P2Name, P2Score)
end
-- After all rounds finish...
printGameResult(P1Name, P1Score, P2Name, P2Score)

