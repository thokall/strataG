% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structure.R
\name{structure}
\alias{structure}
\alias{structureRead}
\alias{structureRun}
\alias{structureWrite}
\title{STRUCTURE}
\usage{
structureRun(g, k.range = NULL, num.k.rep = 1, label = NULL,
  delete.files = TRUE, exec = "structure", ...)

structureWrite(g, label = NULL, maxpops = nlevels(strata(g)),
  burnin = 1000, numreps = 1000, noadmix = TRUE, freqscorr = FALSE,
  randomize = TRUE, seed = 0, pop.prior = NULL, locpriorinit = 1,
  maxlocprior = 20, gensback = 2, migrprior = 0.05,
  pfrompopflagonly = TRUE, popflag = NULL, ...)

structureRead(file, pops = NULL)
}
\arguments{
\item{g}{a \linkS4class{gtypes} object.}

\item{k.range}{vector of values to for \code{maxpop} in multiple runs. 
If set to \code{NULL}, a single STRUCTURE run is conducted with 
\code{maxpops} groups. If specified, do not also specify \code{maxpops}.}

\item{num.k.rep}{number of replicates for each value in \code{k.range}.}

\item{label}{label to use for input and output files}

\item{delete.files}{logical. Delete all files when STRUCTURE is finished?}

\item{exec}{name of executable for STRUCTURE. Defaults to "structure".}

\item{...}{arguments to be passed to \code{structure.write}.}

\item{maxpops}{number of groups.}

\item{burnin}{number of iterations for MCMC burnin.}

\item{numreps}{number of MCMC replicates.}

\item{noadmix}{logical. No admixture?}

\item{freqscorr}{logical. Correlated frequencies?}

\item{randomize}{randomize.}

\item{seed}{set random seed.}

\item{pop.prior}{a character specifying which population prior model to 
use: "locprior" or "usepopinfo".}

\item{locpriorinit}{parameterizes locprior parameter \emph{r} - how 
informative the populations are. Only used when 
\code{pop.prior} = "locprior".}

\item{maxlocprior}{specifies range of locprior parameter \emph{r}. Only used 
when \code{pop.prior} = "locprior".}

\item{gensback}{integer defining the number of generations back to test 
for immigrant ancestry. Only used when \code{pop.prior} = "usepopinfo".}

\item{migrprior}{numeric between 0 and 1 listing migration prior. Only used 
when \code{pop.prior} = "usepopinfo".}

\item{pfrompopflagonly}{logical. update allele frequencies from individuals 
specified by \code{popflag}. Only used when \code{pop.prior} = 
"usepopinfo".}

\item{popflag}{a vector of integers (0, 1) or logicals identifiying whether 
or not to use strata information. Only used when \code{pop.prior} 
= "usepopinfo".}

\item{file}{name of the output file from STRUCTURE.}

\item{pops}{vector of population labels to be used in place of numbers in 
STRUCTURE file.}
}
\value{
\describe{
 \item{structure.run}{a list where each element is a list with results 
   from \code{structure.read} and a vector of the filenames used.}
 \item{structure.write}{a vector of the filenames used by STRUCTURE.}
 \item{structure.read}{a list containing:
   \tabular{ll}{
     \code{summary} \tab new locus name, which is a combination of loci 
       in group.\cr
     \code{q.mat} \tab data.frame of assignment probabilities for 
       each id.\cr
     \code{prior.anc} \tab list of prior ancestry estimates for each 
       individual where population priors were used.\cr
     \code{files} \tab vector of input and output files used by STRUCTURE.\cr
     \code{label} \tab label for the run.\cr
   }
 }
}
}
\description{
Run STRUCTURE to assess group membership of samples.
}
\note{
STRUCTURE is not included with \code{strataG} and must be downloaded 
  separately. Additionally, it must be installed such that it can be run from 
  the command line in the current working directory. See the vignette 
  for \code{external.programs} for installation instructions.
}
\examples{
\dontrun{
data(msats.g)

# Run STRUCTURE
sr <- structureRun(msats, k.range = 1:4, num.k.rep = 10)

# Calculate Evanno metrics
evno <- evanno(sr)
evno

# Run CLUMPP to combine runs for K = 2
q.mat <- clumpp(sr, k = 3)
q.mat

# Plot CLUMPP results
structurePlot(q.mat)
}

}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
\references{
Pritchard, J.K., M. Stephens, P. Donnelly. 2000. Inference of 
  population structure using multilocus genotype data. Genetics 155:945-959.\cr 
  \url{http://pritchardlab.stanford.edu/structure.html}
}
\seealso{
\code{\link{structurePlot}}, \code{\link{evanno}}, 
  \code{\link{clumpp}}
}
