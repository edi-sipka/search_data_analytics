require 'fuzzystringmatch'
def related_article(article1, article2)
    jarow = FuzzyStringMatch::JaroWinkler.create(:native)
    distance = jarow.getDistance(article1.delete(' '), article2.delete(' '))
    distance > 0.5
  end