SELECT *
  FROM [PortfolioProject].[dbo].[NashvilleHousing]


-- date format

SELECT SaleDate, SaleDateconverted
  FROM [PortfolioProject].[dbo].[NashvilleHousing]

Alter table NashvilleHousing
add SaleDateconverted Date

UPDATE NashvilleHousing
SET SaleDateconverted = convert (date, SaleDate)


--POPULATE PROPERTY ADDRESS DATA
Select *, PropertyAddress
from NashvilleHousing
--where propertyAddress is NULL
order by parcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL (a.PropertyAddress, b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
	on a.ParcelID= b.ParcelID
	and a.UniqueID <> b.UniqueID
	where a.propertyAddress is null
-- IN THE ABOVE QUERY IN ISNULL WE HAVE ENTERED THE PROPERTY ADDRESS WHICH IS NULL AND WE WILL REPLACE IT WITH THE OTHER PART OF THE COMMA, FOR EXAMPLE IN THIS ONE
--WE HAD NULL VALUES IN PROPERTY, WE FOUND OUT THE NULL VALUES BY SELF CMOPARING / SELF JOIN, and from here we can update the new column in property adress.



UPDATE a
set PropertyAddress= ISNULL (a.PropertyAddress, b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
	on a.ParcelID= b.ParcelID
	and a.UniqueID <> b.UniqueID
	where a.propertyAddress is null

-- in the above query we have updated the property address with the new column which we had created after comparing it with self join,
-- and now if we check there is no null values in the property address 


