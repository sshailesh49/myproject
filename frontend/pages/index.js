import { useState, useEffect } from 'react';

export default function Home() {
    const [message, setMessage] = useState('Loading...');

    useEffect(() => {
        fetch('http://localhost:8000/api/message')
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
