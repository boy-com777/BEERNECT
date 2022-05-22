export const state = () => ({
  users: {},
  data: {},
})

export const getters = {
  users(state) {
    return state.users
  },
  data(state) {
    return state.data
  },
}

export const mutations = {
  setUsers(state, users) {
    state.users = users
  },
  setData(state, auth) {
    state.data = auth
  },
}

export const actions = {
  setData({ commit, rootState }, auth) {
    auth.isFollowed = false
    if (rootState.auth.data) {
      auth.followers.forEach((f) => {
        if (f.id === rootState.auth.data.id) {
          auth.isFollowed = true
        }
      })
    }
    commit('setData', auth)
  },
}
