module Data.Function.Eff
(
  FnEff0(..), runFnEff0,
  FnEff1(..), runFnEff1,
  FnEff2(..), runFnEff2,
  FnEff3(..), runFnEff3,
  FnEff4(..), runFnEff4,
  FnEff5(..), runFnEff5
)
where

import Data.Function
import Control.Monad.Eff (Eff())

newtype FnEff0 (eff :: # !) ret = FnEff0 (Fn0 ret)
newtype FnEff1 (eff :: # !) p1 ret = FnEff1 (Fn1 p1 ret)
newtype FnEff2 (eff :: # !) p1 p2 ret = FnEff2 (Fn2 p1 p2 ret)
newtype FnEff3 (eff :: # !) p1 p2 p3 ret = FnEff3 (Fn3 p1 p2 p3 ret)
newtype FnEff4 (eff :: # !) p1 p2 p3 p4 ret = FnEff4 (Fn4 p1 p2 p3 p4 ret)
newtype FnEff5 (eff :: # !) p1 p2 p3 p4 p5 ret = FnEff5 (Fn5 p1 p2 p3 p4 p5 ret)

runFnEff0 :: forall eff ret. FnEff0 eff ret -> Eff eff ret
runFnEff0 (FnEff0 fn) = asEff \_ -> runFn0 fn

runFnEff1 :: forall eff p1 ret. FnEff1 eff p1 ret -> p1 -> Eff eff ret
runFnEff1 (FnEff1 fn) p1 = asEff \_ -> runFn1 fn p1

runFnEff2 :: forall eff p1 p2 ret. FnEff2 eff p1 p2 ret -> p1 -> p2 -> Eff eff ret
runFnEff2 (FnEff2 fn) p1 p2 = asEff \_ -> runFn2 fn p1 p2

runFnEff3 :: forall eff p1 p2 p3 ret. FnEff3 eff p1 p2 p3 ret -> p1 -> p2 -> p3 -> Eff eff ret
runFnEff3 (FnEff3 fn) p1 p2 p3 = asEff \_ -> runFn3 fn p1 p2 p3

runFnEff4 :: forall eff p1 p2 p3 p4 ret. FnEff4 eff p1 p2 p3 p4 ret -> p1 -> p2 -> p3 -> p4 -> Eff eff ret
runFnEff4 (FnEff4 fn) p1 p2 p3 p4 = asEff \_ -> runFn4 fn p1 p2 p3 p4

runFnEff5 :: forall eff p1 p2 p3 p4 p5 ret. FnEff5 eff p1 p2 p3 p4 p5 ret -> p1 -> p2 -> p3 -> p4 -> p5 -> Eff eff ret
runFnEff5 (FnEff5 fn) p1 p2 p3 p4 p5 = asEff \_ -> runFn5 fn p1 p2 p3 p4 p5

foreign import asEff
  """function asEff(f) { return f }"""
  :: forall eff ret. (Unit -> ret) -> Eff eff ret
