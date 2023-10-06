const boxes = Array.from(document.querySelectorAll('div[id^="q-"]'));
boxes.forEach((box, index) => {
    const boxIdParts = box.id.split('-');
    const radioName = boxIdParts[1] + boxIdParts[2];
    const radioButtons = Array.from(box.querySelectorAll(`input[name="${radioName}"]`));

    radioButtons.forEach((radioButton) => {
        radioButton.addEventListener('change', () => {

            if (index < boxes.length - 1) {
                boxes[index + 1].style.display = 'block';
            }
        });
    });
});

boxes[0].style.display = 'block';
