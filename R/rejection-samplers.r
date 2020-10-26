#' @title Custom uniform rejection samplers
#'
#' @description These functions create rejection samplers, and uniform manifold
#'   samplers based on them, using user-provided parameterization and Jacobian
#'   functions.
#'
#' @details The rejection sampling technique of Diaconis, Holmes, and
#'   Shahshahani (2013) uses a parameterized embedding from a parameter space to
#'   a coordinate space and relies on a formula for its jacobian determinant.
#'   The `parameterization` must be a function that takes vector arguments of
#'   equal length and returns a coordinate matrix of the same number of rows.
#'   The `jacobian` must be a function that takes the same arguments and returns
#'   a scalar value. The parameters must range from their respective minima
#'   `min_params` to their respective maxima `max_params`. `max_jacobian` must
#'   be provided, though it may be larger than the theoretical maximum of the
#'   jacobian determinant.
#'   

#' @template ref-diaconis2013
#' 

#' @name rejection-samplers
#' @param parameterization A function that takes parameter vector arguments and
#'   returns a matrix of coordinates.
#' @param jacobian A function that takes parameter vector arguments and returns
#'   a vector of Jacobian determinants.
#' @param min_params,max_params (Optionally named) vectors of minimum and
#'   maximum values of the parameters, used for uniform sampling.
#' @param max_jacobian An (ideally sharp) upper bound on the Jacobian
#'   determinant.
#' @example inst/examples/ex-rejection-samplers.r
NULL

#' @rdname rejection-samplers
#' @export
make_rejection_sampler <- function(
  parameterization, jacobian, min_params, max_params, max_jacobian
) {
  # start parameters at zero if not specified
  if (missing(min_params)) {
    min_params <- max_params
    min_params[] <- 0
  }
  # rejection sampler using provided jacobian determinant
  rejection_sampler <- make_jd_rs(jacobian,
                                  min_params, max_params, max_jacobian)
  # manifold sampler
  function(n, sd = 0) {
    param_vals <- rejection_sampler(n)
    res <- do.call(parameterization, args = param_vals)
    add_noise(res, sd = sd)
  }
}

make_jd_rs <- function(
  jacobian, min_params, max_params, max_jacobian
) {
  function(n) {
    x <- matrix(NA, nrow = 0, ncol = length(min_params))
    while (nrow(x) < n) {
      param_vals <- mapply(runif, min = min_params, max = max_params,
                           MoreArgs = list(n = n))
      if (is.null(colnames(param_vals))) {
        colnames(param_vals) <- names(formals(jacobian))
      }
      param_vals <- as.data.frame(param_vals)
      j_vals <- do.call(jacobian, args = param_vals)
      density_threshold <- runif(n, 0, max_jacobian)
      x <- rbind(x, param_vals[j_vals > density_threshold, , drop = FALSE])
    }
    x[1:n, , drop = FALSE]
  }
}
