import React, {useEffect, useState} from 'react'
import '../../../styles.scss';
import axios from 'axios'
import PacmanLoader from "react-spinners/PacmanLoader";
import {Doughnut, Bar, PolarArea} from 'react-chartjs-2'

    var ingredientNot = ''
    var totalingredients = ''

    var complementos = []
    var cuentacomp = []

    var usuarios = []
    var cuenta = []

export default function Secondcards() {

    async function getProductsToday(){
        const {data} = await axios.get('http://localhost:5000/api/dashboard/doughnut')
        if(usuarios.length === 0 && cuenta.length === 0){
            data.map(item =>(
                usuarios.push(item.usuario),
                cuenta.push(item.count)
            ))
            }
    }

    async function getSalesComplement(){
        const {data} = await axios.get('http://localhost:5000/api/dashboard/complement')
        if(complementos.length === 0 && cuentacomp.length === 0){
            data.map(item =>(
                complementos.push(item.nombrecomplemento),
                cuentacomp.push(item.idcomplemento)
            ))
            }
    }

    async function getIngredientNot(){
        const {data} = await axios.get('http://localhost:5000/api/dashboard/ingredientnot')
        if (ingredientNot === ''){
            ingredientNot = data.count
        }
    }

    async function getTotalIngredients(){
        const {data} = await axios.get('http://localhost:5000/api/dashboard/ingredient')
        if (totalingredients === ''){
            totalingredients = data.count
        }
    }

    useEffect(() =>{
        getIngredientNot()
        getTotalIngredients()
        getSalesComplement()
        getProductsToday()
    }, [])

    const dataGraph1={
        labels: ['Ingredientes próximos a terminarse','Ingredientes estandar'],
        datasets:[{
            label: "Inventario de ingredientes",
            data: [ingredientNot,totalingredients-ingredientNot],
        }]
    }

    const dataGraph2={
        labels: complementos,
        datasets:[{
            label: "Complementos más utilizados",
            data: cuentacomp,
        }]
    }

    const dataDoughnut={
        labels: usuarios,
        datasets:[{
            label: "Productos vendidos en el día",
            data: cuenta,
        }]
    }

    const optionGraph1={
        maintainAspectRadio: false,
        responsive: true,
        plugins: {
            legend: {
                display: true,
                position: 'top'
            }
        }
    }

    const optionGraph2={
        maintainAspectRadio: false,
        responsive: true,
        plugins: {
            legend: {
                display: true,
                position: 'bottom'
            }
        }
    }

    const optionDoughnut={
        maintainAspectRadio: false,
        responsive: true,
        plugins: {
            legend: {
                display: true,
                position: 'bottom'
            },
            title: {
                display: true,
                position: 'top',
                text: 'Ventas de usuarios',
            }
        }
    }

    return (
        <div>
            <div className="dash-cards">
            <div className="card second-graph">
                <Bar data={dataGraph1} options={optionGraph1} />
                <Bar data={dataGraph2} options={optionGraph2} />
            </div>
            <div className="card second-graph">
                <div className="second-card-item">
                    <Doughnut data={dataDoughnut} options={optionDoughnut} />
                </div>
            </div>
      </div>
        </div>
    )
}
