-- Sean Kunz

-- Problem 1

minhelper [] m = m
minhelper (h:t) m
    | h < m = minhelper t h
    | otherwise = minhelper t m

minlist [] = 0
minlist [h] = h
minlist (h:t) = minhelper (h:t) h

-- Problem 2

--delete _ [] = []
--delete 1 (h:t) = t
--delete k (h:t) = [h] ++ delete (k-1) t

delhelp _ _ [] = []
delhelp k 1 (h:t) = delhelp k k t
delhelp k s (h:t) = [h] ++ (delhelp k (s-1) t)

delete k lt = delhelp k k lt
