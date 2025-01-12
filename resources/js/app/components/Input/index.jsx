import "./styles.scss";
import React from "react";

const Input = ({
    label,
    name,
    value,
    onInput,
    isRequired,
    placeholder,
    error,
    type = "text",
    rows = 4
}) => {
    return (
        <div className="input">
            <label className="input-label">
                {label && (<span className="input-label-text">
                    {label}{" "}
                    {isRequired && <span className="input-asteriks">*</span>}
                </span>)}
                {type === "textarea" ? (
                    <textarea
                        className="input-input"
                        placeholder={placeholder}
                        name={name}
                        onInput={onInput}
                        rows={rows}
                        defaultValue={value}
                        required={isRequired}
                    ></textarea>
                ) : (
                    <input
                        className="input-input"
                        placeholder={placeholder}
                        name={name}
                        value={value}
                        onInput={onInput}
                        type={type}
                        required={isRequired}
                    />
                )}
                {error && (<span className="input-error">{error}</span>)}
            </label>
        </div>
    );
};

export default Input;
