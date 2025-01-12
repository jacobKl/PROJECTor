import "./styles.scss";
import React from 'react';
import UserIcon from '../UserIcon';

const Comment = ({single}) => {
    return (
        <div className="card comment">
            <div className="comment-row">
                <UserIcon />
                <p>{single?.user?.name}</p>
            </div>
            <span className="comment-date">{single?.created_at}</span>

            <p className="comment-comment">
                {single?.comment}
            </p>
        </div>
    );
}

export default Comment;
