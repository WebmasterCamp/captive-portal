export function validateCitizenId(id: string) {
  if (id.length !== 13) return false
  if (id.substring(0, 1) == '0') return false
  if (id.length != 13) return false
  let sum = 0
  for (let i = 0; i < 12; i++) {
    sum += parseFloat(id.charAt(i)) * (13 - i)
  }
  if ((11 - (sum % 11)) % 10 != parseFloat(id.charAt(12))) return false
  return true
}
