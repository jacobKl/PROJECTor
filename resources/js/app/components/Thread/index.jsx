import "./styles.scss";
import React from 'react'
import { useForm, usePage } from "@inertiajs/react";

import Input from '../Input';
import Comment from "../Comment";

const Thread = () => {
    const { task, comments } = usePage().props;

    const { data, setData, post } = useForm({
        comment: ''
    });

    const handleSubmit = (e) => {
        e.preventDefault();

        post(`/tasks/${task.id}/comment/store`);
    };

    return (
        <div>
            {comments.map((single, ix) => <Comment single={single} key={ix} />)}

            <form className="thread-comment card" onSubmit={handleSubmit}>
                <Input type="textarea" value={data?.comment} isRequired={true} placeholder="Your comment" name="comment" onInput={e => setData('comment', e.target.value)} />
                <div>
                    <input className="btn btn-primary" type="submit" value="Comment" />
                </div>
            </form>
        </div>
    )
};

export default Thread;
