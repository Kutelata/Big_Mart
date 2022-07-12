package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.R;
import com.example.project.databinding.ActivityPaymentBinding;
import com.example.project.entities.Category;
import com.example.project.entities.Invoice;
import com.example.project.entities.Payment;
import com.example.project.entities.Shipment;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.CategoryService;
import com.example.project.services.CustomerService;
import com.example.project.services.PaymentService;
import com.example.project.services.ShipmentService;
import com.example.project.services.interfaces.IPaymentService;
import com.example.project.services.interfaces.IShipmentService;
import com.example.project.utilities.GlobalApplication;

import java.util.ArrayList;
import java.util.List;

public class PaymentActivity extends AppCompatActivity {
    IPaymentService paymentService;
    IShipmentService shipmentService;

    List<ProductDTO> productCarts;
    Invoice invoice;

    ActivityPaymentBinding binding;
    Spinner sPayment, sShipment;
    TextView tvProductTotal;
    Button btnPay;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityPaymentBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        paymentService = new PaymentService(this);
        shipmentService = new ShipmentService(this);
        invoice = new Invoice();
        productCarts = GlobalApplication.getInstance().getProductCart();

        sPayment = binding.sPayment;
        sShipment = binding.sShipment;
        tvProductTotal = binding.tvProductTotal;
        btnPay = binding.btnPay;

        sPayment.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String paymentName = (String) adapterView.getSelectedItem();
                setIdPayment(paymentName);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                invoice.setPaymentId(0);
            }
        });

        sShipment.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String shipmentName = (String) adapterView.getSelectedItem();
                setIdShipment(shipmentName);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                invoice.setShipmentId(0);
            }
        });

        btnPay.setOnClickListener(view -> {

        });

        getListPayment();
        getListShipment();
    }

    private void getListPayment() {
        paymentService.getAll(listPayment -> {
            if (listPayment != null) {
                ArrayList<String> paymentSpinners = new ArrayList<>();
                paymentSpinners.add("Chọn phương thức thanh toán");
                for (Payment payment : listPayment) {
                    paymentSpinners.add(payment.getName());
                }
                ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.spinner_item, paymentSpinners);
                sPayment.setAdapter(adapter);
                sPayment.setSelection(0);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void setIdPayment(String name) {
        paymentService.getAll(listPayment -> {
            if (listPayment != null) {
                for (Payment payment : listPayment) {
                    if (payment.getName().equals(name)) {
                        invoice.setPaymentId(payment.getId());
                        break;
                    }
                }
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void getListShipment() {
        shipmentService.getAll(listShipment -> {
            if (listShipment != null) {
                ArrayList<String> shipmentSpinners = new ArrayList<>();
                shipmentSpinners.add("Chọn phương thức vận chuyển");
                for (Shipment shipment : listShipment) {
                    shipmentSpinners.add(shipment.getName());
                }
                ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.spinner_item, shipmentSpinners);
                sShipment.setAdapter(adapter);
                sShipment.setSelection(0);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void setIdShipment(String name) {
        shipmentService.getAll(listShipment -> {
            if (listShipment != null) {
                for (Shipment shipment : listShipment) {
                    if (shipment.getName().equals(name)) {
                        invoice.setShipmentId(shipment.getId());
                        break;
                    }
                }
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void checkout(){
        
    }
}