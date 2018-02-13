<li>
    <a href="/" target="_blank">
        <i class="fa fa-btn fa-globe"></i> To site
    </a>
</li>
<li class="dropdown user user-menu" style="margin-right: 20px;">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        <span class="hidden-xs">{{Auth::user()->email}}</span>
    </a>
    <ul class="dropdown-menu">
        <!-- User image -->
        <li class="user-header">
            <p>
                {{Auth::user()->email}}
                @if(Auth::user()->created_at)
                    <small>Registered: {{Auth::user()->created_at->format('d-m-Y')}}</small>
                @endif
            </p>
        </li>
        <!-- Menu Footer-->
        <li class="user-footer">
            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <i class="fa fa-btn fa-sign-out"></i> Logout
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
        </li>
    </ul>
</li>