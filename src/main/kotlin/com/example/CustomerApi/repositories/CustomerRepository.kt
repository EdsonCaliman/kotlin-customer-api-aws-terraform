package com.example.CustomerApi.repositories

import com.example.CustomerApi.models.Customer
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

interface CustomerRepository : JpaRepository<Customer, UUID> {
}