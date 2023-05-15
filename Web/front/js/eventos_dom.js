// wait until the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    // 1 ----------------------------------------------------------------------------------------------
    // Get the reference to the <p> element
    const mousePositionElement = document.getElementById('mousePosition');

    mousePositionElement.textContent = `Posición del mouse: (0, 0)`;

    // Add an event listener to the 'mousemove' event
    document.addEventListener('mousemove', (event) => {
    // Get the mouse coordinates from the event object
    const mouseX = event.pageX;
    const mouseY = event.pageY;

    // Update the content of the <p> element with the mouse position
    mousePositionElement.textContent = `Posición del mouse: (${mouseX}, ${mouseY})`;
    });

    // 2 ----------------------------------------------------------------------------------------------

    const form = document.getElementById('form1');
    const firstNameInput = document.getElementById('form-fname');
    const lastNameInput = document.getElementById('form-lname');
    const submitButton = document.getElementById('form1-submit');

    // Add a click event listener to the submit button
    submitButton.addEventListener('click', (event) => {
      event.preventDefault(); // Prevent form submission

      // Get the values from the input fields
      const firstName = firstNameInput.value;
      const lastName = lastNameInput.value;

      // Create a new element to display the full name
      const fullNameElement = document.createElement('p');
      fullNameElement.textContent = `Nombre completo: ${firstName} ${lastName}`;

      // Insert the new element after the submit button
      form.insertAdjacentElement('afterend', fullNameElement);
    });

    // 3 ----------------------------------------------------------------------------------------------

    // Get the references to the table and buttons
    const table = document.getElementById('sampleTable');
    const insertRowButton = document.getElementById('btn-insert-r');
    const insertColumnButton = document.getElementById('btn-insert-c');

    // Add a click event listener to the insert row button
    insertRowButton.addEventListener('click', () => {
    // Create a new row element
    const newRow = table.insertRow();

    // Get the number of columns in the table
    const columnCount = table.rows[0].cells.length;

    // Iterate over each column and insert a new cell in the new row
    for (let i = 0; i < columnCount; i++) {
        const newCell = newRow.insertCell();
        newCell.textContent = `New row column ${i + 1}`;
    }
    });

    // Add a click event listener to the insert column button
    insertColumnButton.addEventListener('click', () => {
    // Get all the rows in the table
    const rows = table.getElementsByTagName('tr');

    // Iterate over each row and insert a new cell
    for (let i = 0; i < rows.length; i++) {
        const newRowCell = rows[i].insertCell();

        // Set the content of the new cell
        newRowCell.textContent = `New column ${i + 1}`;
    }
    });

    // 4 ----------------------------------------------------------------------------------------------
    const changeButton = document.getElementById('btn-change');
    changeButton.addEventListener('click', function () {
      const rowIndexInput = document.getElementById('rowIndex');
      const colIndexInput = document.getElementById('colIndex');
      const newValueInput = document.getElementById('newValue');

      const rowIndex = parseInt(rowIndexInput.value) - 1; // Subtract 1 to match JavaScript array index
      const colIndex = parseInt(colIndexInput.value) - 1; // Subtract 1 to match JavaScript array index
      const newValue = newValueInput.value;

      const table = document.getElementById('myTable');
      const rows = table.getElementsByTagName('tr');

      if (rowIndex >= 0 && rowIndex < rows.length) {
        const cells = rows[rowIndex].getElementsByTagName('td');

        if (colIndex >= 0 && colIndex < cells.length) {
          cells[colIndex].textContent = newValue;
        } else {
          console.log('Invalid column index');
        }
      } else {
        console.log('Invalid row index');
      }
    });

    // 5 ----------------------------------------------------------------------------------------------

    const colorSelect = document.getElementById('colorSelect');
    const addColorButton = document.getElementById('btn-add-color');
    const removeColorButton = document.getElementById('btn-rmv-color');

    addColorButton.addEventListener('click', function () {
        const colors = ['Blue', 'Yellow', 'Orange', 'Purple']; // Array of colors

        // Generate a random index to select a color from the array
        const randomIndex = Math.floor(Math.random() * colors.length);
        const randomColor = colors[randomIndex];

        // Create a new option element
        const newOption = document.createElement('option');
        newOption.textContent = randomColor;

        // Add the new option to the select element
        colorSelect.appendChild(newOption);
    });

    removeColorButton.addEventListener('click', function () {
        // Check if there are any options to remove
        if (colorSelect.options.length > 0) {
        // Remove the last option from the select element
        colorSelect.removeChild(colorSelect.lastElementChild);
        }
    });

    // 6 ----------------------------------------------------------------------------------------------

    const imagenGato = document.getElementById('imagenGato');

    imagenGato.addEventListener('mouseenter', function () {
    const minWidth = 300;
    const maxWidth = 600;

    // Generate random width and height values within the given range
    const randomWidth = Math.floor(Math.random() * (maxWidth - minWidth + 1)) + minWidth;
    const randomHeight = Math.floor(Math.random() * (maxWidth - minWidth + 1)) + minWidth;

    // Create a new image element with the random width and height
    const newImage = document.createElement('img');
    newImage.src = 'http://placekitten.com/' + randomWidth + '/' + randomHeight;

    // Replace the existing image with the new image
    imagenGato.parentNode.replaceChild(newImage, imagenGato);
  });

});