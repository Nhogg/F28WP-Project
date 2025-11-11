import { useState, useEffect } from 'react'
import { api } from './utils/api'
import './App.css'

function App() {
  const [message, setMessage] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    // Test backend connection
    const fetchData = async () => {
      try {
        const response = await api.get('/')
        setMessage(response.data.message || 'Connected to backend!')
        setLoading(false)
      } catch (err) {
        setError(err.message)
        setLoading(false)
      }
    }

    fetchData()
  }, [])

  return (
    <div className="App">
      
    </div>
  )
}

export default App
