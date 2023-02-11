-- Prompt from: Codeacademy - Fahrenheit Converter

-- Takes temperature in Fahrenheit and returns in Celsius
function fahrenheitToCelsius(degrees)
  return (degrees - 32) * (5/9)
end

-- Takes temperature in Fahrenheit and returns in Kelvin
function fahrenheitToKelvin(degrees)
  return fahrenheitToCelsius(degrees) + 273.15
end

-- Takes temperature in Fahrenheit and returns in 'Warmth'
-- A made-up unit of temperature
function fahrenheitToWarmth(degrees)
  return fahrenheitToKelvin(degrees) / 42
end

-- Handles control input for temperature conversion
function convertTemperature(targetUnit, degrees)
  if targetUnit == "kelvin" then
    return fahrenheitToKelvin(degrees)
  elseif targetUnit == "celsius" then
    return fahrenheitToCelsius(degrees)
  elseif targetUnit == "warmth" then
    return fahrenheitToWarmth(degrees)
  else
    return "Invalid Input!"
  end
end

-- Variables
convertTo = "waRmTH"
inputDegrees = 23

-- Correct the target unit string and pass to the convertTemperature function along with inputDegrees
convertTo = string.lower(convertTo)
convertedDegrees = convertTemperature(convertTo, inputDegrees)
-- Capitalize first letter of the units string
convertTo = convertTo:gsub("%a", string.upper, 1)

-- Print Result
if convertedDegrees == "Invalid Input!" then
  print(convertedDegrees)
  print("Try: Celsius, Kelvin, Warmth")
else
  print(inputDegrees.." in Fahrenheit is "..convertedDegrees.." in "..convertTo..".")
end

