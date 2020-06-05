import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import {ConexionService} from'./conexion.service';
import { CuentasUsuarioComponent } from './cuentas-usuario/cuentas-usuario.component';
import {FormsModule} from '@angular/forms';
@NgModule({
  declarations: [
    AppComponent,
    CuentasUsuarioComponent
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    FormsModule,
  ],
  providers: [ConexionService],
  bootstrap: [AppComponent]
})
export class AppModule { }