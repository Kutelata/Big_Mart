package com.example.project.services;

import com.example.project.entities.Shipment;
import com.example.project.services.interfaces.IShipmentService;
import com.example.project.utilities.VolleyResult;

import java.util.List;

public class ShipmentService implements IShipmentService {
    @Override
    public void getAll(VolleyResult<List<Shipment>> callback) {

    }

    @Override
    public void getById(int id, VolleyResult<Shipment> callback) {

    }

    @Override
    public void insert(Shipment entity, VolleyResult<Shipment> callback) {

    }

    @Override
    public void update(int id, Shipment entity, VolleyResult<Shipment> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Shipment> callback) {

    }
}
