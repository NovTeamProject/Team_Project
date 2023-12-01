console.log("teacherClassUpload.js successfully loaded");

const showThumbnail = (event) => {
    const reader = new FileReader();
    reader.onload = (event) => {
        const imgTag = $("#class-image-thumbnail");
        imgTag.attr("src", event.target.result);
        alert("강의 대표 사진 등록");
    }
    reader.readAsDataURL(event.target.files[0]);
}

let currentLessonCount = 1;

// 서버에 전송될 강의의 총 수업 개수
let lessonCountHiddenElement = $("#class-total-lesson-count");

$("#lesson-plus-button").on("click", function(event) {
    addLessonElement();
    addMinusButton();
    lessonCountHiddenElement.val(currentLessonCount);
    alert("새로운 수업이 추가되었습니다");
})

const addLessonElement = () => {
    let afterThis = $("#lesson__item-" + currentLessonCount);
    currentLessonCount++;
    let newElement = "<br /><div class='lesson__item lesson__item-" + currentLessonCount + "' id='lesson__item-" + currentLessonCount + "'>&#10;&#13;";
    newElement += "<input type='text' class='form-control lesson-name lesson-name-" + currentLessonCount + "' name='lesson-name-" + currentLessonCount + "' id='lesson-name-" + currentLessonCount + "' placeholder='수업 제목을 입력해 주세요' />&#10;&#13;";
    newElement += "<input type='file' class='form-control lesson-video lesson-video-" + currentLessonCount + "' name='lesson-video-" + currentLessonCount + "' id='lesson-video-" + currentLessonCount +"' />&#10;&#13;";
    newElement += "<div id='div-lesson-time-" + currentLessonCount + "'>"
    newElement += "<span id='span-lesson-time-" + currentLessonCount + "' class='span-lesson-time span-lesson-time-" + currentLessonCount + "'></span>(초)";
    newElement += "</div>";
    newElement += "<input type='hidden' id='lesson-time-" + currentLessonCount + "' class='lesson-time lesson-time-" + currentLessonCount + "' name='lesson-time-" + currentLessonCount + "' />" ;
    newElement += "</div>";
    afterThis.after(newElement);
}

const addMinusButton = () => {
    let afterThis = $("#div-lesson-time-" + currentLessonCount);
    let newElement = "<br /><button type='button' style='--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;' " +
        "class='btn btn-outline-warning delete-lesson delete-lesson-" + currentLessonCount + "' name='delete-lesson-" + currentLessonCount + "' id='delete-lesson-" + currentLessonCount + "'>수업 삭제하기</button><br>";
    afterThis.after(newElement);
}

$("#class-form").on("click", ".delete-lesson", function(event) {
    let thisClassValue = $(this).attr("class");
    let lastDashIndexInt = parseInt(thisClassValue.lastIndexOf("-"));
    let thisLessonNumber = parseInt(thisClassValue.substring(lastDashIndexInt + 1, thisClassValue.length));
    console.log(`delete-lesson-num: ${thisLessonNumber}`);

    const forMinusTime = parseInt($("#span-lesson-time-" + thisLessonNumber).text());
    // 수업을 삭제하면, 사용자에게 보여지는 강의 총 시간이랑, 서버에 전송되는 강의 총 시간에서 빼줘야 한다.

    // 총 강의 시간에서 minus하기
    const originalTotalClassTime = parseInt($("#span-class-total-time").text());
    console.log(originalTotalClassTime, forMinusTime);
    if (!isNaN(forMinusTime)) {
        const newUpdatedTime = originalTotalClassTime - forMinusTime;
        $("#span-class-total-time").text(newUpdatedTime);
        $("#class-total-time").attr("value", newUpdatedTime);
    } else {
        console.log(`${thisLessonNumber} 수업의 강의 시간이 숫자가 아니기에 총 시간에서 뺄 수 없습니다.`);
    }

    $("#lesson__item-" + thisLessonNumber).remove();

    if (thisLessonNumber == currentLessonCount) {
        currentLessonCount--;
        lessonCountHiddenElement.val(currentLessonCount);
        // 보여지는 강의의 총 수업 개수 감소
        $("#span-class-total-lesson-count").text(currentLessonCount);
    } else {
        decreaseNumberByOne(thisLessonNumber);
    }
    alert("수업이 삭제되었습니다");
});

const decreaseNumberByOne = (deleteTargetNum) => {
    console.log(`decreaseNumberByOne called - deleteTargetNum: ${deleteTargetNum}`);
    let totalIterationTimes = currentLessonCount - deleteTargetNum;
    console.log(`decreaseNumberByOne called - totalIterationTimes: ${totalIterationTimes}`);
    let startElementNum = deleteTargetNum + 1;

    for (let i = 0; i < totalIterationTimes; i++) {
        console.log(`for called - i: ${i}`);
        let divLessonItem = $("#lesson__item-" + startElementNum); // 전체 wrapping하는 div태그
        let inputLessonNameItem = $("#lesson-name-" + startElementNum); // 서버에 전송될 lesson의 제목 태그
        let inputFileLessonVideoItem = $("#lesson-video-" + startElementNum); // 서버에 전송될 input:file 태그
        let buttonDeleteLessonItem = $("#delete-lesson-" + startElementNum); // 현 lesson 삭제 태그
        let spanLessonTime = $("#span-lesson-time-" + startElementNum); // 보여질(서버X) 수업의 길이 태그
        let inputLessonTime = $("#lesson-time-" + startElementNum); // 서버로 전송될 수업의 길이 태그

        let newNum = startElementNum - 1;

        divLessonItem.removeClass("lesson__item-" + startElementNum);
        inputLessonNameItem.removeClass("lesson-name-" + startElementNum);
        inputFileLessonVideoItem.removeClass("lesson-video-" + startElementNum);
        buttonDeleteLessonItem.removeClass("delete-lesson-" + startElementNum);
        spanLessonTime.removeClass("span-lesson-time-" + startElementNum);
        inputLessonTime.removeClass("lesson-time-" + startElementNum);

        divLessonItem.addClass("lesson__item-" + newNum);
        inputLessonNameItem.addClass("lesson-name-" + newNum);
        inputFileLessonVideoItem.addClass("lesson-video-" + newNum);
        buttonDeleteLessonItem.addClass("delete-lesson-" + newNum);
        spanLessonTime.addClass("span-lesson-time-" + newNum);
        inputLessonTime.addClass("lesson-time-" + newNum);

        divLessonItem.attr("id", "lesson__item-" + newNum);
        inputLessonNameItem.attr("id", "lesson-name-" + newNum);
        inputFileLessonVideoItem.attr("id", "lesson-video-" + newNum);
        buttonDeleteLessonItem.attr("id", "delete-lesson-" + newNum);
        spanLessonTime.attr("id", "span-lesson-time-" + newNum);
        inputLessonTime.attr("id", "lesson-time-" + newNum);

        divLessonItem.attr("name", "lesson__item-" + newNum);
        inputLessonNameItem.attr("name", "lesson-name-" + newNum);
        inputFileLessonVideoItem.attr("name", "lesson-video-" + newNum);
        buttonDeleteLessonItem.attr("name", "delete-lesson-" + newNum);
        spanLessonTime.attr("name", "span-lesson-time-" + newNum);
        inputLessonTime.attr("name", "lesson-time-" + newNum);

        startElementNum++;

        if (i == (totalIterationTimes - 1)) {
            currentLessonCount = newNum;
            lessonCountHiddenElement.val(currentLessonCount);
            // 사용자에게 보여지는 강의의 총 수업 개수에도 -1
            $("#span-class-total-lesson-count").text(currentLessonCount);
        }
    }
}

$("#class-form").on("change", ".lesson-video", function(e) {
    let thisClassValue = $(this).attr("class");
    let lastDashIndexInt = parseInt(thisClassValue.lastIndexOf("-"));
    let thisLessonNumber = parseInt(thisClassValue.substring(lastDashIndexInt + 1, thisClassValue.length));
    //console.log(`thisLessonNumber = ${thisLessonNumber}`);
    //console.dir(this);
    const file = this.files[0];
    loadVideoMetadata(file, thisLessonNumber);

    alert("수업 동영상이 추가되었습니다");
})

const loadVideoMetadata = (file, targetLessonNumber) => {
    const video = document.createElement("video");
    video.preload = "metadata";
    video.onloadedmetadata = () => {
        console.log("onloadedmetadata first line"); // 나중 실행
        window.URL.revokeObjectURL(video.src);
        const videoDuration = video.duration;
        if (videoDuration < 1) {
            alert("수업 동영상의 길이는 1초 이상이어야 합니다.");
            return;
        } else {
            console.log(`video duration: ${videoDuration}`);
            const videoDurationInt = parseInt(videoDuration);


            // 동영상이 변경되었으니, 보여지는 강의 총 시간 및 전송되는 강의 총 시간에서 빼줘야 한다
            // 현재 동영상 시간 갖고오기
            const currentLessonTime = parseInt($("#span-lesson-time-" + targetLessonNumber).text());

            if (!isNaN(currentLessonTime)) {
                const spanClassTotalTime = parseInt($("#span-class-total-time").text());
                const inputClassTotalTime = parseInt($("#class-total-time").val());
                $("#span-class-total-time").text(spanClassTotalTime - currentLessonTime);
                $("#class-total-time").attr('value', spanClassTotalTime - inputClassTotalTime);
            }


            // 보여지는 총 수업 시간에 더하기
            $("#span-class-total-time").text(
                parseInt($("#span-class-total-time").text()) + videoDurationInt
            );
            // 서버에 전송할 총 수업 시간에 더하기
            $("#class-total-time").attr("value", $("#span-class-total-time").text());



            // 보여지는 현재 lesson의 수업시간 값 변경
            $("#span-lesson-time-" + targetLessonNumber).text(videoDurationInt);
            // 서버에 전송될 현재 lesson의 수업시간 값 변경
            $("#lesson-time-" + targetLessonNumber).attr("value", videoDurationInt);


        }
    }
    video.src = window.URL.createObjectURL(file);
    console.log("loadVideoMetadata last line"); // 먼저 실행
}
