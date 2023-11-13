self: super:
{

  cyberchef = super.cyberchef.overrideAttrs (old: rec {
    version = "10.5.2";
  });

}
