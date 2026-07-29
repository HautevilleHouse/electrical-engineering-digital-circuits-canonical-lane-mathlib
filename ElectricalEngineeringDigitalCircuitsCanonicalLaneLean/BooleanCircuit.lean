import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure GateType where
  name : String
  arity : Nat
  truthTable : List (List Bool → Bool)

def AND : GateType := { name := "AND", arity := 2, truthTable := [] }
def OR : GateType := { name := "OR", arity := 2, truthTable := [] }
def NOT : GateType := { name := "NOT", arity := 1, truthTable := [] }

structure Wire where
  source : Nat
  target : Nat

definition CircuitInput : Type := Nat
definition CircuitOutput : Type := Nat

structure BooleanCircuit where
  numInputs : Nat
  numOutputs : Nat
  numGates : Nat
  gates : List GateType
  wires : List Wire
  inputMapping : List (Nat × Nat)
  outputMapping : List (Nat × Nat)
  isAcyclic : Prop
  isWellFormed : Prop

structure CircuitSpecification where
  circuit : BooleanCircuit
  inputNames : List String
  outputNames : List String
  truthTable : List (List Bool → Bool)
  functionalCorrectness : Prop

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse