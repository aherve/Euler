package main

import (
	"fmt"
	"sort"
	"strconv"
)

func main() {
	fmt.Println("hi")
	c := unify(setGenerator(3))
	for i := 0; i < 100; i++ {
		fmt.Println(<-c)
	}
}

func setGenerator(dim int) chan []int {
	if dim <= 1 {
		return intGenerator()
	}
	return genMerge(setGenerator(dim-1), intGenerator())
}

func unify(cin chan []int) chan []int {
	cout := make(chan []int)
	go func(c chan []int) {
		h := make(map[string]bool)
		for {
			val := <-cin
			key := signature(val)
			if _, ok := h[key]; !ok {
				cout <- val
				h[key] = true
			}
		}
	}(cout)
	return cout
}

func signature(arr []int) string {
	b := ""
	sort.Ints(arr)
	for _, i := range arr {
		b += strconv.Itoa(i) + ","
	}
	return b
}

func intGenerator() chan []int {
	cout := make(chan []int)
	go func(c chan []int) {
		i := 1
		for {
			c <- []int{i}
			i++
		}
	}(cout)
	return cout
}

func genMerge(c1, c2 chan []int) chan []int {
	cout := make(chan []int)
	go func(cout chan []int) {
		imax := 0
		c1Vals := [][]int{}
		c2Vals := [][]int{}

		for {
			imax++
			c1Vals = append(c1Vals, <-c1)
			c2Vals = append(c2Vals, <-c2)

			for i := 0; i < imax; i++ {
				j := imax - 1 - i
				res := append(c1Vals[i], c2Vals[j]...)
				if isDistinct(res) {
					cout <- res
				}
			}
		}
	}(cout)

	return cout
}

func isDistinct(arr []int) bool {
	h := make(map[int]bool)
	for _, val := range arr {
		if _, ok := h[val]; ok {
			return false
		} else {
			h[val] = true
		}
	}
	return true
}
