// Get references to the buttons and hidden divs
var showButtons = document.querySelectorAll(".showButton");
var hiddenDivs = document.querySelectorAll(".popup");
var closeButtons = document.querySelectorAll(".closeButton");

// Add a click event listener to each button
showButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        // Get the target ID from the "data-target" attribute of the button
        var targetId = button.getAttribute("data-target");

        // Find the corresponding hidden div by its ID
        var targetDiv = document.getElementById(targetId);

        // Check if the targetDiv is currently hidden
        targetDiv.classList.toggle("active");
    });
});

closeButtons.forEach(function (closeButton) {
    closeButton.addEventListener("click", function () {
        var targetId = closeButton.getAttribute("data-target");

        // Find the corresponding hidden div by its ID
        var targetDiv = document.getElementById(targetId);
        targetDiv.classList.remove("active");
    });
});
