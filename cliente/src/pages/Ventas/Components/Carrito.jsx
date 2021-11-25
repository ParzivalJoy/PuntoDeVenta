import React, {useState,useEffect} from 'react'
import Swal from 'sweetalert2'
import { Link } from 'react-router-dom';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import DeleteForeverIcon from '@mui/icons-material/DeleteForever';
import PaymentIcon from '@mui/icons-material/Payment';
import { useHistory } from "react-router-dom";
import CleaningServicesIcon from '@mui/icons-material/CleaningServices';
import axios from 'axios' //npm i 
import Modal from 'react-bootstrap/Modal'
import Button from 'react-bootstrap/Button'


export default function Carrito() {
    
    let history = useHistory()
    const rol = localStorage.getItem('rol')

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const[imagebinary, setImagebinary] = useState(null)
    const [productdata, setProductData] = useState([])
    const [complementdata, setComplementData] = useState([])
    const [multipledata, setMultipleData] = useState([])
    const [recibido, setRecibido] = useState(0)

    function getDatos(){
        if(localStorage["productdatas"]){
            setProductData(JSON.parse(localStorage["productdatas"]))
        }
        if(localStorage["complementdatas"]){
            setComplementData(JSON.parse(localStorage["complementdatas"]))
        }
        if(localStorage["multipledatas"]){
            setMultipleData(JSON.parse(localStorage["multipledatas"]))
        }
    }

    function getCurrentDate(){
        let today = new Date()
        let date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        return `${date}`
    }
    
    function getCurrentHour(){
        let today = new Date()
        let time = today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds();
        return `${time}`
    }

    async function getImageCuenta(){
        const {data} = await axios.get('http://localhost:5000/api/sales/cuenta'+`/${rol}`)
        console.log("Imagen :", data.qrcuenta)
        if(data.qrcuenta===null){
            const resb = await fetch(
                `http://localhost:5000/inventario/bringImgs/sin-imagen.jpg`+`/${rol}`
              );
              const datab = await resb.blob();
              var sauce= URL.createObjectURL(datab)
              setImagebinary(sauce)
          }else{
            const resb = await fetch(
              `http://localhost:5000/inventario/bringImgs/${data.qrcuenta}`+`/${rol}`
            );
            const datab = await resb.blob();
            var sauce= URL.createObjectURL(datab)
            setImagebinary(sauce)
          }
    }

    

    async function Transaccion(){
        if(recibido === 0){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'No has ingresado el dinero recibido!'
              })
        }else{
            if(productdata.length !== 0){
                //productdata.map(item =>(
                //    ConsultaCantidadesProductos(item.idproducto, item.cantidad)
                //))

                let tempventa = localStorage.getItem('Totalpagar')
                let cambio = parseInt(recibido) - parseInt(tempventa) 

                let idusuario = localStorage.getItem('userid')
                //Se agrega la venta como ticket de compra
                    addSale()
                //Si hay productos en el carrito
                if (Object.entries(productdata).length !== 0){
                    productdata.map(item =>(
                        updateProduct(idusuario, item.idproducto, item.cantidad, item.precioproducto, item.nombreproducto, item.nota, item.total)
                    ))
                    //Si hay complementos en el carrito 
                    if (Object.entries(complementdata).length !== 0){
                        complementdata.map(item =>(
                            updateComplement(idusuario, item.id, item.cantidad, item.nombre, item.precio, item.total)
                        ))
                        localStorage.removeItem("complementdatas")
                    }

                    //Si hay modificadores en el carrito 
                    if (Object.entries(multipledata).length !== 0){
                        multipledata.map(item =>(
                            updateModifier(idusuario, item.idmod, item.id, item.nombremodificador, item.nombre, item.precio, item.idingrediente, item.porcion)
                        ))
                        localStorage.removeItem("multipledatas")
                    }
                    localStorage.removeItem("productdatas")
                }


                Swal.fire({
                    title: 'Venta realizada',
                    text: 'El cambio a entregar es: $'+`${cambio}`,
                    icon: 'success',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Aceptar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        localStorage.setItem("Totalpagar",0)
                        history.push("/ventas");  
                        window.location.reload(true);
                    }
                })
            }else{
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'El carrito está vacío!'
                  })
            }
          
        }

    }

    async function ConsultaCantidadesProductos(idproducto, cantidad){
        const {data} = await axios.get('http://localhost:5000/api/sales/verifyproduct'+`/${idproducto}`+`/${rol}`)
        if (data.cantidadproducto < cantidad){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'No hay suficiente producto para realizar la compra!',
              })
        }else{
            //Verificar la cantidad de complementos 
        }
    }

    async function ConsultaCantidadesComplementos(){

    }

    async function updateProduct(idusuario, idproducto, cantidad, precio, nombre, nota, total){
        const obj = {idusuario, idproducto, cantidad, nombre, nota, precio, total}
        //Modificar la cantidad del producto
        await axios.put('http://localhost:5000/api/sales/updateproduct'+`/${rol}`,obj)
        //Agregar detalles de la venta de productos
        await axios.post('http://localhost:5000/api/sales/addsaleproduct'+`/${rol}`, obj)

        //Rescata la porcion de cada ingrediente que utiliza el producto
        const {data} = await axios.get('http://localhost:5000/api/sales/verification/ingredient/portion'+`/${idproducto}`+`/${rol}`)
        
        //Si el producto tiene ingredientes le quita la cantidad utilizada
        if (data !== undefined){
        data.map(item =>(
            updateingredient(idproducto, item.porcion)
        ))
        }
    }

    async function updateModifier(idusuario, idmod, idop, nombremod, nombreop, precio, idingrediente, porcion){
        //Agregar detalles de la venta de modificadores
        const obj = {idusuario, idmod, idop, nombremod, nombreop, precio, idingrediente, porcion}
        await axios.post('http://localhost:5000/api/sales/addsalemodifier'+`/${rol}`,obj)
        await axios.put('http://localhost:5000/api/sales/modifier/updateingredient'+`/${rol}`,obj)
    }

    async function updateComplement(idusuario, idcomplemento, cantidad, nombre, precio, total){
        //Se obtiene el id del producto original
        const { data } = await axios.get('http://localhost:5000/api/sales/verification/complement'+`/${idcomplemento}`+`/${rol}`)
        let idproducto = data.idproductooriginal
        const obj = {idproducto, cantidad}
        
        //Modificar la cantidad del producto
        await axios.put('http://localhost:5000/api/sales/updateproduct'+`/${rol}`,obj)
        //Agregar detalles de la venta de complementos
        const objproduct = {idusuario, idcomplemento, cantidad, nombre, precio, total}
        await axios.post('http://localhost:5000/api/sales/addsalecomplement'+`/${rol}`, objproduct)
       
        //Rescata la porcion de cada ingrediente que utiliza el producto
        const {dataportion} = await axios.get('http://localhost:5000/api/sales/verification/ingredient/portion'+`/${idproducto}`+`/${rol}`)
        
        //Si el complemento tiene ingredientes tambien quita la cantidad utilizada
        if (dataportion !== undefined){
            dataportion.map(item =>(
                updateingredient(idproducto, item.porcion)
            ))
        }

    }

    async function updateingredient(idproducto, porcion){
        console.log(porcion)
        console.log(idproducto)
        const obj = {porcion, idproducto}
        await axios.put('http://localhost:5000/api/sales/updateingredient'+`/${rol}`, obj)
    }


    async function addSale(){
        let fechaventa =getCurrentDate()
        let horaventa = getCurrentHour()
        let idusuario = localStorage.getItem('userid')
        let totalventa = localStorage.getItem('Totalpagar')
        let idcliente = 0
        let idpago = 1

        const obj = { idusuario, idcliente, idpago, totalventa , fechaventa, horaventa}
        const { data } = await axios.post('http://localhost:5000/api/sales/venta'+`/${rol}`, obj)

    }


    function LimpiarElemento(idcarrito){
        var indexproduct = productdata.findIndex((obj => obj.idcarrito == idcarrito))
        var restaventa = 0
            
        Swal.fire({
            title: '¿Estas seguro?',
            text: "Eliminarás el artículo del carrito",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, quiero eliminarlo!'
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire(
                'Eliminado!',
                'El artículo ha sido eliminado.',
                'success'
              )
            //Busca el producto por indice del carrito y lo elimina
            if(indexproduct >= 0){
                restaventa += productdata[indexproduct].total
                console.log(restaventa)
                productdata.splice(indexproduct, 1)
            }

            //Recorre los arreglos, elimina los elementos que coincidan con el idcarrito
            complementdata.forEach(function(elemento, indice, array){
                if(elemento.idcarrito === idcarrito){
                    restaventa += complementdata[indice].total
                    console.log(restaventa)
                    complementdata.splice(indice, 1)
                }
            })

            multipledata.forEach(function(elemento, indice, array){
                if(elemento.idcarrito === idcarrito){
                    restaventa += multipledata[indice].precio
                    console.log(restaventa)
                    multipledata.splice(indice, 1)
                }
            })

            localStorage.removeItem("productdatas")
            localStorage.removeItem("complementdatas")
            localStorage.removeItem("multipledatas")

            localStorage["productdatas"] = JSON.stringify(productdata)
            localStorage["complementdatas"] = JSON.stringify(complementdata)
            localStorage["multipledatas"] = JSON.stringify(multipledata)

            var tempventa = localStorage.getItem('Totalpagar')
            var totalventa = parseInt(tempventa) - parseInt(restaventa)
            localStorage.setItem('Totalpagar', totalventa)

            history.push("/ventas")  
            }
          })
            

    }

    async function PagoTarjeta(){
        Swal.fire({
            title: '¿Se ha realizado la transacción',
            text: "Asegurate de que la transacción se haya realizado con éxito antes de continuar",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, continua!'
          }).then((result) => {
            if (result.isConfirmed) {
                Transaccion()
            }
          })
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
                localStorage.removeItem("complementdatas")
                localStorage.removeItem("multipledatas")
                localStorage["Totalpagar"] = 0
                window.location.reload(true);
            }
          })
        
    }

    useEffect(() =>{
        getDatos()  
        getImageCuenta()
    }, [])

    console.log(productdata)

    
    const selectedComplement = (e, idcarrito) => {
        const value = e.target.value
        let cantidadanterior
        let nuevototal
        let precio
        let total
        var productdata = JSON.parse(localStorage["productdatas"])
        var indexproduct = JSON.parse(localStorage["productdatas"]).findIndex((obj => obj.idcarrito == idcarrito))

        //Se modifica la cantidad del producto que se venderá
        if(indexproduct >= 0){
            cantidadanterior = productdata[indexproduct].cantidad
            productdata[indexproduct].cantidad = parseInt(value)

            total = productdata[indexproduct].total
            let cantidadcarrito = localStorage.getItem('Totalpagar')
            cantidadcarrito = parseInt(cantidadcarrito) - parseInt(total)
        
            precio = productdata[indexproduct].precioproducto
            nuevototal = parseInt(precio) * parseInt(value)
            productdata[indexproduct].total = nuevototal
            cantidadcarrito = parseInt(cantidadcarrito) + nuevototal

            localStorage.setItem('Totalpagar', cantidadcarrito)
        }

        localStorage.removeItem("productdatas")
        localStorage["productdatas"] = JSON.stringify(productdata)
    }

    return (
        <div className="carrito">
            <div className="card products-cart"> 
            {productdata.map(item =>(
                <div className="card">
                    <div className="row">
                        <div className="col-5" algin="center">
                            {item.nombreproducto}
                        </div>
                        <div className="col-2" align="center">
                            <div className="cart-com-mod">
                                <span className="cart-comp">Complementos</span>
                                <span className="cart-comp">Modificadores</span>
                            </div>
                        </div>  
                        <div className="col-4">
                            <DeleteForeverIcon className="icons delete-icon" onClick={LimpiarElemento.bind(this, item.idcarrito)}/>
                            <input type="number" className="product-cant-input" placeholder="1" min="1" max="10" defaultValue={item.cantidad} onChange={(e) => {selectedComplement(e, item.idcarrito)}}/>
                        </div>
                    </div>
                </div>  
            ))}
            </div>
            <div className="input-cart">
                <div className="info-cobro">
                    <div className="total">
                        <span>Total</span>
                        <input type="text" value={localStorage.getItem('Totalpagar')} disabled className="total-input"/>    
                    </div>
                    <div className="total">
                        <span>Recibido</span>
                        <input type="text" onChange={ e=> setRecibido(e.target.value)} className="total-input" onFocus/>    
                    </div>    
                </div>
                <div className="input-cobrar">
                    <button className="btn btn-primary btn-cobrar" onClick={Transaccion.bind(this)}><AttachMoneyIcon/>Cobrar</button>
                </div>
                <div className="input-cobrar">
                    <button className="btn btn-primary btn-cobrar" onClick={handleShow}><PaymentIcon/>Tarjeta</button>
                </div>
                <div className="input-cobrar">
                    <button className="btn btn-primary btn-cobrar" onClick={LimpiarCarrito.bind(this)}><CleaningServicesIcon/>Limpiar</button>
                </div>
            </div>
            <Modal
        show={show}
        onHide={handleClose}
        backdrop="static"
        keyboard={false}
      >
        <Modal.Header>
          <Modal.Title>Muestra el QR al cliente</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <img src={imagebinary}/>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Cancelar
          </Button>
          <Button variant="primary" onClick={PagoTarjeta.bind(this)} >Aceptar Transacción </Button>
        </Modal.Footer>
      </Modal>
        </div>
    )
}
