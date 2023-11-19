$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
	
	    window.addEventListener('message2', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display2(true)
            } else {
                display2(false)
            }
        }
    })
	
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://TicketPrinter/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://TicketPrinter/exit', JSON.stringify({}));
        return
    })
	
	
    // Add JavaScript to handle form submission
    $("#submitButton").click(function () {
        const userInput1 = document.getElementById("textbox1").value;
          const userInput2 = Array.from(document.getElementById("reasonDropdown").selectedOptions)
        .map(option => option.value)
        .join(', '); // Concatenate selected items with commas
        const userInput3 = document.getElementById("textbox3").value;
        const userInput4 = document.getElementById("textbox4").value; // Citation Date
        const userInput5 = document.getElementById("textbox5").value;
        const userInput6 = document.getElementById("textbox6").value;

        $.post('https://TicketPrinter/submitData', JSON.stringify({
            officer: userInput1,
            reason: userInput2,
            fine: userInput3,
            date: userInput4,
            vehicleType: userInput5,
            vehiclePlate: userInput6
        }));
    });




    //when the user clicks on the submit button, it will run
    $("#submit").click(function () {
        let inputValue = $("#input").val()
        if (inputValue.length >= 100) {
            $.post("http://nui2/error", JSON.stringify({
                error: "Input was greater than 100"
            }))
            return
        } else if (!inputValue) {
            $.post("http://nui2/error", JSON.stringify({
                error: "There was no value in the input field"
            }))
            return
        }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post('http://nui2/main', JSON.stringify({
            text: inputValue,
        }));
        return;
    })
})


document.addEventListener('DOMContentLoaded', function () {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const formattedDate = `${year}/${month}/${day}`;

    document.getElementById('textbox4').value = formattedDate;

    const customSelect = document.getElementById('customSelect');
    const selectedOption = document.getElementById('selectedOption');
    const optionsList = document.getElementById('optionsList');

    optionsData.forEach(option => {
        const optionElement = document.createElement('li');
        optionElement.textContent = option.label;
        optionElement.addEventListener('click', function () {
            selectedOption.textContent = option.label;
            optionsList.style.display = 'none';
        });
        optionsList.appendChild(optionElement);
    });

    selectedOption.addEventListener('click', function () {
        optionsList.style.display = optionsList.style.display === 'none' ? 'block' : 'none';
    });

    document.addEventListener('click', function (event) {
        if (!customSelect.contains(event.target)) {
            optionsList.style.display = 'none';
        }
    });
});



document.addEventListener('message', function(event) {
    var messageData = event.data;

    if (messageData && messageData.action === 'updateTextboxes') {
        console.log("Received NUI message:", messageData);
        updateTextboxes(messageData.data);
    }
});

function updateTextboxes(data) {
    console.log("Updating textboxes with data:", data);

    document.getElementById("myTextbox").innerHTML = data.myTextbox || "";
    document.getElementById("myTextbox2").innerHTML = data.myTextbox2 || "";
    document.getElementById("myTextbox3").innerHTML = data.myTextbox3 || "";
    document.getElementById("myTextbox4").innerHTML = data.myTextbox4 || "";
    document.getElementById("myTextbox5").innerHTML = data.myTextbox5 || "";
    document.getElementById("myTextbox6").innerHTML = data.myTextbox6 || "";
}



window.addEventListener("message", function (event) {
    if (event.data.type !== "PlaySound") return;

    if (!event.data?.audioFile) {
        console.error("Need event information: audioFile");
        return null;
    }

    let id = Audios.length;
    let url = event.data.audioFile;

    let volume = event.data?.volume;

    playAudio(id, url, volume);
});

// index.js
window.addEventListener("message", function (event) {
    if (event.data.type === "playSound") {
        playAudio(event.data.audioFile, event.data.volume);
    }
});

function playAudio(audioFile, volume) {
    let audio = new Audio(audioFile);
    audio.volume = volume;
    audio.play();
}


