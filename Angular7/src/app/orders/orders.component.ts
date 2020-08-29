import { Component, OnInit } from '@angular/core';

import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

import { OrderService } from '../shared/order.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css'],
})
export class OrdersComponent implements OnInit {
  orderList;

  constructor(
    private service: OrderService,
    private router: Router,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.refreshLish();
  }

  refreshLish() {
    this.service.getOrderList().then((res) => (this.orderList = res));
  }

  openForEdit(orderID: number) {
    this.router.navigate([`/order/edit/${orderID}`]);
  }

  onOrderDelete(id: number) {
    if (confirm('Are you sure to delete this record?')) {
      this.service.deleteOrder(id).then((res) => {
        this.refreshLish();

        this.toastr.warning('Deleted Successfully', 'Restaurant App.');
      });
    }
  }
}
