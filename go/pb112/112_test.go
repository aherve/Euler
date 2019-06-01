package main

import (
	"testing"
)

func TestBouncy(t *testing.T) {

	var i1 int64 = 1234
	var i2 int64 = 4321
	var i3 int64 = 1122
	var i4 int64 = 1212
	var i5 int64 = 2123

	if isBouncy(i1) {
		t.Error(i1, " should not be bouncy")
	}
	if isBouncy(i2) {
		t.Error(i2, " should not be bouncy")
	}
	if isBouncy(i3) {
		t.Error(i3, " should not be bouncy")
	}
	if !isBouncy(i4) {
		t.Error(i4, " should be bouncy")
	}
	if !isBouncy(i5) {
		t.Error(i5, " should be bouncy")
	}

}
