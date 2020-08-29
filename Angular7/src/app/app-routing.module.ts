import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OrderComponent } from './orders/order/order.component';
import { OrdersComponent } from './orders/orders.component';

const routes: Routes = [
  { path: '', redirectTo: 'order', pathMatch: 'full' }, // local/ -> local/order
  { path: 'orders', component: OrdersComponent },
  {
    path: 'order',
    children: [
      { path: '', component: OrderComponent },
      { path: 'edit/:id', component: OrderComponent }, // /order/edit/5
    ],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
