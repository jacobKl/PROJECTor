import "./styles.scss"
import React from 'react'

const Select = ({ name, callback, options, label }) => {
    return (
        <div className="select">
            {label && (<label className="select__label">{label}</label>)}
            <select className="select__select" name={name} onChange={e => callback(e)}>
                {options.map(({value, textValue}) => (
                    <option key={value} value={value}>{textValue}</option>
                ))}
            </select>
        </div>
    );
}

export default Select;
