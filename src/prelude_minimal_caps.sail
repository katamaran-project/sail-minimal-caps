$include <regfp.sail>
$include "types.sail"

val nextPC : unit -> Capability
function nextPC() = {
  let cursor = PC.cap_cursor in
  {PC with cap_cursor = cursor + 4}
}

val updatePC : unit -> unit
function updatePC() = {
  let c = nextPC() in
  PC = c
}

val addPC : integer -> unit
function addPC(offset) = {
  let cursor = PC.cap_cursor in
  PC = {PC with cap_cursor = cursor + offset}
}

val MEMw : (address, word) -> bool

val MEMr : address -> word

val MEMri : address -> instruction

val not = pure {coq:"negb", _:"not"} : bool -> bool

scattered union exception

union clause exception = ExpectedCapabilityRegisterContents : unit
union clause exception = ExpectedNumberRegisterContents : unit
union clause exception = CapabilityDoesNotHaveWritePermission : unit
union clause exception = CapabilityCursorCannotBeModified : unit
union clause exception = CINCOFFSETOnEnterCapability : unit
union clause exception = CSETBOUNDSOnEnterCapability : unit
union clause exception = Fail : unit