import React  from 'react'
import ImageSearchIcon from '@mui/icons-material/ImageSearch';
import Tema from './Components/Tema';
import RolesSeguridad from './Components/RolesSeguridad';


export default function Config() {
    return (
        <div className="configuration">
            <div className="theme-container">
                <Tema />
                <RolesSeguridad />
            </div>
        </div>
    )
}
