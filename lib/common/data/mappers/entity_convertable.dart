mixin EntityConvertable<M, E> {
  E toEntity();

  // TODO: check if necessary
  M fromEntity(E model) => throw UnimplementedError();
}
