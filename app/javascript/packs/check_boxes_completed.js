

  const checkBoxes = ((boxes) => {
    let result = true;
    boxes.forEach((ch) =>{
      result = result && ch.checked;
    })
    return result;
  })

  const complete = document.querySelector(".complete-button");
  let boxes = document.querySelectorAll(".checkbox-custom");

  if(boxes.length === 0){
    complete.disabled = false;
  }

  boxes.forEach((check) => {
    check.addEventListener("change", (event) => {
      // console.log(check.checked);

      if(checkBoxes(boxes)){
        complete.disabled = false;
      } else {
      complete.disabled = true;
      }
    })
  })
