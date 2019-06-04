package main

import (
	"reflect"
	"testing"
)

func TestRepresent(t *testing.T) {
	i1 := 987631
	expected := 6531031914842725

	if r := represent(i1); r != expected {
		t.Error(i1, " should be represented as ", expected, ", got ", r)
	}
}

func TestIsMagic(t *testing.T) {
	magic := 987631
	noMagic := 9680715

	if ok, _ := isMagic(magic); !ok {
		t.Error(magic, " should be magic")
	}

	if ok, _ := isMagic(noMagic); ok {
		t.Error(noMagic, " should not be magic")
	}
}

func TestSplit(t *testing.T) {
	i1 := 1234567
	i2 := 1230567
	i3 := 234567

	expected1 := []int{1, 2, 3, 4, 5, 6, 7}
	expected2 := []int{1, 2, 3, 10, 5, 6, 7}
	expected3 := []int{10, 2, 3, 4, 5, 6, 7}

	if r := split(i1); !reflect.DeepEqual(r, expected1) {
		t.Error(i1, " should split to ", expected1, ", got ", r)
	}

	if r := split(i2); !reflect.DeepEqual(r, expected2) {
		t.Error(i2, " should split to ", expected2, ", got ", r)
	}

	if r := split(i3); !reflect.DeepEqual(r, expected3) {
		t.Error(i3, " should split to ", expected3, ", got ", r)
	}

}
