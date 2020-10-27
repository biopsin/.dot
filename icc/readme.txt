The root of the following profiles:

Adobe98.icc
AppleRGB.icc
CIERGB.icc
MelissaRGB.icc
ProPhoto.icc
WideGamut.icc

The MelissaRGB profile deserves some explanation. Melissa RGB is not an "official" color space, but is the combination of the ProPhoto color space, with an sRGB gamma curve. It's important because Melissa RGB is what Lightroom uses for its readouts. Specifically, the RGB values you get as Lightroom readouts are in this space. Note that the Melissa RGB profile I'm providing here has the real sRGB gamma curve. The sRGB gamma is close to a 2.2 gamma, but is linear at low values. So, if you take a readout of the darkest patch of the GretagMacBeth chart, there is is about a 1.5% difference between the reading using ProPhoto at a 2.2 gamma and a true Melissa RGB profile.

I also provide some alternate profiles in the "Alternate" directory of the ZIP. This includes a "ProPhoto gamma 2.2" file, for those that want to compare to the Melissa RGB version. These are all either at different to normal gammas, or different to normal white points:

MelissaRGBD65.icc
ProPhoto22.icc
ProPhoto22D65.icc
ProPhotoD65.icc
sRGB Gamma22.icc
WideGamutD65.icc
