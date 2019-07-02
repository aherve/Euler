package main

import (
	"testing"
)

func TestIsUnique(t *testing.T) {
	solo := []int{1}
	uniq := []int{1, 2, 3, 4, 5}
	notUniq := []int{1, 2, 3, 1, 5}

	if isDistinct(notUniq) {
		t.Error(notUniq, " should not be unique")
	}

	if !isDistinct(solo) {
		t.Error(solo, " should be unique")
	}
	if !isDistinct(uniq) {
		t.Error(uniq, " should be unique")
	}

}
