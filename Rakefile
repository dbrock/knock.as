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
  system "run-stdio-swf example_test.swf > example_test.actual"
  ok $? != 0, "exit status should not be 0"
  patch = `diff -u example_test.{expected,actual}`
  ok $? == 0, "output matches expected" do patch end
end

def ok(passed, message)
  puts "#{"not " unless passed}ok - #{message}"
  puts yield.gsub(/^/, "# ") unless passed
end
