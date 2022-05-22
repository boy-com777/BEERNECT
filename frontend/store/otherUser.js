export const state = () => ({
  user: {},
  data: {},
})

export const getters = {
  user: (state) => state.user,
  data(state) {
    return state.data
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

export const actions = {
  async getUser({ commit }, paramsId) {
    await this.$axios
      .$get(`/v1/users/${paramsId}`)
      .then((res) => {
        // eslint-disable-next-line no-console
        console.log(res.data)
        commit('setUser', res.data)
      })
      .catch((err) => {
        // eslint-disable-next-line no-console
        console.log(err)
        return err
      })
  },
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
