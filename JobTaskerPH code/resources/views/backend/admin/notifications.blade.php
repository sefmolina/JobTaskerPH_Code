@extends('backend.layout')

@section('content')
  <div class="page-header">
    <h4 class="page-title">{{ __('Notifications') }}</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('admin.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Notifications') }}</a>
      </li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title">{{ __('All Notifications') }}</div>
        </div>
        <div class="card-body">
          @if($notifications->isEmpty())
            <h3 class="text-center">{{ __('No Notifications Found') }}</h3>
          @else
            <div class="table-responsive">
              <table class="table table-striped mt-3">
                <thead>
                  <tr>
                    <th scope="col">{{ __('Message') }}</th>
                    <th scope="col">{{ __('TimeStamp') }}</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($notifications as $notification)
                    <tr>
                      <td>{{ $notification->message }}</td>
                      <td>{{ $notification->created_at->format('M d, Y h:i A') }}</td>
                 
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          @endif
        </div>
        <div class="card-footer">
          <div class="d-inline-block mx-auto">
            {{ $notifications->links() }}
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection

@section('scripts')
<script>
  $(document).on('click', '.delete-notification', function() {
    let id = $(this).data('id');
    if (confirm('Are you sure you want to delete this notification?')) {
      $.ajax({
        url: '',
        method: 'POST',
        data: {
          _token: '{{ csrf_token() }}',
          id: id
        },
        success: function(response) {
          location.reload();
        }
      });
    }
  });
</script>
@endsection