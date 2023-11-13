self: super:
{

  obsidian = super.obsidian.overrideAttrs (old: rec {
    version = "1.4.16";
  });

}
