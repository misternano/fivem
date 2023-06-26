window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'speed' && data.displayWindow == 'true') {
        $(".container").css('display', 'block');
        $("#speedlimit-output").text(data.speed);
    } else {
        $(".container").css('display', 'none');
    }
})