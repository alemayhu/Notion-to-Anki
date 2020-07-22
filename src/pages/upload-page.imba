import '../components/page-content'
import '../components/n2a-button'
import '../components/progress-bar'

tag upload-page

	prop state = 'ready'
	prop progress = 0
	prop fontSize = 20
	
	def isDebug
		window.location.hostname == 'localhost'

	def actionUrl
		let baseUrl = isDebug() ? "http://localhost:2020" : "https://notion.2anki.com"
		"{baseUrl}/f/upload"

	def render
		<self[d: inline-block]> <page-content>
			<form[d: flex fld: column jc: start ai: center h: 100%] enctype="multipart/form-data" method="post" action=actionUrl()>
				<input[w: 90% min-height: 48px bdb: 1.5px solid grey fs: 2xl fw: bold c: #83C9F5 @placeholder: grey] placeholder="Enter deck name (optional)" name="deckName" type="text">
				<input[m: 10 p: 10 bd: 4px dashed gray600 fs: 2xl] type="file" name="pkg" accept=".zip,.html,.md" required>
				<button[fs: 4xl fw: bold c: white br: 0.25rem px: 8 py: 2 bg: #83C9F5]  type="submit"> "Convert"
