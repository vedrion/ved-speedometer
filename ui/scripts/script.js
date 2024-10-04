let lastGear = null;

window.addEventListener("DOMContentLoaded", () => {
  window.addEventListener("message", async (e) => {
    if (e.data.action == "show") {
      $(".container").removeClass("hidden");

      let speed = e.data.isMetric
        ? e.data.speed * 3.6
        : e.data.speed * 2.236936;
      let measurementType = e.data.isMetric ? "km/h" : "mph";
      let rpm = e.data.rpm !== undefined ? e.data.rpm * 100 : null;
      let fuel = e.data.fuel !== undefined ? e.data.fuel : null;

      // Update speed and measurement type
      $(".speed").text(speed.toFixed(0));
      $(".measurementType").text(measurementType);

      // Update RPM information
      if (rpm !== null) {
        $(".rpm").css("width", `${rpm}%`);
        if (rpm >= 50 && rpm <= 80) {
          $(".rpm").css("background-color", "#f77a2d");
        } else if (rpm > 80) {
          $(".rpm").css("background-color", "#e04141");
        } else {
          $(".rpm").css("background-color", "");
        }
      } else {
        $(".rpm").css("width", `0%`);
      }

      // Update fuel level
      if (fuel !== null) {
        $(".fuel-percentage").text(`${fuel.toFixed(0)}%`);
        $(".fuel-bar-fill").css("width", `${fuel}%`);
      }

      // Update gear information
      if (e.data.gear !== lastGear && e.data.gear !== null) {
        $(".gear").remove();
        $(".container").append(`<div class="gear">${e.data.gear || "R"}</div>`);
        lastGear = e.data.gear;
      }
    } else if (e.data.action == "hide") {
      $(".container").addClass("hidden");
    }
  });
});