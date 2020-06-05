import { Component, OnInit } from '@angular/core';
import {UsuariosService} from '../usuarios.service';
@Component({
  selector: 'app-cuentas-usuario',
  templateUrl: './cuentas-usuario.component.html',
  styleUrls: ['./cuentas-usuario.component.sass'],
  providers:[UsuariosService]
})
export class CuentasUsuarioComponent implements OnInit {

  constructor(private conexionUsuario:UsuariosService) { }
  registro;//variable para registrar usuarios
  loguear;//variable para loguear usuarios
  N_registro;
  ngOnInit(): void {
    this.N_registro=true;
    this.registro = {
      username :'',
      password1 :'',
      password2 :'',
      email : '',
    }
    this.loguear = {
      username :'',
      password :'',

    }
  }
  registrarUsuario(){
    this.conexionUsuario.registrarNuevoUsuario(this.registro).subscribe(
      response =>{
        document.cookie+="username="+this.registro.username+"logueado=ok";
        alert("El usuario "+this.registro.username+" fue creado")

      },error => console.log('error', error)
      
    );
  }
  usuario_auth;
  loguearUsuario(){
    this.conexionUsuario.conectarUsuario(this.loguear).subscribe(
      response =>{
        
        document.cookie+="username="+this.loguear.username+"logueado=ok";
        console.log(response)
        alert("El usuario "+this.registro.username+" se ha logueado")

      },error => console.log('error', error)
      
    );
  }
  desloguear(){

  }
  

}
