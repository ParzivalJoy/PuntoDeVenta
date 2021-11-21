from flask import Blueprint
from flask import Flask,request, jsonify, send_from_directory #pip install Flask
import psycopg2
from psycopg2.extras import RealDictCursor
from flask_cors import CORS #pip install flask-cors
import os
from random import SystemRandom
from werkzeug.utils import secure_filename

ventas_api = Blueprint('ventas_api', __name__)

def conexion():
    return psycopg2.connect(
    host="localhost",
    database="puntodeventa",
    user="postgres",
    password="root")

def conexionRol(role):
    return psycopg2.connect(
    host="localhost",
    database="puntodeventa",
    user=role,
    password="root")
## ------------------------------------------------------------------------------ ##
## -----------------------Catalogo de productos y filtros------------------------ ##
## ------------------------------------------------------------------------------ ##

@ventas_api.route('/api/sales/products/<rol>',  methods=['GET'])
def getAllProducts(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto, imagebproducto FROM productos")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/price1/<rol>',  methods=['GET'])
def getProductsByPrice1(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto FROM productos WHERE precioproducto <= 50")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/price2/<rol>',  methods=['GET'])
def getProductsByPrice2(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto FROM productos WHERE precioproducto > 50 AND precioproducto <= 500")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/price3/<rol>',  methods=['GET'])
def getProductsByPrice3(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto FROM productos WHERE precioproducto > 500")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/category/<idcategoria>/<rol>',  methods=['GET'])
def getProductsByCategory(idcategoria, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ('''SELECT idproducto, nombreproducto, precioproducto, descripcionproducto, nombrecategoria FROM productos 
            INNER JOIN categorias ON productos.idcategoria = {0} AND categorias.idcategoria = productos.idcategoria'''.format(idcategoria))
    cur.execute(sql, idcategoria)
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/name/<search>/<rol>',  methods=['GET'])
def getProductByName(search, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto FROM productos WHERE nombreproducto = '{0}'".format(search))
    cur.execute(sql, search)
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/products/id/<search>/<rol>',  methods=['GET'])
def getProductById(search, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto FROM productos WHERE idproducto = '{0}'".format(search))
    cur.execute(sql, search)
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/getproducts/<id>/<rol>',  methods=['GET'])
def getProduct(id, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ("SELECT idproducto, nombreproducto, precioproducto, descripcionproducto, imagebproducto FROM productos WHERE idproducto = '{0}'".format(id))
    cur.execute(sql, id)
    rows = cur.fetchone()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/categories/<rol>',  methods=['GET'])
def getCategories(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idcategoria, nombrecategoria FROM categorias ORDER BY idcategoria")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)
   
@ventas_api.route('/api/complements/<id>/<rol>',  methods=['GET'])
def getListComplements(id, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idcomplemento, nombrecomplemento, preciocomplemento, descripcioncomplemento FROM complementos WHERE idproducto = '{0}'".format(id))
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/modifiers/<id>/<rol>',  methods=['GET'])
def getListModifiers(id, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute('''SELECT modificadores.idmodificador, nombremodificador, preciomodificador, obligatorio FROM modificadores INNER JOIN productosmodificadores 
                ON productosmodificadores.idproducto = '{0}' AND modificadores.idmodificador = productosmodificadores.idmodificador '''.format(id))
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/options/<idmodificador>/<rol>',  methods=['GET'])
def getListOptions(idmodificador, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute('''SELECT opciones.idopcionmodificador, idmodificador, nombreopcion, precioopcionmodificador, idingrediente, opcionporcion FROM opciones JOIN modificadoresopciones
                ON modificadoresopciones.idmodificador = {0} AND opciones.idopcionmodificador = modificadoresopciones.idopcionmodificador'''.format(idmodificador))
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/categories/<idcategoria>/<rol>',  methods=['GET'])
def getProducts(idcategoria, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql="SELECT idproducto, nombreproducto, descripcionproducto, precioproducto, idcategoria FROM productos WHERE idcategoria = {0}".format(idcategoria)
    cur.execute(sql, idcategoria) 
    row = cur.fetchall()
    conn.close()
    return jsonify(row)
## ------------------------------------------------------------------------------ ##
## -----------Verificacion de Cantidades de productos e Ingredientes ------------ ##
## ------------------------------------------------------------------------------ ##

@ventas_api.route('/sales/verification/<id>/<rol>',  methods=['GET'])
def verifyCantProduct(id, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql="SELECT cantidadproducto FROM productos WHERE idproducto = '{0}'".format(id)
    cur.execute(sql, id) 
    row = cur.fetchone()
    conn.close()
    return jsonify(row)

@ventas_api.route('/api/sales/verification/complement/<id>/<rol>',  methods=['GET'])
def updateComplemento(id, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql="SELECT idproductooriginal FROM complementos WHERE idcomplemento = '{0}'".format(id)
    cur.execute(sql, id) 
    row = cur.fetchone()
    conn.close()
    return jsonify(row)

@ventas_api.route('/api/sales/verification/ingredient/portion/<idproducto>/<rol>',  methods=['GET'])
def getPortion(idproducto, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql="SELECT porcion FROM productosingredientes WHERE idproducto = '{0}'".format(idproducto)
    cur.execute(sql, idproducto) 
    row = cur.fetchall()
    conn.close()
    return jsonify(row)

## ------------------------------------------------------------------------------ ##
## ----------Verificacion de productos simples o productos compuestos------------ ##
## ------------------------------------------------------------------------------ ##

@ventas_api.route('/api/sales/verification/products/complements/<search>/<rol>',  methods=['GET'])
def verifyProductComplement(search, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ("SELECT idcomplemento FROM complementos WHERE idproducto = '{0}'".format(search))
    cur.execute(sql, search)
    rows = cur.fetchone()
    conn.close()
    return jsonify(rows)

@ventas_api.route('/api/sales/verification/products/modifiers/<search>/<rol>',  methods=['GET'])
def verifyProductModifier(search, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql = ("SELECT idmodificador FROM productosmodificadores WHERE idproducto = '{0}'".format(search))
    cur.execute(sql, search)
    rows = cur.fetchone()
    conn.close()
    return jsonify(rows)

## ------------------------------------------------------------------------------ ##
## ----------- Cambios en las cantidades de productos e ingredientes------------- ##
## ------------------------------------------------------------------------------ ##

@ventas_api.route('/api/sales/updateproduct', methods=['PUT'])
def updateProducts():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = "UPDATE productos SET cantidadproducto = cantidadproducto - {0} WHERE idproducto='{1}'".format(data['cantidad'], data['idproducto'])
    cur.execute(sql, data) 
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg="employee updated")

@ventas_api.route('/api/sales/updateingredient', methods=['PUT'])
def updateIngredients():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = """update ingredientes set cantidadingrediente = cantidadingrediente - {0} from productosingredientes
            where productosingredientes.idproducto = '{1}' and ingredientes.idingrediente = productosingredientes.idingrediente""".format(data['porcion'], data['idproducto'])
    cur.execute(sql, data) 
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg="ingredient updated")

@ventas_api.route('/api/sales/modifier/updateingredient', methods=['PUT'])
def updateModifierIngredients():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = "UPDATE ingredientes SET cantidadingrediente = cantidadingrediente - {0} WHERE idingrediente = '{1}'"-format(data['porcion'], data['idingrediente'])
    cur.execute(sql, data) 
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg="ingredient updated")


## ------------------------------------------------------------------------------ ##
## ------------------Inserciones en las tablas de ventas------------------------- ##
## ------------------------------------------------------------------------------ ##

@ventas_api.route('/api/sales/venta', methods=['POST'])
def addSale():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = """INSERT INTO ventas (idusuario, idcliente, idpago, totalventa, fechaventa, horaventa )
             VALUES (%(idusuario)s,%(idcliente)s, %(idpago)s, %(totalventa)s, %(fechaventa)s, %(horaventa)s)"""
    cur.execute(sql, data)
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg='added successfully!')

@ventas_api.route('/api/sales/addsaleproduct', methods=['POST'])
def addSaleProduct():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = """INSERT INTO ventasproducto (idusuario, idproducto, cantidad, nombreproducto, notas, subtotal, totalproductos )
             VALUES (%(idusuario)s,%(idproducto)s, %(cantidad)s, %(nombre)s, %(nota)s, %(precio)s, %(total)s)"""
    cur.execute(sql, data)
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg='added successfully!')

@ventas_api.route('/api/sales/addsalecomplement', methods=['POST'])
def addSaleComplement():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = """INSERT INTO ventascomplemento (idusuario, idcomplemento, nombrecomplemento, cantidad, subtotal, totalcomplemento )
             VALUES (%(idusuario)s,%(idcomplemento)s, %(nombre)s, %(cantidad)s, %(precio)s, %(total)s)"""
    cur.execute(sql, data)
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg='added successfully!')

@ventas_api.route('/api/sales/addsalemodifier', methods=['POST'])
def addSaleModifier():
    data = request.json
    conn = conexionRol(data['rol'])
    cur = conn.cursor()
    sql = """INSERT INTO ventasmodificadores (idusuario, idmodificador, idopcionmodificador, nombremodificador, nombreopcion, subtotal, totalmodificador )
             VALUES (%(idusuario)s,%(idmod)s, %(idop)s, %(nombremod)s, %(nombreop)s, %(precio)s, %(precio)s)"""
    cur.execute(sql, data)
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg='added successfully!')