import GHC.Char (chr)

{- 
    This one was mostly just because why tf not and to see if i could do this in haskell.
    Apparently i can.
-}

baseConvert :: Int -> Int -> String
baseConvert base10 base = 
    let
        alphabet = map chr ([48..57] ++ [65..90]) -- get all digits and alphabet symbols as characters
        go :: Int -> String -> String
        go num accum
            | div num base > 0 = go (div num base) ((alphabet !! mod (mod num base) (length alphabet)) : accum) -- recurse while we get a number > 0 from integer division
            | otherwise = (alphabet !! mod (mod num base) (length alphabet)) : accum                            -- and end when we have 0 or less
    in go base10 ""

{- 
    why mod (mod num base) (length alphabet) ? 
    this is mostly for error prevention. otherwise with a base > 36 this algorithm may error out 
-}