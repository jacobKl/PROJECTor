import "./styles.scss"
import React from 'react'

const Select = ({ name, callback, options, label, selected, error }) => {
    return (
        <div className="select">
            {label && (<label className="select__label">{label}</label>)}
            <select className="select__select" name={name} onChange={e => callback(e)}>
                <option>---</option>
                {options.map(({value, textValue}) => (
                    <option selected={value === selected} key={value} value={value}>{textValue}</option>
                ))}
                {error && (<span className="select-error">{error}</span>)}
            </select>
        </div>
    );
}

export default Select;
