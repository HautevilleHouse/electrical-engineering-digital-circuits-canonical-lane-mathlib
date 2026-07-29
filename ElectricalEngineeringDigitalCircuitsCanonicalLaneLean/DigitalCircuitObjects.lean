import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure Wire where
  name : String
  width : Nat

deriving Repr, DecidableEq

inductive GateType
  | AND | OR | NOT | NAND | NOR | XOR | XNOR

deriving Repr, DecidableEq

structure Gate where
  gtype : GateType
  inputs : List Wire
  outputs : List Wire

deriving Repr, DecidableEq

structure DigitalCircuit where
  inputs : List Wire
  outputs : List Wire
  gates : List Gate
  connections : List (Wire × Wire)

deriving Repr, DecidableEq

structure DigitalCircuitAdmittedObject where
  circuit : DigitalCircuit
  combinationalClosed : Prop
  deterministicBehavior : Prop
  conclusion : combinationalClosed ∧ deterministicBehavior

def DigitalCircuitWitnessClosed (O : DigitalCircuitAdmittedObject) : Prop :=
  O.combinationalClosed ∧ O.deterministicBehavior

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse