\name{probsvm}
\alias{probsvm}
\title{Main function that provides models for multiclass conditional probability estimation and label prediction}
\description{
  The function uses x and y to build a multiclass prediction model. The multiclass method can be either one-versus-one (ovo), or one-versus-rest (ovr, default). The probability estimation method for a binary classifier is proposed in Wang et al. (2008), and then we use the method proposed in Wu et al. (2004) to combine the results from binary classifiers in the ovo method. For the ovr method, we rescale those binary probabilities for multiclass problems. The function automatically chooses the best penalty parameter via 5-fold (default) Cross Validations (CV). Linear kernel, polynomial kernel and radial(Gaussian) kernel are available. A solution path is provided by Shin et al. (2012), which boosts the computational speed. 
}

\usage{
probsvm(x, y, fold=5, 
kernel=c("linear","polynomial","radial"), 
kparam=NULL, Inum=20, type="ovr", 
lambdas=2^(-10:10))
}

\arguments{
  \item{x}{The x matrix/data.frame for the training dataset. Columns represent the covariates, and rows represent the instances. There should be no NA/NaN values in x.}
  \item{y}{The labels for the training dataset.}
  \item{fold}{Number of folds in CV. Default 5.}
  \item{kernel}{Type of kernel used for learning. \code{kernel="linear"} for linear kernel (default), \code{kernel="polynomial"} for polynomial kernel, and \code{kernel="radial"} for radial(gaussian) kernel.}
  \item{kparam}{The parameter for the kernel. For linear kernel, this argument is not needed. In polynomial kernel, it represents the degree of the polynomials, and in radial(gaussian) kernel, it represents the usual sigma value.}
  \item{Inum}{Number of knots on [0,1] to estimate the class conditional probability. The larger Inum is, the more accurate the final result is, yet the more time it takes to compute. Default \code{20}.}
  \item{type}{The type of multiclass method. The option \code{ovo} is for the one-versus-one method, and \code{ovr} is for the one-versus-rest method (default).}
  \item{lambdas}{The user-specified lambda value vector. Each element should be positive. Default \code{2^(-10:10)}.}
}

\value{
  \item{All arguments}{All arguments are returned.}
  \item{lambdas}{The lambda values used for selecting the best model. Sorted in an increasing order.}
  \item{best.lambda}{The best lambda values selected from CV. Used for model prediction.}
  \item{call}{The call of \code{probsvm}.}
}
\references{
Shin, S.J., Y. Wu, and H.H. Zhang (2012). Two-Dimensional Solution Surface for Weighted Support Vector Machines, \emph{Journal of Computational and Graphical Statistics}, in press.

Wang, J., X. Shen, and Y. Liu (2008). Probability estimation for large margin classifiers.
\emph{Biometrika} \bold{95(1)}, 149-167.

Wu, T.-F., C.-J. Lin, and R. C. Weng (2004). Probability estimates for multi-class classification by pairwise coupling. \emph{Journal of Machine Learning Research} \bold{5}, 975-1005.
}
\author{Chong Zhang, Seung Jun Shin, Junhui Wang, Yichao Wu, Hao Helen Zhang, and Yufeng Liu}

\seealso{\code{\link{predict.probsvm}}} 

\examples{
# iris data #

data(iris)

iris.x=iris[c(1:20,51:70,101:120),-5]  
 
iris.y=iris[c(1:20,51:70,101:120),5]

iris.test=iris[c(21:50,71:100,121:150),-5]  
 
a = probsvm(iris.x,iris.y,type="ovo",
	Inum=10,fold=2,lambdas=2^seq(-10,10,by=3))
predict(a, iris.test)
}

