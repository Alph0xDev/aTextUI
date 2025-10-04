window.addEventListener('message', function(event) {
    const textui = document.getElementById('textui');
    const sound = document.getElementById('textui-sound');
    if (event.data.action === 'show') {
        document.getElementById('textui-message').textContent = event.data.text || '';
        document.getElementById('textui-key').textContent = event.data.key || 'E';
        textui.classList.remove('green', 'blue', 'red', 'yellow', 'orange', 'purple');
        if (event.data.style) textui.classList.add(event.data.style);
        setTextUIPosition(event.data.position || "left");
        if (textui.classList.contains('hidden') && sound) {
            sound.currentTime = 0;
            sound.play();
            sound.volume = 0.6;
        }
        textui.classList.remove('hidden');
    }
    if (event.data.action === 'hide') {
        textui.classList.add('hidden');
    }
});

function setTextUIPosition(pos) {
    const textui = document.getElementById('textui');
    textui.classList.remove(
        "position-center", "position-left", "position-right",
        "position-top", "position-bottom",
        "position-top-left", "position-top-right",
        "position-bottom-left", "position-bottom-right"
    );
    textui.classList.add("position-" + (pos || "left"));
}
