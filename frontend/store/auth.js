export const state = () => ({
  loggedIn: false,
  currentUser: {},
  data: {},
  users: {},
  styles: {
    beforeLogin: {
      appBarHeight: 56,
    },
    isLoggedIn: {
      appBarHeight: 56,
    },
    myPage: {
      appBarHeight: 80,
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
  setData(state, payload) {
    state.data = payload
  },
}

export const actions = {
  setUser(context, data) {
    context.commit('setUser', data)
  },
  setLoginState(context, data) {
    context.commit('setLoginState', data)
  },
  setUsers({ commit, rootState }, users) {
    users.forEach((currentUser) => {
      currentUser.isFollowed = false
      if (rootState.auth.datas) {
        currentUser.following.forEach((f) => {
          if (f.id === rootState.auth.datas.id) {
            currentUser.isFollowed = true
          }
        })
      }
    })
  },
}

export const getters = {
  currentUser(state) {
    return state.currentUser
  },
  data(state) {
    return state.data
  },
  users(state) {
    return state.users
  },
  loggedIn(state) {
    return state.loggedIn
  },
}
