package com.example.project.services;

import com.example.project.entities.Payment;
import com.example.project.services.interfaces.IPaymentService;
import com.example.project.utilities.VolleyResult;

import java.util.List;

public class PaymentService implements IPaymentService {
    @Override
    public void getAll(VolleyResult<List<Payment>> callback) {

    }

    @Override
    public void getById(int id, VolleyResult<Payment> callback) {

    }

    @Override
    public void insert(Payment entity, VolleyResult<Payment> callback) {

    }

    @Override
    public void update(int id, Payment entity, VolleyResult<Payment> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Payment> callback) {

    }
}
