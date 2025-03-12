<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="registrationForm.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <div class="container mt-5">
    <div class="row justify-content-center">

        <div class="col-md-6 col-lg-8">
            <div class="card shadow-lg">

                <div class="card-header bg-primary text-white text-center">
                    <h2>Registration Form</h2>
                </div>
                <div class="card-body">
            

                        <!-- Name Fields -->

                                  <div class="row">
                            <!-- Last Name -->
                                    <div class="col-md-3 mb-3">
                                <label class="form-label">Last Name:</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ControlToValidate="txtLastName" ErrorMessage="Last Name is required!" 
                                    ForeColor="Red" Display="Dynamic" CssClass="small text-danger" />
                            </div>

                            <!-- First Name -->
                                     <div class="col-md-3 mb-3">
                                <label class="form-label">First Name:</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ControlToValidate="txtFirstName" ErrorMessage="First Name is required!" 
                                    ForeColor="Red" Display="Dynamic" CssClass="small text-danger" />
                            </div>

                            <!-- Middle Initial -->
                                   <div class="col-md-3 mb-3">
                                <label class="form-label">Middle Initial:</label>
                                <asp:TextBox ID="txtMiddleInitial" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                            </div>

                            <!-- Suffix -->
                            <div class="col-md-2 mb-3">
                                <label class="form-label">Suffix:</label>
                                <asp:DropDownList ID="ddlSuffix" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="None" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Jr." Value="Jr."></asp:ListItem>
                                    <asp:ListItem Text="Sr." Value="Sr."></asp:ListItem>
                                    <asp:ListItem Text="II" Value="II"></asp:ListItem>
                                    <asp:ListItem Text="III" Value="III"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                      
                            <div class="row">
                                  <div class="col-md-3 mb-3">
                                     <label class="form-label">Country:</label>
                                     <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" 
                                         AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                     </asp:DropDownList>
                                 </div>

                         <div class="col-md-3 mb-3">
                             <label class="form-label">Province/State:</label>
                            <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" Enabled="false"/>
                             <asp:RequiredFieldValidator ID="rfvProvince" runat="server" 
                                 ControlToValidate="ddlProvince" InitialValue=""
                                 ErrorMessage="Please select a province!" ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>

                         </div>

                     <div class="col-md-3 mb-3">
                         <label class="form-label">City:</label>
                         <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                             ControlToValidate="txtCity" ErrorMessage="City is required!" 
                             ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                     </div>

                           <div class="col-md-2 mb-3">
                         <label class="form-label">ZIP Code:</label>
                         <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                             ControlToValidate="txtZip" ErrorMessage="ZIP Code is required!" 
                             ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                     </div>

                     <div class="row">


<!-- Gender -->
<div class="col-md-6 mb-3">
    <label class="form-label">Gender:</label>
    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CssClass="gender-options">
        <asp:ListItem Text="Male" Value=" Male"></asp:ListItem>
        <asp:ListItem Text="Female" Value=" Female"></asp:ListItem>
        <asp:ListItem Text="Other" Value=" Other"></asp:ListItem>
    </asp:RadioButtonList>

    <!-- Custom Validator for Gender -->
    <asp:CustomValidator ID="cvGender" runat="server" 
        OnServerValidate="cvGender_ServerValidate" 
        ErrorMessage="Please select a gender." 
        ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
</div>







                            <div class="col-md-6 mb-3">
                                <label class="form-label">Birthdate:</label>
                                <asp:TextBox ID="txtBirthdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvBirthdate" runat="server" 
                                    ControlToValidate="txtBirthdate" ErrorMessage="Birthdate is required!" 
                                    ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                            </div>
                     

                        <!-- Email -->
                     <div class="col-md-6 mb-3">
                            <label class="form-label">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email is required!" 
                                ForeColor="Red" Display="Dynamic" CssClass="small text-danger" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                                ErrorMessage="Enter a valid email address!" ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                        </div>
                          
                         <div class="col-md-6 mb-3">
                           <label class="form-label">Phone Number:</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                                ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required!" 
                                ForeColor="Red" Display="Dynamic" CssClass="small text-danger" />
                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                                ControlToValidate="txtPhoneNumber" 
                                ValidationExpression="^\+?[0-9]{1,4}?[-.\s]?[0-9]{1,4}[-.\s]?[0-9]{1,4}[-.\s]?[0-9]{1,9}$" 
                                ErrorMessage="Please enter a valid phone number!" ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                        </div>

                        <!-- Password & Confirm Password -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtPassword" ErrorMessage="Password is required!" 
                                    ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                                  <small id="password-strength" class="form-text"></small>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Confirm Password:</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                                    ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required!" 
                                    ForeColor="Red" Display="Dynamic" CssClass="small text-danger"/>
                                <asp:CompareValidator ID="cvPasswordMatch" runat="server" 
                                    ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
                                    ErrorMessage="Passwords do not match!" ForeColor="Red" 
                                    Display="Dynamic" CssClass="small text-danger"/>
                            </div>
                        </div>

                        <!-- Country, Province, City, ZIP -->
                       
                        </div>
                    </div>


                                            <!-- Submit Button -->
                                            <div class="form-group text-center mt-4">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary btn-lg w-100"
                                                    OnClick="btnSubmit_Click" />
                                            </div>

            
                </div>
                     </div>
                 </div>
            </div>
        </div>
    </div>

            </asp:Panel>
    </asp:Content>