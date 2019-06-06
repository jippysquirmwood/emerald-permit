const statusTag = document.getElementById('permit-status');
let permitStatus = statusTag.innerText.toLowerCase();


const icons = {
  draft: document.getElementById('icon1'),
  pendRej: document.getElementById('icon2'),
  approved: document.getElementById('icon3'),
  expired: document.getElementById('icon4')
}

const iconClasses = {
  circle: "fas fa-circle",
  dot: "fas fa-dot-circle",
  tick: "fas fa-check-circle",
  cross: "fas fa-times-circle",
  red: "i-red",
  green: "i-green",
  yellow: "i-yellow",
  grey: "i-grey",
  trans: "i-trans"
};


if (permitStatus === "draft") {
  icons.draft.classList = `${iconClasses.dot} ${iconClasses.yellow}`;
  icons.pendRej.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
  icons.approved.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
  icons.expired.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
} else if (permitStatus === "pending approval") {
  icons.draft.classList = `${iconClasses.tick} ${iconClasses.green}`;
  icons.pendRej.classList = `${iconClasses.dot} ${iconClasses.yellow}`;
  icons.approved.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
  icons.expired.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
} else if (permitStatus === "rejected") {
  icons.draft.classList = `${iconClasses.tick} ${iconClasses.green}`;
  icons.pendRej.classList = `${iconClasses.cross} ${iconClasses.red}`;
  icons.approved.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
  icons.expired.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
} else if (permitStatus === "approved") {
  icons.draft.classList = `${iconClasses.tick} ${iconClasses.green}`;
  icons.pendRej.classList = `${iconClasses.tick} ${iconClasses.green}`;
  icons.approved.classList = `${iconClasses.tick} ${iconClasses.green}`;
  icons.expired.classList = `${iconClasses.circle} ${iconClasses.grey} ${iconClasses.trans}`;
} else if (permitStatus === "expired") {
  icons.draft.classList = `${iconClasses.tick} ${iconClasses.red}`;
  icons.pendRej.classList = `${iconClasses.tick} ${iconClasses.red}`;
  icons.approved.classList = `${iconClasses.tick} ${iconClasses.red}`;
  icons.expired.classList = `${iconClasses.tick} ${iconClasses.red}`;
  statusTag.classList.add(`${iconClasses.red}`);
}

const minute = 1000 * 60;
const hour = minute * 60;
const day = hour * 24;

const validity = (startDate, endDate) => {
  const approved = ["approved", "expired"].includes(permitStatus.toLowerCase());
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
    `Expires in ${diffEnd_days}d ${diffEnd_hrs - diffEnd_days * 24}h`,
    `Expires in ${diffEnd_hrs}h ${diffEnd_mins - diffEnd_hrs * 60}m`,
    `Expires in ${diffEnd_mins}m`,
    `Not yet valid! starts in ${diffStart_days}d ${diffStart_hrs - diffStart_days * 24}h`,
    `Not yet valid! starts in ${diffStart_hrs}h ${diffStart_mins - diffStart_hrs * 60}m`,
    `Not yet valid! starts in ${diffStart_mins}m`,
    `Requires approval in ${diffStart_days}d ${diffStart_hrs - diffStart_days * 24}h`,
    `Requires approval in ${diffStart_hrs}h ${diffStart_mins - diffStart_hrs * 60}m`,
    `Requires approval in ${diffStart_mins}m`,
    "Start date elapsed",
    "Expiry date elapsed"
  ];
  const rag = ["red", "amber", "green"];
  if (now > endDate) {
    if (approved) {
      permitStatus = "Expired";
      return ["This permit is no longer valid and may not be used", false, permitStatus];
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
    else if (diffStart > hour) {
      return [approved ? messages[4] : messages[7], rag[0]];
    }
    else {
      return [approved ? messages[5] : messages[8], rag[0]];
    }
  }
};

const dateMaker = (text) => {
  const textArr = text.split(" ");
  const dateText = textArr[0];
  const timeText = textArr[1];
  const dateArr = dateText.split("-");
  const hourArr = timeText.split(":");
  const d = {
    day: parseInt(dateArr[0], 10),
    month: parseInt(dateArr[1], 10) - 1,
    year: parseInt(dateArr[2], 10) + 2000,
    hour: parseInt(hourArr[0], 10),
    minutes: parseInt(hourArr[1], 10)
  }
  return new Date(d.year, d.month, d.day, d.hour, d.minutes)
};

const validityShow = () => {
  const startDateText = document.getElementById('start-date').innerText;
  const endDateText = document.getElementById('end-date').innerText;
  const validityTag = document.getElementById('validity');
  const start = dateMaker(startDateText);
  const end = dateMaker(endDateText);
  validCall = validity(start, end);

  validityTag.innerText = validCall[0];
  if (validCall[1] !== false) {
    validityTag.classList.add(`${iconClasses.yellow}`);
  }

  if (validCall[2]) {
    statusTag.innerText = validCall[2];
    icons.draft.classList = `${iconClasses.tick} ${iconClasses.red}`;
    icons.pendRej.classList = `${iconClasses.tick} ${iconClasses.red}`;
    icons.approved.classList = `${iconClasses.tick} ${iconClasses.red}`;
    icons.expired.classList = `${iconClasses.tick} ${iconClasses.red}`;
    statusTag.classList.add(`${iconClasses.red}`);
    validityTag.classList.remove(`${iconClasses.red}`)
  }
};

validityShow();
setInterval(() => {
  validityShow();
  }, 5000);


