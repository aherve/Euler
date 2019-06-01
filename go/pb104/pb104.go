package main

import (
	"fmt"
	"math/big"
	"strings"
)

func main() {
	fibo := make(chan *big.Int)
	stop := make(chan bool)
	panDic := make(map[string]bool)

	var fiboRes *big.Int

	go func() {
		var i uint64
		for {
			i++
			fiboRes = <-fibo
			if i%10000 == 0 {
				fmt.Println("looking at i = ", i)
			}
			if puzzleTester(fiboRes, panDic) {
				break
			}
		}
		fmt.Println("FOUND ", i+1)
		stop <- true
	}()

	fiboChan(fibo, stop)
}

func puzzleTester(n *big.Int, dic map[string]bool) bool {

	str := n.Text(10)
	if len(str) < 9 {
		return false
	}
	a1, a2 := str[0:9], str[len(str)-9:len(str)]

	return isPan(a1, dic) && isPan(a2, dic)
}

func fiboChan(res chan *big.Int, stop chan bool) {
	var x, y = big.NewInt(1), big.NewInt(1)
	for {
		select {
		case res <- x:
			y.Add(x, y)
			x, y = y, x
		case <-stop:
			close(res)
			close(stop)
			return
		}
	}
}

func isPan(str string, panDic map[string]bool) bool {
	res, ok := panDic[str]
	if ok {
		return res
	} else {
		splitted := strings.Split(str, "")
		strMap := map[string]bool{}

		for _, val := range splitted {
			strMap[val] = true
		}

		_, hasZero := strMap["0"]
		res = !hasZero && len(strMap) == 9
		panDic[str] = res
		return res
	}
}
