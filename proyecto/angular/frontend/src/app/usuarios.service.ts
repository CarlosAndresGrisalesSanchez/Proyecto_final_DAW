import { Injectable } from '@angular/core';
import {HttpHeaders, HttpClient} from '@angular/common/http';
import {throwError,Observable, from} from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UsuariosService {
  base_url='http://18.207.254.214:8080';
  url_cuentas="/cuentas/signup/"
  url_autenticar="/cuentas/autenticar/"
  headers = new HttpHeaders().set('Content-Type', 'application/json').set('Accept', 'application/json');
  httpOptions = {
    headers: this.headers
  };
  constructor(private http:HttpClient) { }
  registrarNuevoUsuario(datosUsuario){
    return this.http.post(this.base_url+this.url_cuentas,datosUsuario)

  }
  conectarUsuario(datosUsuario){
    console.log(datosUsuario)
    return this.http.post(this.base_url+this.url_autenticar,datosUsuario)

  }
  

}
