import './Header.css'
import Icon from '../../assets/icon.svg'
import Resetar from '../../assets/resetar.svg'

function Header() {

  return (
    <>
        <header className='cabecalho'>
            <div className='icone'>
                <img src={Icon} alt="icone de escola" />
            </div>
            
            <div className='titulo'>
                <h1>DevSchool</h1>
                <span>Sistema de Gerenciamento</span>
            </div>

            <button type={Reiniciar}>
                Reiniciar Sistema
                <img src={Resetar} alt="Reinciar o sistema" />
            </button>
        </header>
    </>
  )
}

function Reiniciar() {

}

export default Header;