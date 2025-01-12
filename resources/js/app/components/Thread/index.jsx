import "./styles.scss";
import React, { useRef } from "react";
import { useForm, usePage } from "@inertiajs/react";

import Input from "../Input";
import Comment from "../Comment";
import { useProjectPermission } from "../../hooks/useProjectPermission";

const Thread = () => {
    const { task, comments } = usePage().props;
    const { admin, fullAccess, readOnly } = useProjectPermission();
    const form = useRef();
    const { data, setData, post } = useForm({
        comment: "",
    });

    const handleSubmit = (e) => {
        e.preventDefault();

        post(`/tasks/${task.id}/comment/store`);
        form.current.reset();
        setData('comment', '');
    };

    return (
        <div>
            {comments.map((single, ix) => (
                <Comment single={single} key={ix} />
            ))}

            {admin || fullAccess ? (
                <form className="thread-comment card" onSubmit={handleSubmit} ref={form}>
                    <Input
                        type="textarea"
                        value={data?.comment}
                        isRequired={true}
                        placeholder="Your comment"
                        name="comment"
                        onInput={(e) => setData("comment", e.target.value)}
                    />
                    <div>
                        <input
                            className="btn btn-primary"
                            type="submit"
                            value="Comment"
                        />
                    </div>
                </form>
            ) : null}
        </div>
    );
};

export default Thread;
