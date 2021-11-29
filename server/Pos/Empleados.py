from flask import Blueprint
from flask import Flask,request, jsonify, send_from_directory #pip install Flask
import psycopg2
from psycopg2.extras import RealDictCursor
from flask_cors import CORS #pip install flask-cors
import os
from random import SystemRandom
from werkzeug.utils import secure_filename

empleado_api = Blueprint('empleado_api', __name__)

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
## -----------------Lista de empleados registrados en el sistema----------------- ##
## ------------------------------------------------------------------------------ ##

@empleado_api.route('/api/<rol>',  methods=['GET'])
def index(rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute("SELECT idempleado, nombreempleado, to_char(fechacontra, 'DD/MM/YYYY') as fechacontra, dirempleado, telempleado, emailempleado FROM empleados ORDER BY idempleado")
    rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@empleado_api.route('/api/<idempleado>/<rol>',  methods=['GET'])
def getEmployee(idempleado, rol):
    conn = conexionRol(rol)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    sql="SELECT nombreempleado, dirempleado, telempleado, emailempleado FROM empleados  WHERE idempleado = {0}".format(idempleado)
    cur.execute(sql, idempleado) 
    row = cur.fetchone()
    conn.close()
    return jsonify(row)

@empleado_api.route('/api/<rol>', methods=['POST'])
def saveEmployee(rol):
    data = request.json
    #Hace conexion del rol
    conn = conexionRol(rol)
    cur = conn.cursor()
    #Inserta en la tabla empleados 
    sql = """INSERT INTO empleados (nombreempleado, fechacontra, dirempleado,telempleado, emailempleado, idcargo )
                VALUES (%(nombreempleado)s,%(fechacontra)s, %(dirempleado)s, %(telempleado)s, %(emailempleado)s,2)"""
    cur.execute(sql, data) 
    #Genera contraseña
    longitud = 8
    valores = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    cryptogen = SystemRandom()
    contrasena = ""
    while longitud > 0:
        contrasena = contrasena + cryptogen.choice(valores)
        longitud = longitud - 1
    #Inserta en la tabla usuarios
    sql2 = "INSERT INTO usuarios (usuario, contrasena, estado, fechaalta, fechavigencia) VALUES ('{0}','{1}','true','{2}','{3}') RETURNING idusuario".format(data['emailempleado'],contrasena,data['fechacontra'],data['fechavigencia'])
    cur.execute(sql2)
    idusuario= cur.fetchone()
    #Inserta permisos
    for i in range(8):
        if( i+1!=1 and i+1!=3 and i+1!=7):
            sql3 = "INSERT INTO permisosusuarios (idpermiso, idusuario, acceso) VALUES ({0},{1},'{2}')".format(i+1,idusuario[0],'t')
            cur.execute(sql3)
        else:
            sql3 = "INSERT INTO permisosusuarios (idpermiso, idusuario, acceso) VALUES ({0},{1},'{2}')".format(i+1,idusuario[0],'f')
            cur.execute(sql3)
    conn.commit()
    conn.close()
    cur.close()
    #Abre conexion publica
    conn = conexionRol('postgres')
    cur =conn.cursor(cursor_factory=RealDictCursor)
    #Selecciona el rol
    sql4="SELECT idempresa FROM empresas WHERE nombreempresa= '{0}'".format(rol)
    cur.execute(sql4)
    idempresa= cur.fetchone()
    print(idempresa)
    conn.close()
    #Inserta en el esquema publico en la tabla usuarios generales
    insertusuario(data['emailempleado'],contrasena,idempresa['idempresa'])
    return jsonify(msg='added successfully!')

@empleado_api.route('/api/<idempleado>/<rol>', methods=['DELETE'])
def deleteEmployee(idempleado, rol):
    conn = conexionRol(rol)
    cur = conn.cursor()
    sql = "DELETE FROM empleados WHERE idempleado = {0}".format(idempleado)
    cur.execute(sql, idempleado) 
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg="employee eliminated") 

@empleado_api.route('/api/<rol>', methods=['PUT'])
def updateEmployee(rol):
    data = request.json
    conn = conexionRol(rol)
    cur = conn.cursor()
    sql = "UPDATE empleados SET nombreempleado=%(nombreempleado)s, dirempleado=%(dirempleado)s,telempleado=%(telempleado)s, emailempleado=%(emailempleado)s WHERE idempleado=%(idempleado)s"
    cur.execute(sql,data) 
    conn.commit()
    conn.close()
    cur.close()
    return jsonify(msg="employee updated") 

def insertusuario(usuario,contrasena,rol):
    conn = conexion()
    cur = conn.cursor()
    sql = "INSERT INTO usuariosgenerales (usuariogeneral, contrasenausuariogeneral, idempresa) VALUES ('{0}','{1}','{2}') RETURNING idusuariogeneral".format(usuario,contrasena,rol)
    cur.execute(sql)
    conn.commit()
    conn.close()
    cur.close()