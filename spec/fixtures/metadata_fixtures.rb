module FFSplitter
  module MetadataFixtures
    MULTICHAPTER = <<-EOF
      ;FFMETADATA1
      major_brand=M4V
      minor_version=1
      compatible_brands=M4V M4A mp42isom
      title=2013-10-02 Sandra Poon
      composer=Kevin Rockwood
      [CHAPTER]
      TIMEBASE=1/30000
      START=0
      END=2321319
      title=Ludwig van Beethoven - Piano Trio in D Major, Op. 70 No. 1 ("Ghost Trio")
      [CHAPTER]
      TIMEBASE=1/30000
      START=2321319
      END=15450435
      title=-   I. Allegro vivace e con brio
      [CHAPTER]
      TIMEBASE=1/30000
      START=15450435
      END=15451436
      title=-   II. Largo assai ed espressivo
    EOF

  end
end