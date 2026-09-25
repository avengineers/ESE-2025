-- Pandoc Lua filter: renders mermaid code blocks to PNG via mmdc
-- Usage: pandoc --lua-filter=mermaid-filter.lua

local counter = 0

function CodeBlock(block)
    if block.classes[1] == "mermaid" then
        counter = counter + 1
        local outdir = os.getenv("MERMAID_OUT_DIR") or "/tmp"
        local outfile = outdir .. "/mermaid-" .. counter .. ".png"
        local infile = os.tmpname()

        -- Write mermaid source to temp file
        local f = io.open(infile, "w")
        f:write(block.text)
        f:close()

        -- Render with mmdc, and stop pandoc if the diagram is not rendered
        local cmd = string.format(
            "mmdc -i %s -o %s -b white -s 2 --puppeteerConfigFile %s",
            infile, outfile,
            os.getenv("PUPPETEER_CONFIG") or "/dev/null"
        )
        local ok = os.execute(cmd)
        os.remove(infile)
        local png = ok and io.open(outfile, "rb")
        if not png then
            error("mmdc failed to render mermaid diagram " .. counter)
        end
        png:close()

        -- Return as image (outdir is absolute: mktemp -d or /tmp)
        return pandoc.Para({
            pandoc.Image({}, outfile, "")
        })
    end
end
