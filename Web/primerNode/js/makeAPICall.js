document.addEventListener('load', function () {
    alert("It's loaded!")
  })


const names = await fetch("/api/greeting/Alex/F", {method:'GET'})


if (names.ok) 
{
    let displayName = names.text
    
}