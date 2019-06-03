const minute = 1000 * 60;
const hour = minute * 60;
const day = hour * 24;
const permits = document.querySelectorAll('.permit-card');
const dateMaker = (date, time) => {
  const dateArr = date.split("-");
  const hourArr = time.split(":");
  const d = {
    day: parseInt(dateArr[0], 10),
    month: parseInt(dateArr[1], 10) - 1,
    year: parseInt(dateArr[2], 10) + 2000,
    hour: parseInt(hourArr[0], 10),
    minutes: parseInt(hourArr[1], 10)
  }
  return new Date(d.year, d.month, d.day, d.hour, d.minutes)
};
const validity = (startDate, endDate, statusTag) => {
  let statusIcon = statusTag.getElementsByTagName('i')[0];
  let status = statusTag.getElementsByClassName('text-status')[0].innerText;
  const approved = ["approved", "expired"].includes(status);
  let now = new Date();
  const diffEnd = endDate - now;
  const diffStart = startDate - now;
  const diffStart_mins = Math.floor(diffStart / minute);
  const diffStart_hrs = Math.floor(diffStart / hour);
  const diffStart_days = Math.floor(diffStart / day);
  const diffEnd_mins = Math.floor(diffEnd / minute);
  const diffEnd_hrs = Math.floor(diffEnd / hour);
  const diffEnd_days = Math.floor(diffEnd / day);
  const messages = [
    `expires in ${diffEnd_days}d ${diffEnd_hrs - diffEnd_days * 24}h`,
    `expires in ${diffEnd_hrs}h ${diffEnd_mins - diffEnd_hrs * 60}m`,
    `expires in ${diffEnd_mins}m`,
    `not yet valid! starts in ${diffStart_days}d ${diffStart_hrs - diffStart_days * 24}h`,
    `not yet valid! starts in ${diffStart_hrs}h ${diffStart_mins - diffStart_hrs * 60}m`,
    `not yet valid! starts in ${diffStart_mins}m`,
    `requires approval in ${diffStart_days}d ${diffStart_hrs - diffStart_days * 24}h`,
    `requires approval in ${diffStart_hrs}h ${diffStart_mins - diffStart_hrs * 60}m`,
    `requires approval in ${diffStart_mins}m`,
    "start date elapsed",
    "expiry date elapsed"
  ];
  const rag = ["red", "amber", "green"];
  if (now > endDate) {
    if (approved) {
      statusIcon.className = "icon-status";
      statusIcon.classList.add("fas");
      statusIcon.classList.add("fa-exclamation");
      statusIcon.classList.add("status-expired");
      status = "expired";
      return ["expired", rag[0], statusIcon, status];
    } else {
      return [messages[10], false];
    }
  }
  else if (now >= startDate) {
    if (diffEnd > day){
      return approved ? [messages[0], false] : [messages[9], false];
    }
    else if (diffEnd > hour) {
      return approved ? [messages[1], false] : [messages[9], false];
    }
    else {
      return approved ? [messages[2], rag[0]] : [messages[9], false];
    }
  }
  else {
    if (diffStart > day){
      return [approved ? messages[3] : messages[6], false];
    }
    else if (diffEnd > hour) {
      return [approved ? messages[4] : messages[7], false];
    }
    else {
      return [approved ? messages[5] : messages[8], false];
    }
  }
};
const validityShow = () => {
  permits.forEach(permit => {
      const statusTag = permit.getElementsByClassName('icons-container')[0];
      const text = permit.getElementsByClassName('card-bottom')[0].innerText.split(" ");
      const validityTag = permit.getElementsByClassName('validity')[0];
      const startDate = text[1];
      const startTime = text[2];
      const endDate = text[4];
      const endTime = text[5];
      const start = dateMaker(startDate, startTime);
      const end = dateMaker(endDate, endTime);
      // validityTag.innerText =  validity(start, end, statusTag)[0].innerText;
      // validity(start, end, status, statusTag, statusIcon)[1] ?  validityTag.classList.add(validity(start, end, status, statusTag, statusIcon)[1]) : null;
      // validity(start, end, status, statusTag, statusIcon)[2];
      // validity(start, end, statusTag, statusIcon)[3];
      // console.log(validity(start, end, statusTag));
      validCall = validity(start, end, statusTag);
      validityTag.innerText = validCall[0];
      if (validCall[1]) {
        validityTag.classList.add(validCall[1]);
      }

      if (validCall[2]) {
        console.log(validCall[2]);
      }

      if (validCall[3]) {
        statusTag.getElementsByClassName('text-status')[0].innerText = validCall[3];
      }
    });
  };
validityShow();
setInterval(() => {
  validityShow();
  }, 60*1000);
