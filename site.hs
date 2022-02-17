{-# LANGUAGE OverloadedStrings #-}

module Main where

import Hakyll
import Text.Pandoc
import Control.Monad (forM_)
import Data.Monoid (mappend)
import qualified Data.Map as M
import Data.Maybe (isJust, fromMaybe)
import System.Process (callCommand)


cfg :: Configuration
cfg = defaultConfiguration
    { deployCommand =  "rsync -avz -e 'ssh -p21098' _site/ \ 
                        \adarycts@server47.web-hosting.com:~/www" }
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y"
  `mappend` defaultContext

archiveCtx posts =
  listField "posts" postCtx (return posts)
  `mappend` constField "title" "Archives"
  `mappend` defaultContext

main :: IO ()
main = hakyllWith cfg $ do
  forM_ ["fonts/*", "assets/*", "css/*", "js/*"] $ \x -> match x $ do
    route idRoute
    compile $ copyFileCompiler

  match ("**.md" .&&. complement "README.md" .&&. complement "**index.md") $ do
    route $ setExtension "html"
    compile $ pandocCompilerWith defaultHakyllReaderOptions withToc
      >>= loadAndApplyTemplate "templates/post.html" defaultContext
      >>= relativizeUrls

  match "**index.md" $ do
     route $ setExtension "html"
     compile $ compiler
      >>= loadAndApplyTemplate "templates/index.html" defaultContext
      >>= relativizeUrls


  match "templates/*" $ compile templateCompiler

  create ["posts.html"] $ do
    route $ setExtension "html"
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      makeItem ""
        >>= loadAndApplyTemplate "templates/list.html" (archiveCtx posts)
        >>= loadAndApplyTemplate "templates/index.html" postCtx
        >>= relativizeUrls
  where
    withToc= defaultHakyllWriterOptions{ 
      writerTableOfContents = True,
      writerTemplate = Just "$if(toc)$\n<h2>Table of Contents</h2>$toc$\n\
        \$endif$\n$body$",
      writerHTMLMathMethod = MathJax "" 
    }


compiler :: Compiler (Item String)
compiler = pandocCompilerWith defaultHakyllReaderOptions pandocOptions

pandocOptions :: WriterOptions
pandocOptions = defaultHakyllWriterOptions{ writerHTMLMathMethod = MathJax "" }
