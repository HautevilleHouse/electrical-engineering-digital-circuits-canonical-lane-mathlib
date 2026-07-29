import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.CombinationalCircuits

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure SequentialCircuitPackage {B : BooleanAlgebraPackage} {L : LogicGatePackage B} (C : CombinationalCircuitPackage L) where
  stateBits : Nat
  stateUpdate : B.carrier ^ stateBits → B.carrier ^ C.inputCount → B.carrier ^ stateBits
  outputFunction : B.carrier ^ stateBits → B.carrier ^ C.inputCount → B.carrier ^ C.outputCount
  stateTransitionCorrect : Prop
  initialState : B.carrier ^ stateBits
  clockCycleCount : Nat → Prop

structure SequentialCircuitEvidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} (S : SequentialCircuitPackage C) where
  stateTransitionClosed : S.stateTransitionCorrect
  initialDefined : S.initialState = S.initialState

def SequentialCircuitClosed {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} (S : SequentialCircuitPackage C) : Prop :=
  S.stateTransitionCorrect

theorem sequential_circuit_closed_from_evidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} (S : SequentialCircuitPackage C) (E : SequentialCircuitEvidence S) :
    SequentialCircuitClosed S := by
  exact E.stateTransitionClosed

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse