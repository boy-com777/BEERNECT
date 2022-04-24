<template>
  <mapOfJapan />
</template>

<script>
import mapOfJapan from '~/assets/images/map/map-mobile.svg?inline'
export default {
  components: {
    mapOfJapan
  },
  async mounted() {

    const response = await fetch( mapOfJapan )

    if ( response.ok ) {

      const prefs = document.querySelectorAll( '.geolonia-svg-map .prefecture' )

      prefs.forEach( ( pref ) => {
        pref.addEventListener( 'mouseover', ( event ) => {
          event.currentTarget.style.fill = "#FFA500"
        })

        pref.addEventListener( 'mouseleave', ( event ) => {
          event.currentTarget.style.fill = ""
        })

        pref.addEventListener( 'click', ( event ) => {
          location.href = `/locals/${event.currentTarget.dataset.name}`
        })
      })
    }
  }
}
</script>

<style lang="scss">
.geolonia-svg-map
{
  width: 100%;
  max-height: 690px;
}
.geolonia-svg-map .prefecture
{
  fill: #f7f7f7;
  stroke: #666666;
  cursor: pointer;
}
.geolonia-svg-map .boundary-line
{
  stroke: #999999;
}
</style>