export const state = () => ({
  user: {},
  data: {},
  users: {},
})

export const getters = {
  user(state) {
    return state.user
  },
  data(state) {
    return state.data
  },
  users(state) {
    return state.users
  },
}

export const actions = {
  setUser({ commit }, user) {
    commit('setUser', user)
  },
  setUsers({ commit, rootState }, users) {
    users.forEach((user) => {
      user.isFollowed = false
      if (rootState.user.data) {
        user.following.forEach((f) => {
          if (f.id === rootState.user.data.id) {
            user.isFollowed = true
          }
        })
      }
    })
  },
}

export const mutations = {
  setUser(state, user) {
    state.user = user
  },
  setData(state, payload) {
    state.data = payload
  },
}
