    import './Header.css'
import {Link, useLocation} from 'react-router-dom'
import {Button, Menu} from 'antd'
import Icon from '../../assets/icon.svg?react'
import Resetar from '../../assets/resetar.svg?react'
import Aluno from '../../assets/aluno.svg?react'
import Curso from '../../assets/curso.svg?react'
import Matricula from '../../assets/matricula.svg?react'

function Header({contadores, aoReinciar}) {
    const {pathname} = useLocation()
    const secaoAtual = pathname.split('/')[1]

    const itens = [
        {
            key: 'alunos',
            label: (
                <Link to={'/alunos'}>
                    <span className='item-menu'>
                        <Aluno className='icon-aluno'/>
                        Alunos
                        <span className='contador'>{contadores.alunos}</span>
                    </span>
                </Link>
            ),
        },
        {
            key: 'cursos',
            label: (
                <Link to={'/cursos'}>
                    <span className='item-menu'>
                        <Curso className='icon-curso'/>
                        Cursos
                        <span className='contador'>{contadores.cursos}</span>
                    </span>
                </Link>
            ),
        },
        {
            key: 'matriculas',
            label: (
                <Link to={'/matriculas'}>
                    <span className='item-menu'>
                        <Matricula className='icon-matricula'/>
                        Matrículas
                        <span className='contador'>{contadores.matriculas}</span>
                    </span>
                </Link>
            ),
        },
    ]

  return (
    <>
        <header className='cabecalho'>
            <div className='icone'>
                <Icon className='icon'/>
            </div>
            
            <div className='titulo'>
                <h1>DevSchool</h1>
            </div>

            {/* <Button
                className='reiniciar'
                ghost
                icon={<Resetar className='icon-reset' />}
                onClick={aoReinciar}
            >
                Reiniciar
            </Button> */}
        </header>

        <nav className='navbar'>
            <Menu
                mode='horizontal'
                items={itens}
                selectedKeys={[secaoAtual]}
            />
        </nav>
    </>
  )
}

export default Header;