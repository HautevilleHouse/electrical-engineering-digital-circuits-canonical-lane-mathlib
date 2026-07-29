import canonicalLaneMathlib.AdmissibleClass
import ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  laneConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "electrical-engineering-digital-circuits-canonical-lane",
    theoremName := "Digital Circuit Constrained Closure",
    theoremObject := "DigitalCircuitAdmittedObject",
    classicalBoundary := "unrestricted classical boundary inherited from source",
    laneConstrainedStatement := "ConstrainedDigitalCircuitClosure holds for all admissible classes",
    certificateLane := "manifold_constrained",
    carriedRemainder := "classical remainder carried by formalization" }

theorem theorem_statement_check : sourceTheoremTheorem.sourceKey = "electrical-engineering-digital-circuits-canonical-lane" := rfl

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse