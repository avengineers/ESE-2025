class Test_MyVariant:
    variant = "MyVariant"

    @pytest.mark.build
    def test_build(self):
        # Arrange
        spl_build: SplBuild = SplBuild(variant=self.variant, build_kit="prod", target="build")

        # Act
        result = spl_build.execute()

        # Assert
        assert result == 0, "Building failed"

    @pytest.mark.unittests
    def test_unittests(self):
        # Arrange
        spl_build: SplBuild = SplBuild(variant=self.variant, build_kit="test", target="unittests")

        # Act
        result = spl_build.execute()

        # Assert
        assert result == 0, "Building failed"
