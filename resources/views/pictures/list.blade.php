@extends('layout')

@section('content')

    <div class="row mb-5">
        <button id="newPicture" class="btn btn-success offset-9 col-2 " onclick="openModal('create')">Añadir</button>
    </div>

    <form method="POST" class="form-inline my-2 my-lg-0" id="form1">
        @csrf
        <input onkeyup="buscar($('#buscador').val())" name="buscador" id="buscador" class="form-control mr-sm-2 m-2" type="search"
            placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit" ">Buscar</button>
                        </form>

                        <div class="m-5">
                            <buttonv class="rounded-circle btn"><i class="fa-solid fa-arrow-up-wide-short"></i></button>
                                <button class="rounded-circle  btn"><i class="fa-solid fa-arrow-down-short-wide"></i></button>

                        </div>

                        <section id="pictures" class="row g-3 d-flex flex-wrap align-items-center justify-content-center">
                                 @if (!count($pictures))
            <h2>¡Añade tus primeras fotos!</h2>
        @else
            @foreach ($pictures as $picture)
                <div class="card col-md-3 col-sm-6 col-12 m-1 p-1 mb-5 " id="img-{{ $picture->id }}">
                    <img src="{{ route('get-picture', ['picture' => $picture->picture_url]) }}" class="card-img-top">
                    <div class="card-body">
                        <h5 id="cardTitle{{ $picture->id }}">{{ $picture->picture_name }}</h5>
                        <div id="starsContainer{{ $picture->id }}">
                            <select class="star-rating" id="cardRating{{ $picture->id }}" disabled="">
                                <option></option>
                                <option value="1" @selected('1' == $picture->rating)></option>
                                <option value="2" @selected('2' == $picture->rating)></option>
                                <option value="3" @selected('3' == $picture->rating)></option>
                                <option value="4" @selected('4' == $picture->rating)></option>
                                <option value="5" @selected('5' == $picture->rating)></option>
                            </select>
                        </div>
                        <div> {{ $picture->date }} </div>
                        <div class="row mt-3">
                            <button class="btn btn-primary col-md-5 col-sm-6 col-12"
                                onclick="openModal('edit',{{ $picture->id }})">Editar</button>
                            <button class="btn btn-danger col-md-5 col-sm-6 col-12 offset-md-2"
                                onclick="confirmDeletion({{ $picture->id }})">Borrar</button>
                        </div>
                    </div>
                </div>
            @endforeach
            @endif
            </section>

            <div id="modalForm" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row mb-4">
                                <img id="imgPreview" class="col-10 offset-1">
                            </div>
                            <div class="row mb-3" id="imageInputContainer">
                                <label for="picture" class="col-sm-2 col-form-label">Imagen</label>
                                <div class="col-sm-10">
                                    <input type="file" accept="image/*" class="form-control" id="picture"
                                        onchange="previewPicture()">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="title" class="col-sm-2 col-form-label">Título</label>
                                <div class="col-sm-10">
                                    <input type="text" maxlength="80" class="form-control" id="title">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="rating" class="col-sm-2 col-form-label">Calificación</label>
                                <div class="col-sm-10">
                                    <select id="rating">
                                        <option value="0"></option>
                                        <option value="1"></option>
                                        <option value="2"></option>
                                        <option value="3"></option>
                                        <option value="4"></option>
                                        <option value="5"></option>
                                    </select>
                                </div>
                            </div>


                            {{-- agregar una fecha de fotografia inputs --}}

                            <div class="row mb-3">

                                <label for="date" class="col-sm-2 col-form-label">Agrega una fecha</label>

                                <input type="date" name="fecha" id="date" class="form-control w-25">

                            </div>




                            <div class="alert alert-danger" id="errors" style="display:none"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" onclick="save()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="modalDeleteLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalDeleteLabel">¿Borrar la foto?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Si la borras, no podrás recuperarla</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" onclick="removePicture()">Borrar</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>


        @endsection

        @section('scripts')
            <script type="text/javascript" src="{{ asset('js/star-rating.js') }}"></script>

            {{-- Variables para el javascript --}}
            <script type="text/javascript">
                const postUrl = "{{ route('save-picture') }}";
                const deleteUrl = "{{ route('remove-picture') }}";
                const homeBuscador = "{{ route('home.buscador') }}";
                const csrf = "{{ csrf_token() }}";
                var pictures = {
                    @foreach ($pictures as $picture)
                        "{{ $picture->id }}": {
                            "title": "{{ $picture->picture_name }}",
                            "image": "{{ route('get-picture', ['picture' => $picture->picture_url]) }}",
                            "rating": "{{ $picture->rating }}",
                            "date": "{{ $picture->date }}",
                            "buscador": "{{ $picture->buscador }}"
                        },
                    @endforeach
                };


            </script>
            <script src="https://kit.fontawesome.com/ba10ce0731.js" crossorigin="anonymous"></script>
            <script type="text/javascript" src="{{ asset('js/pictures.js') }}"></script>
        @endsection
