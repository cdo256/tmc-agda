{ self, inputs, ... }:
{
  systems = [
    "x86_64-linux"
  ];
  perSystem =
    { system, ... }:
    {
      _module.args = {
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
      };
    };
}
