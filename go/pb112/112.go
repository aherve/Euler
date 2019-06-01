package main

import (
	"fmt"
)

func main() {
	memo := make(map[int64]bouncyResult)
	i := int64(100)
	currentRes := bouncyRate(i, memo)
	for i = int64(100); true; i++ {
		currentRes = bouncyRate(i, memo)
		if currentRes.bouncy == 99*currentRes.notBouncy {
			fmt.Println("FOUND", i)
			return
		}
	}
}

type bouncyResult struct {
	bouncy    int64
	notBouncy int64
}

func bouncyRate(n int64, memo map[int64]bouncyResult) bouncyResult {
	existing, ok := memo[n]
	if ok {
		return existing
	}

	if n < 100 {
		return bouncyResult{0, n}
	}

	prev := bouncyRate(n-1, memo)
	if isBouncy(n) {
		res := bouncyResult{prev.bouncy + 1, prev.notBouncy}
		memo[n] = res
		return res
	} else {
		res := bouncyResult{prev.bouncy, prev.notBouncy + 1}
		memo[n] = res
		return res
	}
}

func isBouncy(n int64) bool {
	var increasing, decreasing = false, false

	var prev int64 = n % 10
	n = (n - prev) / 10
	for n > 0 {
		dig := n % 10
		if dig > prev {
			increasing = true
		} else if prev > dig {
			decreasing = true
		}
		if increasing && decreasing {
			return true
		}
		prev = dig
		n = (n - dig) / 10
	}
	return false
}
