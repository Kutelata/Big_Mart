package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.R;
import com.example.project.databinding.ActivityPaymentBinding;
import com.example.project.entities.Customer;
import com.example.project.entities.Invoice;
import com.example.project.entities.InvoiceDetail;
import com.example.project.entities.Payment;
import com.example.project.entities.Shipment;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.CustomerService;
import com.example.project.services.InvoiceDetailService;
import com.example.project.services.InvoiceService;
import com.example.project.services.PaymentService;
import com.example.project.services.ShipmentService;
import com.example.project.services.interfaces.ICustomerService;
import com.example.project.services.interfaces.IInvoiceDetailService;
import com.example.project.services.interfaces.IInvoiceService;
import com.example.project.services.interfaces.IPaymentService;
import com.example.project.services.interfaces.IShipmentService;
import com.example.project.utilities.GlobalApplication;

import java.util.ArrayList;
import java.util.List;

public class PaymentActivity extends AppCompatActivity {
    IPaymentService paymentService;
    IShipmentService shipmentService;
    IInvoiceService invoiceService;
    IInvoiceDetailService invoiceDetailService;
    ICustomerService customerService;

    List<ProductDTO> productCarts;
    Customer customer;
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
        invoiceService = new InvoiceService(this);
        invoiceDetailService = new InvoiceDetailService(this);
        customerService = new CustomerService(this);

        invoice = new Invoice();
        productCarts = GlobalApplication.getInstance().getProductCart();
        customer = GlobalApplication.getInstance().getCustomerApp();

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
            checkout();
        });

        getListPayment();
        getListShipment();
        setTotalInvoice();
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

    private void setTotalInvoice() {
        float total = 0;
        for (ProductDTO productDTO : productCarts) {
            total += productDTO.cartQuantity * productDTO.price;
        }
        invoice.setTotal(total);
        tvProductTotal.setText(String.format("Tổng: %s VND", total));
    }

    private void checkout() {
        invoice.setCustomerId(customer.getId());
        invoice.setStatus(1);
        if (invoice.getPaymentId() != 0 && invoice.getShipmentId() != 0 && invoice.getCustomerId() != 0) {
            invoiceService.insert(invoice, newInvoice -> {
                if (newInvoice != null) {
                    for (ProductDTO productDTO : productCarts) {
                        InvoiceDetail invoiceDetail =
                                new InvoiceDetail(newInvoice.getId(), productDTO.id, productDTO.cartQuantity, productDTO.price * productDTO.cartQuantity);
                        invoiceDetailService.insert(invoiceDetail, newInvoiceDetail -> {});
                        customer.setPoint(customer.getPoint() + productDTO.point);
                    }
                    customerService.update(customer.getId(), customer, newCustomer -> {
                        if(newCustomer != null){
                            Intent intent = new Intent(this, MainActivity.class);
                            finish();
                            startActivity(intent);
                            GlobalApplication.getInstance().setCustomerApp(newCustomer);
                            GlobalApplication.getInstance().setProductCart(new ArrayList<>());
                            Toast.makeText(getApplicationContext(), "Thanh toán thành công!", Toast.LENGTH_SHORT).show();
                        }else{
                            Toast.makeText(getApplicationContext(), "Không cập nhật được khách hàng!", Toast.LENGTH_SHORT).show();
                        }
                    });
                }
            });
        } else {
            Toast.makeText(this, "Lỗi khóa ngoại!", Toast.LENGTH_SHORT).show();
        }
    }
}