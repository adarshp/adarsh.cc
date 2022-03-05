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
------------
-- Contexts
------------
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y"
  `mappend` defaultContext

archiveCtx posts =
  listField "posts" postCtx (return posts)
  `mappend` constField "title" "Archives"
  `mappend` defaultContext

------------
-- Rules
------------
compiler :: Compiler (Item String)
compiler = pandocCompilerWith defaultHakyllReaderOptions pandocOptions

pandocOptions :: WriterOptions
pandocOptions = defaultHakyllWriterOptions{ writerHTMLMathMethod = MathJax "" }

templates :: Rules ()
templates = match "templates/*" $ compile templateCompiler

posts :: Rules ()
posts = match ("**.md" .&&. complement "README.md" .&&. complement "**index.md") $ do
    route $ setExtension "html"
    compile $ pandocCompilerWith defaultHakyllReaderOptions withToc
      >>= loadAndApplyTemplate "templates/post.html" defaultContext
      >>= relativizeUrls
  where
    withToc= defaultHakyllWriterOptions{ 
      writerTableOfContents = True,
      writerTemplate = Just "$if(toc)$\n<h2>Table of Contents</h2>$toc$\n\
        \$endif$\n$body$",
      writerHTMLMathMethod = MathJax "" 
    }

archive :: Rules ()
archive = create ["posts.html"] $ do
    route $ setExtension "html"
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      makeItem ""
        >>= loadAndApplyTemplate "templates/list.html" (archiveCtx posts)
        >>= loadAndApplyTemplate "templates/index.html" postCtx
        >>= relativizeUrls

indices :: Rules ()
indices = match "**index.md" $ do
     route $ setExtension "html"
     compile $ compiler
      >>= loadAndApplyTemplate "templates/index.html" defaultContext
      >>= relativizeUrls

static :: Rules ()
static = forM_ ["fonts/*", "assets/*", "css/*", "js/*"] $ \x -> match x $ do
    route idRoute
    compile $ copyFileCompiler


------------
-- Main
------------
main :: IO ()
main = hakyllWith cfg $ do
  static
  indices
  posts
  templates
  archive
