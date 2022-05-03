<template>
  <v-container
    fluid
  >
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          アカウント編集
        </h1>
      </v-col>
      <v-card
        flat
        width="80%"
        max-width="320"
        color="transparent"
        justify="center"
      >
        <v-form>
          <v-text-field
            v-model="name"
            :counter="nameMax"
            :rules="nameRules"
            label="アカウント名"
            prepend-icon="mdi-account-circle"
            placeholder="表示されるアカウント名"
            outlined
          />
          <v-text-field
            v-model="favorite_beer"
            label="お気に入りのビール"
            prepend-icon="mdi-liquor"
            outlined
          />
          <v-textarea
            v-model="profile"
            :counter="profileMax"
            :rules="profileRules"
            label="自己紹介"
            prepend-icon="mdi-badge-account-horizontal-outline"
            placeholder="200文字以内で入力してください"
            outlined
          />
        </v-form>
        <v-card-actions>
          <v-btn
            rounded
            outlined
            block
            dark
            color="success"
            class="ml-2 font-weight-bold"
            @click="changeUserProfile"
          >
            プロフィール更新
          </v-btn>
        </v-card-actions>
        <!-- <v-form> -->
          <v-file-input
            v-model="editAvatar"
            label="アイコン画像"
            prepend-icon="mdi-image"
            placeholder="画像を選択してください"
            accept="image/*"
            @change="setAvatar"
          />
        <!-- </v-form> -->
        <v-card-actions>
          <v-btn
            rounded
            outlined
            block
            dark
            color="success"
            class="ml-2 font-weight-bold"
            @click="changeUserAvatar"
          >
            アイコン更新
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'loggedIn',
  async asyncData({ $axios, store }) {
    const currentUser = store.getters['auth/currentUser']
    const response = await $axios.$get(`/v1/users/${currentUser.id}`)
    return {
      name: response.name,
      favorite_beer: response.favorite_beer,
      profile: response.profile,
      userId: response.id
    }
  },
  data () {
    const nameMax = 12
    const profileMax = 200
    return {
      name: '',
      favorite_beer: '',
      profile: '',
      editAvatar: '',
      input_Avatar: null,
      nameMax,
      profileMax,
      nameRules: [
        v => !!v || '',
        v => (!!v && nameMax >= v.length) || `${nameMax}文字以内で入力してください`
      ],
      profileRules: [
        v => !!v || '',
        v => (!!v && profileMax >= v.length) || `${profileMax}文字以内で入力してください`
      ]
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    async changeUserProfile() {
      await this.$axios.$patch(`/v1/users/${this.$store.state.auth.currentUser.id}`, {
        user: {
          name: this.name,
          favorite_beer: this.favorite_beer,
          profile: this.profile,
        }
      })
      .then(() => {
        alert('プロフィール更新しました')
        this.$router.push('/auth/mypage')
      })
      .catch((error) => {
        alert(error.message)
      })
    },
    setAvatar(file){
      this.editAvatar = file
      if (file !== undefined && file !== null){
        if (file.name.lastIndexOf(".") <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener("load", () => {
          this.input_Avatar = fr.result
        })
      } else {
        this.input_Avatar = null
      }
    },
    async changeUserAvatar() {
      const formData = new FormData()
      formData.append('avatar', this.editAvatar)
      const config = {
        headers: {
          'content-type': 'multipart/form-data'
        }
      }
      await this.$axios.$patch(`/v1/users/${this.userId}/avatar_update`, formData, config)
        .then((response) => {
          this.avatar = response.avatar
          alert('アイコン画像更新しました')
          this.$router.push('/auth/mypage')
        })
        .catch((error) => {
          alert(error.message)
        })
    }
  }
}
</script>