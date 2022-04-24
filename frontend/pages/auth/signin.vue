<template>
  <v-container fluid>
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          メールアドレスでログインする
        </h1>
      </v-col>
        <v-card
          flat
          width="80%"
          max-width="320"
          color="transparent"
          justify="center"
        >
        <v-form
          v-model="isValid"
        >
          <v-text-field
            v-model="email"
            label="メールアドレス"
            prepend-icon="mdi-email"
            outlined
          />
          <v-text-field
            v-model="password"
            :type="showPassword ? 'text' : 'password'"
            label="パスワード"
            prepend-icon="mdi-lock"
            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
            outlined
            @click:append="showPassword = !showPassword"
          />
          <v-btn
            :disabled="!isValid"
            rounded
            dark
            outlined
            block
            color="myblue"
            class="white--text"
            @click="signIn"
          >
            ログイン
          </v-btn>
          <v-card-actions>
            <nuxt-link
              to="/auth/reset"
              class="body-2 text-decoration-none"
            >
              パスワードをお忘れの方はこちら
            </nuxt-link>
          </v-card-actions>
          <v-card-actions>
            <nuxt-link
              to="/auth/signup"
              class="body-2 text-decoration-none"
            >
              アカウントをお持ちでない方はこちら
            </nuxt-link>
          </v-card-actions>
        </v-form>
        <p v-if="error" class="errors">{{ error }}</p>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import firebase from '~/plugins/firebase'
export default {
  layout: 'beforeLogin',
  data () {
    return {
      isValid: false,
      noValidation: false,
      showPassword: false,
      email: '',
      password: '',
      error: null,
    }
  },
  methods: {
    async signIn () {
      this.error = null
      await firebase.auth().signInWithEmailAndPassword(this.email, this.password)
      .catch((error) => {
        switch(error.code) {
          case 'auth/user-not-found':
            this.error = 'メールアドレスが間違っています'
            return
          case 'auth/wrong-password':
            this.error = 'パスワードが正しくありません'
            return
          default:
            this.error = 'メールアドレスとパスワードをご確認ください'
        }
      })
      if (this.error === null) {
        this.$router.push('/auth/mypage')
      }
    }
  }
}
</script>