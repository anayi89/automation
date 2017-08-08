document.onreadystatechange = () => {
  if (document.readyState === 'complete') {
    // equivalent to jQuery's $(document).ready function
	function playSound(e) {
		const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
		const key = document.querySelector(`.key[data-key="${e.keyCode}"]`);
		
		if(!audio)
			return;
		// stops the function from running
		
		audio.currentTime = 0;
		// rewinds the audio to the beginning of the clip
		
		audio.play();
		key.classList.add('playing');
		// equivalent to jQuery's addClass() method
	}

	function removeTransition(e) {
		if(e.propertyName !== 'transform')
			return;
			// skips it if it is not a transformation
			this.classList.remove('playing');
			// equivalent to jQuery's removeClass() method
	}
	const keys = document.querySelectorAll('.key');
	keys.forEach(key => key.addEventListener('transitionend', removeTransition));
	
	window.addEventListener('keydown', playSound);
  }
};