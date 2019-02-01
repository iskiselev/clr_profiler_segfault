namespace ILrewriterTest
{
    using Xunit;
    using Xunit.Abstractions;

    public class EnvironmentTests
    {
        private readonly ITestOutputHelper output;

        public EnvironmentTests(ITestOutputHelper output)
        {
            this.output = output;
        }

        [Fact]
        public void TestEnableProfiling()
        {
        }
    }
}