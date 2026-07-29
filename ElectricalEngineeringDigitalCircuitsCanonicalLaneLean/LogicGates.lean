import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.BooleanAlgebras

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure LogicGatePackage (B : BooleanAlgebraPackage) where
  gateCount : Nat
  andGate : B.carrier → B.carrier → B.carrier
  orGate : B.carrier → B.carrier → B.carrier
  notGate : B.carrier → B.carrier
  xorGate : B.carrier → B.carrier → B.carrier
  nandGate : B.carrier → B.carrier → B.carrier
  norGate : B.carrier → B.carrier → B.carrier
  andGateCorrect : ∀ x y, andGate x y = B.andOp x y
  orGateCorrect : ∀ x y, orGate x y = B.orOp x y
  notGateCorrect : ∀ x, notGate x = B.notOp x
  xorGateCorrect : ∀ x y, xorGate x y = B.orOp (B.andOp x (B.notOp y)) (B.andOp (B.notOp x) y)
  nandGateCorrect : ∀ x y, nandGate x y = B.notOp (B.andOp x y)
  norGateCorrect : ∀ x y, norGate x y = B.notOp (B.orOp x y)

structure LogicGateEvidence {B : BooleanAlgebraPackage} (L : LogicGatePackage B) where
  andGateClosed : ∀ x y, L.andGate x y = B.andOp x y
  orGateClosed : ∀ x y, L.orGate x y = B.orOp x y
  notGateClosed : ∀ x, L.notGate x = B.notOp x
  xorGateClosed : ∀ x y, L.xorGate x y = B.orOp (B.andOp x (B.notOp y)) (B.andOp (B.notOp x) y)
  nandGateClosed : ∀ x y, L.nandGate x y = B.notOp (B.andOp x y)
  norGateClosed : ∀ x y, L.norGate x y = B.notOp (B.orOp x y)

def LogicGateClosed {B : BooleanAlgebraPackage} (L : LogicGatePackage B) : Prop :=
  (∀ x y, L.andGate x y = B.andOp x y) ∧ (∀ x y, L.orGate x y = B.orOp x y) ∧
  (∀ x, L.notGate x = B.notOp x) ∧ (∀ x y, L.xorGate x y = B.orOp (B.andOp x (B.notOp y)) (B.andOp (B.notOp x) y)) ∧
  (∀ x y, L.nandGate x y = B.notOp (B.andOp x y)) ∧ (∀ x y, L.norGate x y = B.notOp (B.orOp x y))

theorem logic_gate_closed_from_evidence {B : BooleanAlgebraPackage} (L : LogicGatePackage B) (E : LogicGateEvidence L) :
    LogicGateClosed L := by
  exact And.intro E.andGateClosed
    (And.intro E.orGateClosed
      (And.intro E.notGateClosed
        (And.intro E.xorGateClosed
          (And.intro E.nandGateClosed E.norGateClosed))))

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse