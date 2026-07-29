import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure BooleanAlgebraPackage where
  carrier : Type
  zero : carrier
  one : carrier
  andOp : carrier → carrier → carrier
  orOp : carrier → carrier → carrier
  notOp : carrier → carrier
  andComm : ∀ a b, andOp a b = andOp b a
  orComm : ∀ a b, orOp a b = orOp b a
  andAssoc : ∀ a b c, andOp (andOp a b) c = andOp a (andOp b c)
  orAssoc : ∀ a b c, orOp (orOp a b) c = orOp a (orOp b c)
  distrib : ∀ a b c, andOp a (orOp b c) = orOp (andOp a b) (andOp a c)
  identityAnd : ∀ a, andOp a one = a
  identityOr : ∀ a, orOp a zero = a
  complementAnd : ∀ a, andOp a (notOp a) = zero
  complementOr : ∀ a, orOp a (notOp a) = one

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  andCommClosed : ∀ a b, B.andOp a b = B.andOp b a
  orCommClosed : ∀ a b, B.orOp a b = B.orOp b a
  andAssocClosed : ∀ a b c, B.andOp (B.andOp a b) c = B.andOp a (B.andOp b c)
  orAssocClosed : ∀ a b c, B.orOp (B.orOp a b) c = B.orOp a (B.orOp b c)
  distribClosed : ∀ a b c, B.andOp a (B.orOp b c) = B.orOp (B.andOp a b) (B.andOp a c)
  identityAndClosed : ∀ a, B.andOp a B.one = a
  identityOrClosed : ∀ a, B.orOp a B.zero = a
  complementAndClosed : ∀ a, B.andOp a (B.notOp a) = B.zero
  complementOrClosed : ∀ a, B.orOp a (B.notOp a) = B.one

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  (∀ a b, B.andOp a b = B.andOp b a) ∧
  (∀ a b, B.orOp a b = B.orOp b a) ∧
  (∀ a b c, B.andOp (B.andOp a b) c = B.andOp a (B.andOp b c)) ∧
  (∀ a b c, B.orOp (B.orOp a b) c = B.orOp a (B.orOp b c)) ∧
  (∀ a b c, B.andOp a (B.orOp b c) = B.orOp (B.andOp a b) (B.andOp a c)) ∧
  (∀ a, B.andOp a B.one = a) ∧
  (∀ a, B.orOp a B.zero = a) ∧
  (∀ a, B.andOp a (B.notOp a) = B.zero) ∧
  (∀ a, B.orOp a (B.notOp a) = B.one)

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage) (E : BooleanAlgebraEvidence B) :
    BooleanAlgebraClosed B := by
  exact And.intro E.andCommClosed
    (And.intro E.orCommClosed
      (And.intro E.andAssocClosed
        (And.intro E.orAssocClosed
          (And.intro E.distribClosed
            (And.intro E.identityAndClosed
              (And.intro E.identityOrClosed
                (And.intro E.complementAndClosed E.complementOrClosed)))))))

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse