{
  perSystem =
    { self', pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with self'.packages; [
          agda
          just-agda
        ];
      };
    };
}
