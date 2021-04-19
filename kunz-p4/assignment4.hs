-- Sean Kunz

-- Problem 1

minhelper [] m = m
minhelper (h:t) m
    | h < m = minhelper t h
    | otherwise = minhelper t m

minlist [] = 0
minlist [h] = h
minlist (h:t) = minhelper (h:t) h
