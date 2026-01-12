import { useState, useEffect } from 'react';

export default function Home() {
    const [message, setMessage] = useState('Loading...');

    useEffect(() => {
        fetch('/api/message')
            .then((res) => res.json())
            .then((data) => setMessage(data.message))
            .catch((err) => setMessage('Error connecting to backend'));
    }, []);

    return (
        <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
            <h1>DevOps Assignment Frontend</h1>
            <p>Backend Status: <strong>{message}</strong></p>
        </div>
    );
}
