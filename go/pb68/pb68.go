package main

import (
	"fmt"
	"strconv"
)

func main() {
	res := 0
	for i := 123456; i <= 9876543; i++ {
		if ok, _ := isMagic(i); ok {
			if r := represent(i); r > res && r < 9999999999999999 {
				res = r
			}
		}
	}
	fmt.Println(res)
}

func represent(n int) int {
	_, splitted := isMagic(n)
	groups := [5][3]int{{0, 5, 6}, {1, 6, 7}, {2, 7, 8}, {3, 8, 9}, {4, 9, 5}}
	offset := 0
	min := splitted[groups[0][0]]
	for i, group := range groups {
		if splitted[group[0]] < min {
			offset = i
			min = splitted[group[0]]
		}
	}
	res := ""
	for i := 0; i < 5; i++ {
		for j := 0; j < 3; j++ {
			res += strconv.Itoa(splitted[groups[(i+offset)%5][j]])
		}
	}
	i, err := strconv.Atoi(res)
	if err != nil {
		panic(err)
	}
	return i
}

func isMagic(n int) (bool, []int) {
	splitted := split(n)
	sum := splitted[0] + splitted[5] + splitted[6]
	taken := make(map[int]bool)
	for _, val := range splitted {
		taken[val] = true
	}
	if len(taken) < 7 {
		return false, nil
	}
	for i := 1; i < 4; i++ {
		should := sum - splitted[i] - splitted[i+5]
		if _, ok := taken[should]; !ok && should <= 10 && should >= 1 {
			splitted = append(splitted, should)
			taken[should] = true
		} else {
			return false, nil
		}
	}
	// last check !
	if splitted[4]+splitted[9]+splitted[5] != sum {
		return false, nil
	}
	return true, splitted
}

// 1234567 => [1, 2, 3, 4, 5, 6, 7]
//  234567 => [10, 2, 3, 4, 5, 6, 7]
// 1230567 => [1, 2, 10, 5, 6, 7]
func split(n int) []int {
	if n <= 0 {
		panic("no split for n <= 0 please")
	}
	res := []int{}
	for n > 0 {
		if n%10 > 0 {
			res = append([]int{n % 10}, res...)
		} else {
			res = append([]int{10}, res...)
		}
		n /= 10
	}
	if len(res) < 7 {
		res = append([]int{10}, res...)
	}
	return res
}
