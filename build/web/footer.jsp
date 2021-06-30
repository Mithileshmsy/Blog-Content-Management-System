<!--modal-->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="Enquiry" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="exampleModalLabel">Enquiry</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="EnquiryInsertAPI" method="POST">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input required name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email">
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Email</label>
                        <input required name="email" type="email" class="form-control" id="email" placeholder="Email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Query</label>
                        <input required name="question" type="text" class="form-control"  placeholder="Write your Question">
                    </div>
                    
                    <button type="submit" class="btn btn-dark btn-block">Submit</button>
                </form>

            </div>
            
        </div>
    </div>
</div>

<!--modal close-->

<div class="row">
    <div class="col-md-12 bg-dark p-2 text-white text-center">
        <span>© 2021 Tech Blog All rights reserved.</span>
    </div>
</div>