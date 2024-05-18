open ReactNative
open Style

let styles = StyleSheet.create({
  "container": viewStyle(~alignItems=#center, ~justifyContent=#center, ~flex=1.0, ()),
  "lightBackground": viewStyle(~backgroundColor="white", ()),
  "darkBackground": viewStyle(~backgroundColor="black", ()),
  "whiteText": textStyle(~color="white", ()),
  "blackText": textStyle(~color="black", ()),
})

let useIsDarkMode = () => {
  switch Appearance.useColorScheme()->Belt.Option.getWithDefault(#light) {
  | #dark => true
  | #light => false
  }
}

@react.component
let app = () => {
  let isDarkMode = useIsDarkMode()
  <SafeAreaView
    style={array([
      {styles["container"]},
      {isDarkMode ? styles["darkBackground"] : styles["lightBackground"]},
    ])}>
    <Text style={isDarkMode ? styles["whiteText"] : styles["blackText"]}>
      {"Hello World!!"->React.string}
    </Text>
  </SafeAreaView>
}
