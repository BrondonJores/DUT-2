const task = document.getElementById("task");
const my_task = document.getElementById("my-task");

const display = document.getElementById("display");
display.addEventListener("click", () =>{
    const area = document.getElementById("area-add");
    area.style.opacity = "1";
});



const addtask = document.getElementById("ad-task");
addtask.addEventListener("click", () =>{
    if(task.value != "")
        my_task.appendChild(add_task());
}); 

function add_task(){
    const a_task = document.createElement("a_task");
    a_task.textContent = task.value;
    a_task.style.background = "green";
    a_task.style.padding = "10px";
    a_task.style.marginRight = "5px";
    a_task.addEventListener("click", ()=>{
        my_task.removeChild(a_task);
    });
    a_task.style.border = "1px";
    a_task.style.borderRadius = "10px";
    return a_task;
}