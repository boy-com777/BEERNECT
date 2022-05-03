export const state = () => ({
  loggedIn: false,
  currentUser: null,
  styles: {
    beforeLogin: {
      appBarHeight: 56,
    },
    isLoggedIn: {
      appBarHeight: 56,
    },
  },
})

export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  },
  setLoginState(state, payload) {
    state.loggedIn = payload
  },
}

export const actions = {
  setUser(context, data) {
    context.commit('setUser', data)
  },
  setLoginState(context, data) {
    context.commit('setLoginState', data)
  },
}

export const getters = {
  currentUser(state) {
    return state.currentUser
  },
}
