import firebase from '@/plugins/firebase'
import axios from '@/plugins/axios'

const authCheck = ({ store }) => {
  firebase.auth().onAuthStateChanged(async (user) => {
    if (user) {
      const { data } = await axios.get('/v1/users', {
        params: {
          uid: user.uid,
        },
      })
      store.dispatch('auth/setUser', data)
      store.dispatch('auth/setLoginState', true)
    } else {
      store.dispatch('auth/setUser', null)
      store.dispatch('auth/setLoginState', false)
    }
  })
}

export default authCheck
