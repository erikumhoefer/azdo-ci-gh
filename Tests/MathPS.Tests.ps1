$root = (Get-Item $PSScriptRoot).Parent.FullName
Import-Module "$root\Scripts\MathPS.psm1" -Force

InModuleScope MathPS {
    Describe "Divide-Integers" {
        Context "Two divisible integers" {
            It "Should return 2" {
                $num1 = 4
                $num2 = 2
                $expected = 2

                $result = Divide-Integers -FirstNum $num1 -SecondNum $num2
                $result | Should -eq $expected
            }
        }

        Context "Two non divisible integers" {
            It "Shoud return 1.5" {
                $num1 = 3
                $num2 = 2
                $expected = 1.5

                $result = Divide-Integers -FirstNum $num1 -SecondNum $num2
                $result | Should -eq $expected
            }
        }

        Context "Divide by zero" {
            It "Should throw an exception" {
                $num1 = 3
                $num2 = 0

                { Divide-Integers -FirstNum $num1 -SecondNum $num2 } | Should -Throw "Cannot divide by zero."
            }
        }   

        Context "This test will fail" {
            It "Should fail" {
                $num1 = 1
                $num2 = 1

                $result = Divide-Integers -FirstNum $num1 -SecondNum $num2
                $result | Should -eq 0
            }
        }
    }
}