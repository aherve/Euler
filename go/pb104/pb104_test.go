package main

import (
	"math/big"
	"testing"
)

func TestIsPan(t *testing.T) {
	dic := make(map[string]bool)
	i1 := "213456789"
	i2 := "122456789"
	i3 := "120456789"

	if !isPan(i1, dic) {
		t.Error("isPan ", i1, " should return true")
	}

	if isPan(i2, dic) {
		t.Error("isPan ", i2, " should return false")
	}

	if isPan(i3, dic) {
		t.Error("isPan ", i3, " should return false")
	}
}

func TestPuzzleTester(t *testing.T) {
	dic := make(map[string]bool)
	i1 := new(big.Int)
	i2 := new(big.Int)

	i1, _ = i1.SetString("1234567893434987654321", 10)
	i2, _ = i2.SetString("1224567894545987654321", 10)

	if !puzzleTester(i1, dic) {
		t.Error("puzzleTester", i1, " should be true")
	}

	if puzzleTester(i2, dic) {
		t.Error("puzzleTester", i2, " should be false")
	}
}
