using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace registrationForm
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCountries();
            }
        }

        private void PopulateCountries()
        {
            List<string> countries = new List<string>
            {
                "Select a Country", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia",
                "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
                "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada",
                "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Brazzaville)", "Congo (Kinshasa)",
                "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador",
                "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon",
                "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras",
                "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan",
                "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania",
                "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico",
                "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal",
                "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau",
                "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia",
                "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe",
                "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia",
                "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan",
                "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan",
                "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu",
                "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"
            };

            ddlCountry.DataSource = countries;
            ddlCountry.DataBind();
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCountry = ddlCountry.SelectedValue;
            PopulateProvinces(selectedCountry);
        }

        private void PopulateProvinces(string country)
        {
            ddlProvince.Items.Clear(); // Clear previous selections

            // Dictionary of countries with provinces
            Dictionary<string, List<string>> countryProvinces = new Dictionary<string, List<string>>()
            {
                { "USA", new List<string> { "California", "Texas", "New York", "Florida", "Illinois", "Ohio", "Washington", "Georgia", "Pennsylvania", "Arizona" } },
                { "Canada", new List<string> { "Ontario", "Quebec", "British Columbia", "Alberta", "Manitoba", "Saskatchewan", "Nova Scotia", "New Brunswick" } },
                { "Philippines", new List<string> { "Metro Manila", "Cebu", "Davao", "Laguna", "Batangas", "Pampanga", "Pangasinan", "Bulacan", "Iloilo", "Zamboanga", "Benguet" } },
                { "Australia", new List<string> { "New South Wales", "Victoria", "Queensland", "Western Australia", "South Australia", "Tasmania", "Northern Territory" } },
                { "India", new List<string> { "Maharashtra", "Karnataka", "Tamil Nadu", "Uttar Pradesh", "West Bengal", "Gujarat", "Punjab", "Rajasthan" } },
                { "United Kingdom", new List<string> { "England", "Scotland", "Wales", "Northern Ireland" } }
            };

            // Check if the selected country has provinces
            if (countryProvinces.ContainsKey(country))
            {
                ddlProvince.Enabled = true;
                ddlProvince.Items.Add(new ListItem("Select a Province", ""));

                foreach (string province in countryProvinces[country])
                {
                    ddlProvince.Items.Add(new ListItem(province, province));
                }
            }
            else
            {
                ddlProvince.Enabled = false; // Disable province dropdown if no provinces exist
                ddlProvince.Items.Add(new ListItem("No Provinces Available", ""));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Collect form data
                string firstName = txtFirstName.Text.Trim();
                string middleInitial = txtMiddleInitial.Text.Trim();
                string lastName = txtLastName.Text.Trim(); // Assuming you have a last name field
                string suffix = ddlSuffix.SelectedValue;
                string email = txtEmail.Text.Trim();
                string phoneNumber = txtPhoneNumber.Text.Trim();
                string password = txtPassword.Text.Trim();
                string password2 = txtConfirmPassword.Text.Trim();
                string country = ddlCountry.SelectedValue;
                string province = ddlProvince.SelectedValue;
                string city = txtCity.Text.Trim();
                string zip = txtZip.Text.Trim();
                string birthdate = txtBirthdate.Text.Trim();

                // Handle gender selection (CheckBoxList)
                // Get selected gender
                string selectedGender = rblGender.SelectedValue;

                // Check if no gender is selected
                if (string.IsNullOrEmpty(selectedGender))
                {
                    Response.Write("<script>alert('Please select a gender.');</script>");
                    return;
                }


                // Check if passwords match
                if (password != password2)
                {
                    Response.Write("<script>alert('Passwords do not match!');</script>");
                    return;
                }

                // Example validation check: Ensure a province is selected
                if (province == "Select a Province" || province == "No Provinces Available")
                {
                    Response.Write("<script>alert('Please select a valid province.');</script>");
                    return;
                }

                // Validate phone number format
                if (string.IsNullOrEmpty(phoneNumber) || !IsValidPhoneNumber(phoneNumber))
                {
                    Response.Write("<script>alert('Please enter a valid phone number.');</script>");
                    return;
                }

                // Process the registration data (e.g., save to database)
                string fullName = $"{firstName} {middleInitial} {lastName}".Trim();
                string successMessage = $"Registration successful!\nName: {fullName}\nEmail: {email}\nPhone: {phoneNumber}\nCountry: {country}\nProvince: {province}\nCity: {city}\nZIP: {zip}\nBirthdate: {birthdate}";

                // Display success message
                Response.Write($"<script>alert('{successMessage.Replace("\n", "\\n")}');</script>");
            }
        }

        protected void cvGender_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check kung may napili sa RadioButtonList
            args.IsValid = !string.IsNullOrEmpty(rblGender.SelectedValue);
        }


        private bool IsValidPhoneNumber(string phoneNumber)
        {
            try
            {
                // Define a valid phone number format (you can adjust this regex to match the exact format you need)
                var regex = new System.Text.RegularExpressions.Regex(@"^\+?[0-9]{1,4}?[-.\s]?[0-9]{1,4}[-.\s]?[0-9]{1,4}[-.\s]?[0-9]{1,9}$");
                return regex.IsMatch(phoneNumber);
            }
            catch
            {
                return false;
            }
        }
    }
}
