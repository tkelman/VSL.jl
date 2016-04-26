brng_type = VSL_BRNG_MT19937
println("Testing continuous distributions with $brng_type...")
brng = BasicRandomNumberGenerator(brng_type, 200701281)

t_uniform = Uniform(brng, 1.0, 5.0, VSL_RNG_METHOD_STD)
Test.@test_approx_eq rand(t_uniform) 2.322448899038136
Test.@test_approx_eq rand(t_uniform, 2, 3) [2.095937419682741 1.384681923314929 3.5385020431131124;
    2.722409107722342 3.2286222940310836 3.492045565508306]

t_uniform_s = Uniform(brng, 1.0f0, 5.0f0, VSL_RNG_METHOD_STD)
Test.@test_approx_eq rand(t_uniform_s) 1.9687817
Test.@test_approx_eq rand(t_uniform_s, 2, 3) Float32[3.6907854 4.696991 1.0887742; 2.5996513 3.0419362 1.6825311]

t_gaussian = Gaussian(brng, 0.0, 2.0, VSL_RNG_METHOD_BOXMULLER)
Test.@test_approx_eq rand(t_gaussian) -0.9735644733742295
Test.@test_approx_eq rand(t_gaussian, 2, 3) [1.6633829486206413 -2.6133352810372648 -0.970663366604635;
    -2.6558179968512556 0.15735047751114864 -0.17643768212765662]

t_gaussianmv = GaussianMV(brng, 3, VSL.VSL_MATRIX_STORAGE_FULL,
                          Float64[1,2,3], Float64[1 2 3; 1 2 3; 1 2 3], VSL_RNG_METHOD_BOXMULLER)
Test.@test_approx_eq rand(t_gaussianmv) [0.3082184760114798,6.300872957078845,7.334694164857175]
Test.@test_approx_eq rand(t_gaussianmv, 2, 2) [[1.923149938750187 -0.3162011679114993;
    2.9480075862554833 1.5239876962852263;
    5.275672885706222 0.45149386428434646] [0.3242650723722491 2.0260891238576626;
    6.385317296018982 5.496315313212104;
    9.489218714523638 6.179406031523525]]

t_exponential = Exponential(brng, 1.0, 5.0, VSL_RNG_METHOD_ICDF_ACCURATE)
Test.@test_approx_eq rand(t_exponential) 2.377567568960911
Test.@test_approx_eq rand(t_exponential, 2, 3) [4.413548756621528 25.926869172016435 6.275294931681895;
    11.927277624381231 15.012977513573848 14.484502861244687]

t_laplace = Laplace(brng, 1.0, 5.0, VSL_RNG_METHOD_ICDF)
Test.@test_approx_eq rand(t_laplace) -16.448117437212808
Test.@test_approx_eq rand(t_laplace, 2, 3) [-3.164337857572849 -7.322014295762699 1.410163004639701;
    6.016508562718869 -1.44607530326605 -13.779568688833983]

t_weibull = Weibull(brng, 2.0, 1.0, 5.0, VSL_RNG_METHOD_ICDF)
Test.@test_approx_eq rand(t_weibull) 3.955421250151695
Test.@test_approx_eq rand(t_weibull, 2, 3) [3.5513752536371976 3.387943539644237 14.490270157270228;
    5.485756509133127 1.641830433721784 5.293257543471708]

t_cauchy = Cauchy(brng, 1.0, 5.0, VSL_RNG_METHOD_ICDF)
Test.@test_approx_eq rand(t_cauchy) 5.053710550235988
Test.@test_approx_eq rand(t_cauchy, 2, 3) [-9.561194361952158 2.729941469747197 -29.036639051770745;
    15.845808202696535 2.4910693225617306 -23.054635708160525]

t_rayleigh = Rayleigh(brng, 1.0, 5.0, VSL_RNG_METHOD_ICDF)
Test.@test_approx_eq rand(t_rayleigh) 6.964227509124585
Test.@test_approx_eq rand(t_rayleigh, 2, 3) [1.9116818525779784 4.800324073477311 3.6009873512912196;
    4.803096398322611 4.240966067588024 5.031079749896435]

t_lognormal = Lognormal(brng, 1.0, 5.0, 1.0, 5.0, VSL_RNG_METHOD_BOXMULLER2_ACCURATE)
Test.@test_approx_eq rand(t_lognormal) 1.2014456712636028
Test.@test_approx_eq rand(t_lognormal, 2, 3) [5.089982211620304 10.177360521516068 1.000489065119901;
    19.072524428974425 6.576201165284518 4.7555037530336035]

t_gumbel = Gumbel(brng, 1.0, 5.0, VSL_RNG_METHOD_ICDF)
Test.@test_approx_eq rand(t_gumbel) 5.058968273986181
Test.@test_approx_eq rand(t_gumbel, 2, 3) [-7.899608870978792 3.2375814923016044 -7.34510459108904;
    -4.489056242133308 -1.0751516263904923 -6.644231189559743]

t_gamma = Gamma(brng, 2.0, 1.0, 5.0, VSL_RNG_METHOD_GNORM)
Test.@test_approx_eq rand(t_gamma) 6.57938643493399
Test.@test_approx_eq rand(t_gamma, 2, 3) [21.224445861841176 2.4295122690877804 7.956022732346411;
    14.926974755883295 12.706935187979754 23.257200004523227]

t_beta = Beta(brng, 3.0, 2.0, 1.0, 5.0, VSL_RNG_METHOD_CJA_ACCURATE)
Test.@test_approx_eq rand(t_beta) 4.634230735631953
Test.@test_approx_eq rand(t_beta, 2, 3) [3.813840860964052 2.237891967578899 5.1889618185019435;
    4.752284424158841 5.320163586217357 5.135724811490341]