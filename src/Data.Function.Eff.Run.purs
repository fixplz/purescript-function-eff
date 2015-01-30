module Data.Function.Eff.Run where

import Data.Function.Run
import Data.Function.Eff
import Control.Monad.Eff (Eff())

instance runFnEff0 :: RunFn (FnEff0 eff a) (Eff eff a) where runFn = runFnEff0
instance runFnEff1 :: RunFn (FnEff1 eff a b) (a -> Eff eff b) where runFn = runFnEff1
instance runFnEff2 :: RunFn (FnEff2 eff a b c) (a -> b -> Eff eff c) where runFn = runFnEff2
instance runFnEff3 :: RunFn (FnEff3 eff a b c d) (a -> b -> c -> Eff eff d) where runFn = runFnEff3
instance runFnEff4 :: RunFn (FnEff4 eff a b c d e) (a -> b -> c -> d -> Eff eff e) where runFn = runFnEff4
instance runFnEff5 :: RunFn (FnEff5 eff a b c d e f) (a -> b -> c -> d -> e -> Eff eff f) where runFn = runFnEff5

