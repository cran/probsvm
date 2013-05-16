\name{predict.probsvm}
\alias{predict.probsvm}
\title{Prediction function that provides class label prediction and class conditional probability estimation for objects with class "probsvm", returned by the probsvm function.}  
\description{Prediction of a test data set on the obtained \code{probsvm} model. See the description of \code{probsvm} for details.}
\usage{
\method{predict}{probsvm}(object,new.x=NULL,...)
}

\arguments{
  \item{object}{An object returned by a call of \code{probsvm} function.}
  \item{new.x}{The new predictor matrix. The number and order of predictors in new.x should be the same as those of x, which is used in the call of \code{probsvm} function. If not specified, the program uses the x matrix as the prediction object.}
  \item{...}{Not used.}
}

\value{
  \item{object}{The model from a \code{probsvm} function.}
  \item{new.x}{The predictor matrix used for prediction.}
  \item{pred.prob}{The predicted class conditional probability. The class of each column is recorded in the column names.}
  \item{pred.y}{Predicted label for new.x.}
   }

\seealso{\code{\link{probsvm}}} 





  