-- Lists all bands with Glam rock as their main style, ranked by their longevity.

-- Selects band_name and calculates the lifespan of each band.
SELECT band_name, (IFNULL(split, '2020') - formed) AS lifespan
    FROM metal_bands
    WHERE FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0 -- Filters bands with 'Glam rock' in their style, considering null as an empty string
    ORDER BY lifespan DESC; -- Orders the result by the calculated lifespan in descending order