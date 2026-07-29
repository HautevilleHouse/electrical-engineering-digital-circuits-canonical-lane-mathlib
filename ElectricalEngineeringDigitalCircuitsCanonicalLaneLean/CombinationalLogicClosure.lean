import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.DigitalCircuitObjects

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure CombinationalLogicPackage where
  noFeedback : Prop
  outputFunctionComputed : Prop
  staticDiscipline : Prop
  timingClosure : Prop

structure CombinationalLogicEvidence (C : CombinationalLogicPackage) where
  noFeedbackClosed : C.noFeedback
  outputFunctionComputedClosed : C.outputFunctionComputed
  staticDisciplineClosed : C.staticDiscipline
  timingClosureClosed : C.timingClosure

def CombinationalLogicClosed (C : CombinationalLogicPackage) : Prop :=
  C.noFeedback ∧ C.outputFunctionComputed ∧ C.staticDiscipline ∧ C.timingClosure

theorem combinational_logic_closed_from_evidence (C : CombinationalLogicPackage) (E : CombinationalLogicEvidence C) :
  CombinationalLogicClosed C := by
  exact And.intro E.noFeedbackClosed
    (And.intro E.outputFunctionComputedClosed
      (And.intro E.staticDisciplineClosed E.timingClosureClosed))

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse