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

-- Problem 3

dubhelp [] _ = []
dubhelp (h:t) 0 = [h*2] ++ dubhelp t 1
dubhelp (h:t) 1 = [h] ++ dubhelp t 0

double lt = dubhelp lt 0

-- Problem 4

union [] [] = []
union (h:t) lt2
    | elem h t = union t lt2
    | elem h lt2 = union t lt2
    | otherwise = h:union t lt2
union lt1 (h:t)
    | elem h t = union lt1 t
    | elem h lt1 = union lt1 t
    | otherwise = h:union lt1 t

-- Problem 5

flatten [] = []
flatten [[a]] = [a]
flatten (h:t) = h ++ flatten t
