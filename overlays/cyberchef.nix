self: super:
{

  cyberchef = super.cyberchef.overrideAttrs (old: rec {
    version = "10.8.2";
  });

}
