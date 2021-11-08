import React, {useEffect} from 'react'
import Swal from 'sweetalert2'
import { Link } from 'react-router-dom';

var productdata = []
var complementdata = []
var modifierdata = []
var multipledata = []

export default function Carrito() {
    
    var TotalCarrito = 0

    function getDatos(){
        if(localStorage["productdatas"]){
            productdata = JSON.parse(localStorage["productdatas"])
        }
        if(localStorage["complementdatas"]){
            complementdata = JSON.parse(localStorage["complementdatas"])
        }
        if(localStorage["modifierdatas"]){
            modifierdata = JSON.parse(localStorage["modifierdatas"])
        }
        if(localStorage["multipledatas"]){
            multipledata = JSON.parse(localStorage["multipledatas"])
        }
        productdata.map(item =>(
            TotalCarrito += item.precioproducto
        ))

        complementdata.map(item =>(
            TotalCarrito += item.precio
        ))

        modifierdata.map(item =>(
            TotalCarrito += item.precio
        ))

        multipledata.map(item =>(
            TotalCarrito += item.precio
        ))
  
        localStorage.setItem('Totalpagar',TotalCarrito)
    }

    function LimpiarCarrito(){
        Swal.fire({
            title: '¿Estas seguro?',
            text: "Eliminarás todo el carrito de compras",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, quiero eliminarlo!'
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire(
                'Eliminado!',
                'El carrito ha sido eliminado.',
                'success'
              )
                localStorage.removeItem("productdatas")
                localStorage.removeItem("modifierdatas")
                localStorage.removeItem("complementdatas")
                localStorage.removeItem("multipledatas")
                window.location.reload(true);
            }
          })
        
    }

    useEffect(() =>{
        getDatos()  
    }, [])

    console.log(productdata)

    return (
        <div className="carrito">
            <div className="card products-cart"> 
            {productdata.map(item =>(
                <div className="card">
                <span className="product-details-name">{item.nombreproducto}</span>
                <span className="product-details-name">{item.precioproducto}</span>
                {complementdata.map(comp =>(
                    <div>
                        {(item.idcarrito === comp.idcarrito) ? 
                        <span className="product-descr">{comp.nombre}</span> 
                        : '' }                         
                    </div>
                    
                ))}
                {modifierdata.map(mod =>(
                    <div>
                        {(item.idcarrito === mod.idcarrito) ? 
                        <span className="product-descr">{mod.nombre}</span>   
                        : '' }                  
                    </div>
               
                ))}
                {multipledata.map(comp =>(
                    <div>
                        {(item.idcarrito === comp.idcarrito) ? 
                        <span className="product-descr">{comp.nombre}</span>    
                        : '' }                        
                    </div>

                ))}
            </div>  
            ))}
            </div>
            <div className="input-cart">
                <button className="btn btn-primary btn-carrito" onClick={LimpiarCarrito.bind(this)}>Limpiar</button>
                <Link to="/cobrocarrito" className="btn btn-primary">Cobrar</Link> 
            </div>
        </div>
    )
}
