package com.example.CustomerApi.controllers

import com.example.CustomerApi.dtos.CustomerRequest
import com.example.CustomerApi.models.Customer
import com.example.CustomerApi.repositories.CustomerRepository
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.UUID

@RestController
@RequestMapping("customers")
class CustomerController(
    private val repository: CustomerRepository
) {
    @GetMapping()
    fun getCustomers(): List<Customer> {
        return repository.findAll()
    }

    @PostMapping()
    fun postCustomer(request: CustomerRequest): Customer {
        val customer = Customer(name = request.name)
        return repository.save(customer)
    }

    @PutMapping()
    fun putCustomer(customer: Customer): ResponseEntity<Customer> {
        val customerSaved = customer.id?.let { repository.findById(it) }

        return if (customerSaved != null) {
            ResponseEntity<Customer>(repository.save(customer), HttpStatus.OK)
        } else ResponseEntity<Customer>(HttpStatus.BAD_REQUEST)
    }

    @DeleteMapping()
    fun deleteCustomer(@RequestParam id: UUID) {
        repository.findById(id).let {
            repository.delete(it.get())
        }
    }
}