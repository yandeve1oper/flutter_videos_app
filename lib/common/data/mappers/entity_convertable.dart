mixin EntityConvertable<M, E> {
  E toEntity();

  M fromEntity(E model) => throw UnimplementedError();
}
