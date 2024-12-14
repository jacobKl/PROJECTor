import "./styles.scss";
import React from "react";

const Input = ({ label, name, value, onInput, isRequired, placeholder }) => {
    return (
        <div className="input">
            <label className="input-label">
                <span className="input-label-text">
                    {label}{" "}
                    {isRequired && <span className="input-asteriks">*</span>}
                </span>
                <input
                    className="input-input"
                    placeholder={placeholder}
                    name={name}
                    value={value}
                    onInput={onInput}
                />
            </label>
        </div>
    );
};

export default Input;
