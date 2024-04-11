<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Blog Buddy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        .user-message {
            background-color: #ddd;
            color: #333;
        }

        .assistant-message {
            background-color: #f0f0f0;
            color: #000;
        }

        #output {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            min-height: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="mb-4">
            <h2 class="display-4 text-center">Blog Buddy</h2>
        </header>
        <main>
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card chatbox">
                        <form class="card-body" id="chat-form">
                            <div class="input-group">
                                <input type="text" class="form-control" id="blog-topic" placeholder="Enter your blog topic..." required>
                                <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane" style="color: white;"></i></button>
                            </div>
                        </form>
                        <div id="output"></div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#chat-form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission

            // Get the blog topic entered by the user
            var topic = $('#blog-topic').val();

            // Make an AJAX POST request to your Spring controller
            $.ajax({
                type: "POST",
                url: "generate-blog",
                data: {topic: topic},
                success: function(response) {
                    // Update the output div with the received blog content
                    $('#output').html(response);
                },
                error: function(xhr, status, error) {
                    // Handle any errors here
                    console.error(xhr.responseText);
                }
            });
        });
    });

</script>

</body>
</html>
