import './Header.css'
import Icon from '../../assets/icon.svg?react'
import Resetar from '../../assets/resetar.svg?react'
import Aluno from '../../assets/aluno.svg?react'
import Curso from '../../assets/curso.svg?react'
import Matricula from '../../assets/matricula.svg?react'

function Header() {
    
    

  return (
    <>
        <header className='cabecalho'>
            <div className='icone'>
                <Icon className='icon'/>
            </div>
            
            <div className='titulo'>
                <h1>DevSchool</h1>
            </div>

            <button className='reiniciar'>
                Reiniciar Sistema
                <Resetar className='icon-reset'/>

            </button>
        </header>

        <nav className='navbar'>
            <button >
                <Aluno className='icon-aluno'/>
                <span>Alunos</span>
                <span className='contador'>4</span>
            </button>
            
            <button>
                <Curso className='icon-curso'/>
                <span>Cursos</span>
                <span className='contador'>3</span>
            </button>
            
            <button>
                <Matricula className='icon-matricula'/>
                <span>Matrículas</span>
                <span className='contador'>4</span>
            </button>
        </nav>
    </>
  )
}


export default Header;