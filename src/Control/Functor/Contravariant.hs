{-# OPTIONS_GHC -fglasgow-exts #-}
-------------------------------------------------------------------------------------------
-- |
-- Module	: Control.Functor.Contravariant
-- Copyright 	: 2008 Edward Kmett
-- License	: BSD
--
-- Maintainer	: Edward Kmett <ekmett@gmail.com>
-- Stability	: experimental
-- Portability	: non-portable (class-associated types)
--
-------------------------------------------------------------------------------------------

module Control.Functor.Contravariant where

class ContravariantFunctor f where
	contramap :: (a -> b)  -> f b -> f a

newtype ContraF a b = ContraF { runContraF :: b -> a }

instance ContravariantFunctor (ContraF a) where
        contramap g (ContraF f) = ContraF (f . g)
