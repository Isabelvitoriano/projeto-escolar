import './Header.css'
import {Button, Menu} from 'antd'
import Icon from '../../assets/icon.svg?react'
import Resetar from '../../assets/resetar.svg?react'
import Aluno from '../../assets/aluno.svg?react'
import Curso from '../../assets/curso.svg?react'
import Matricula from '../../assets/matricula.svg?react'

function Header({paginaAtual, aoMudarPagina, contadores, aoReinciar}) {
    const itens = [
        {
            key: 'alunos',
            label: (
                <span className='item-menu'>
                    <Aluno className='icon-aluno'/>
                    Alunos
                    <span className='contador'>{contadores.alunos}</span>
                </span>
            ),
        },
        {
            key: 'cursos',
            label: (
                <span className='item-menu'>
                    <Curso className='icon-curso'/>
                    Cursos
                    <span className='contador'>{contadores.cursos}</span>
                </span>
            ),
        },
        {
            key: 'matriculas',
            label: (
                <span className='item-menu'>
                    <Matricula className='icon-matricula'/>
                    Matrículas
                    <span className='contador'>{contadores.matriculas}</span>
                </span>
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

            <Button
                className='reiniciar'
                ghost
                icon={<Resetar className='icon-reset' />}
                onClick={aoReinciar}
            >
                Reiniciar
            </Button>
        </header>

        <nav className='navbar'>
            <Menu
                mode='horizontal'
                items={itens}
                selectedKeys={[paginaAtual]}
                onClick={(evento) => aoMudarPagina(evento.key)}
            />
        </nav>
    </>
  )
}

export default Header;