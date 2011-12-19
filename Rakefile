require "rake/clean"

CLEAN << FileList["*.{actual,swc,swf}"]

task :default => :test

swc = "knock.swc"

file swc => FileList["src/**/*"] do |t|
  sh "fcshc -o #{swc} src -lstdio"
end

file "example_test.swf" => [swc, "example_test.as"] do
  sh "fcshc #{swc} --no-rsls example_test.as"
end

task :test => ["example_test.swf", "example_test.expected"] do
  sh "run-swf example_test.swf > example_test.actual"
  patch = `diff -u example_test.{expected,actual}`
  if $? == 0
    puts "ok"
  else
    puts "not ok"
    puts patch.gsub(/^/, "# ")
  end
end
