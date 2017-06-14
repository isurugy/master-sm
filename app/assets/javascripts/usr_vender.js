
document.addEventListener("turbolinks:load", function() {
    console.log('load');
    $(document).on('cocoon:after-insert', '#repeatingz', function(added_task) {
        console.log("in working"); });
});
