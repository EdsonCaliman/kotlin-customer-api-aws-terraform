package com.example.CustomerApi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CustomerApiApplication

fun main(args: Array<String>) {
	runApplication<CustomerApiApplication>(*args)
}
