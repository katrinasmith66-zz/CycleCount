﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_layout_survey.aspx.cs" Inherits="SuperForm_aspnet_layout_survey" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Multi-Step Survey</b></span>
    
    <br /><br />

    <obout:SuperForm ID="SuperForm1" 
        Width="480px"
        AutoGenerateRows="false"
        FolderStyle="styles/black_glass"
        Title="Company Survey"
        AutoGenerateInsertButton ="false"
        AutoGenerateEditButton="false"
        AutoGenerateDeletebutton="false"
        DataKeyNames="EmployeeID"
        RunAt="server"
        AllowPaging="false"
        DefaultMode="Insert"
        OnItemInserting="SuperForm1_ItemInserting">
        <Fields> 
            <obout:TemplateField HeaderText="1) Please describe your position with the company:" FieldSetID="FieldSet1">
                <ItemTemplate>
                    1) Please describe your position with the company:
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="Q1">
                        <obout:OboutTextBox runat="server" ID="txt1" TextMode="MultiLine" Height="70" Width="400" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt1" ErrorMessage="*" />
                    </div>
                </EditItemTemplate>
            </obout:TemplateField>
            <obout:TemplateField HeaderText="2) How long have you worked for the company?" FieldSetID="FieldSet1">
                <ItemTemplate>
                    2) How long have you worked for the company?
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="Q2">
                        <obout:OboutDropDownList ID="OboutDropDownList1" runat="server" Width="400">
                            <asp:ListItem runat="server" Value="1" Text="Less than 1 Year" />
                            <asp:ListItem runat="server" Value="2" Text="1-2 Years" />
                            <asp:ListItem runat="server" Value="3" Text="3-4 Years" />
                            <asp:ListItem runat="server" Value="4" Text="5-6 Years" />
                            <asp:ListItem runat="server" Value="5" Text="7-8 Years" />
                            <asp:ListItem runat="server" Value="6" Text="9-10 Years" />
                            <asp:ListItem runat="server" Value="7" Text="More than 10 Years" />
		                 </obout:OboutDropDownList>
                    </div>
                </EditItemTemplate>
            </obout:TemplateField>
                <obout:TemplateField HeaderText="3) Employees have a voice in major decisions regarding changes in the work environment." FieldSetID="FieldSet2">
                    <ItemTemplate>
                        3) Employees have a voice in major decisions regarding changes in the work environment.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q3" >
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton31" GroupName="g1"
		                         Text="Strongly Disagree" Width="125" />
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton32" GroupName="g1" Width="75"
		                         Text="Disagree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton33" GroupName="g1" Width="65"
		                         Text="Agree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton34" GroupName="g1" Width="100"
		                         Text="Strongly Agree" />

                            <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validateQuestion3" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>         
            
                <obout:TemplateField HeaderText="4) I have received the in-house training I need to get my job done." FieldSetID="FieldSet2">
                    <ItemTemplate>
                        4) I have received the in-house training I need to get my job done.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q3">
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton41" GroupName="g2"
		                         Text="Strongly Disagree" Width="125"/>
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton42" GroupName="g2" Width="75"
		                        Text="Disagree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton43" GroupName="g2" Width="65"
		                        Text="Agree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton44" GroupName="g2" Width="100"
		                        Text="Strongly Agree" />

                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="validateQuestion4" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>
                <obout:TemplateField HeaderText="5) The environment of the workplace is comfortable and safe." FieldSetID="FieldSet2">
                    <ItemTemplate>
                        5) The environment of the workplace is comfortable and safe.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q3">
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton51" GroupName="g3"
		                        Text="Strongly Disagree" Width="125"/>
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton52" GroupName="g3" 
		                         Text="Disagree" Width="75"/>
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton53" GroupName="g3" 
		                         Text="Agree" Width="65"/>
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton54" GroupName="g3" 
		                         Text="Strongly Agree" Width="100" />

                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validateQuestion5" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>
                <obout:TemplateField HeaderText="6) Employees are treated fairly and equally." FieldSetID="FieldSet3">
                    <ItemTemplate>
                        6) Employees are treated fairly and equally.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q4">
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton61" GroupName="g4"
		                        Text="Strongly Disagree" Width="125"/>
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton62" GroupName="g4" Width="75"
		                         Text="Disagree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton63" GroupName="g4" Width="65"
		                         Text="Agree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton64" GroupName="g4" Width="100"
		                         Text="Strongly Agree" />

                            <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="validateQuestion6" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>
                <obout:TemplateField HeaderText="7) Management listens to employees." FieldSetID="FieldSet3">
                    <ItemTemplate>
                        7) Management listens to employees.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q4">
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton71" GroupName="g5"
		                        Text="Strongly Disagree" Width="125"/>
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton72" GroupName="g5" Width="75"
		                         Text="Disagree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton73" GroupName="g5" Width="65"
		                         Text="Agree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton74" GroupName="g5" Width="100"
		                         Text="Strongly Agree" />

                            <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="validateQuestion7" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>
                <obout:TemplateField HeaderText="8) I feel under a great deal of stress on my job." FieldSetID="FieldSet3">
                    <ItemTemplate>
                        8) I feel under a great deal of stress on my job.
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="Q4">
                            <obout:OboutRadioButton  runat="server" ID="OboutRadioButton81" GroupName="g6"
		                        Text="Strongly Disagree" Width="125"/>
		                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton82" GroupName="g6" Width="75"
		                         Text="Disagree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton83" GroupName="g6" Width="65"
		                         Text="Agree" />
                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton84" GroupName="g6" Width="100"
		                         Text="Strongly Agree" />

                            <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validateQuestion8" ErrorMessage="*" />
                        </div>
                    </EditItemTemplate>
                </obout:TemplateField>
            <obout:TemplateField HeaderText="9) Please rate the following areas by level of importance with 1 being most important and 6 being least important." FieldSetID="FieldSet4">
                <ItemTemplate>
                    9) Please rate the following areas by level of importance with 1 being most important and 6 being least important.
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="Q5">
                        <div id="scaleNumber">1&#160;&#160;&#160;&#160;2&#160;&#160;&#160;&#160;3&#160;&#160;&#160;&#160;4&#160;&#160;&#160;&#160;5&#160;&#160;&#160;&#160;6</div>
                        <ul class="no-bullet" id="textArea">
                            <li>Employee recognition program</li>
                            <li>Ability to make decisions</li>
                            <li>Comfortable work environment</li>
                            <li>Employee training program</li>
                            <li>Company picnic</li>
                            <li>Christmas party</li>
                        </ul>
                        <div id="radiosAreas">
                            <div>
                                    <obout:OboutRadioButton  runat="server" ID="OboutRadioButton91" GroupName="g7" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton92" GroupName="g7" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton93" GroupName="g7"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton94" GroupName="g7" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton95" GroupName="g7"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton96" GroupName="g7" />

                                    <asp:CustomValidator ID="CustomValidator91" runat="server" ClientValidationFunction="validateQuestion91" ErrorMessage="*" />
                            </div>
                            <div>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton97" GroupName="g8" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton98" GroupName="g8" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton99" GroupName="g8"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton910" GroupName="g8" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton911" GroupName="g8"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton912" GroupName="g8" />

                                    <asp:CustomValidator ID="CustomValidator92" runat="server" ClientValidationFunction="validateQuestion92" ErrorMessage="*" />
                            </div>
                            <div>
                                    <obout:OboutRadioButton  runat="server" ID="OboutRadioButton913" GroupName="g9" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton914" GroupName="g9" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton915" GroupName="g9"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton916" GroupName="g9" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton917" GroupName="g9"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton918" GroupName="g9" />

                                    <asp:CustomValidator ID="CustomValidator93" runat="server" ClientValidationFunction="validateQuestion93" ErrorMessage="*" />
                             </div>
                             <div>
                                    <obout:OboutRadioButton  runat="server" ID="OboutRadioButton919" GroupName="g10" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton920" GroupName="g10" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton921" GroupName="g10"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton922" GroupName="g10" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton923" GroupName="g10"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton924" GroupName="g10" />

                                    <asp:CustomValidator ID="CustomValidator94" runat="server" ClientValidationFunction="validateQuestion94" ErrorMessage="*" />
                              </div>
                              <div>
                                    <obout:OboutRadioButton  runat="server" ID="OboutRadioButton925" GroupName="g11" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton926" GroupName="g11" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton927" GroupName="g11"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton928" GroupName="g11" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton929" GroupName="g11"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton930" GroupName="g11" />

                                    <asp:CustomValidator ID="CustomValidator95" runat="server" ClientValidationFunction="validateQuestion95" ErrorMessage="*" />
                              </div>
                              <div>
                                    <obout:OboutRadioButton  runat="server" ID="OboutRadioButton931" GroupName="g12" />
		                            <obout:OboutRadioButton runat="server" ID="OboutRadioButton932" GroupName="g12" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton933" GroupName="g12"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton934" GroupName="g12" />
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton935" GroupName="g12"/>
                                    <obout:OboutRadioButton runat="server" ID="OboutRadioButton936" GroupName="g12" />

                                    <asp:CustomValidator ID="CustomValidator96" runat="server" ClientValidationFunction="validateQuestion96" ErrorMessage="*" />
                             </div>
                        </div>
                    </div>
                </EditItemTemplate>
            </obout:TemplateField>


            <obout:TemplateField FieldSetID="FieldSet5">
                <ItemTemplate>
                    <span id="PreviousButtonContainer" style="display: none;"><obout:OboutButton ID="OboutButton1" runat="server" Text="Back" OnClientClick="moveToPreviousStep(); return false" /></span>
                    <span id="NextButtonContainer"><obout:OboutButton ID="OboutButton2" runat="server" Text="Next" OnClientClick="moveToNextStep(); return false" /></span>
                    <span id="SaveButtonContainer" style="display: none;"><obout:OboutButton ID="OboutButton3" runat="server" Text="Save" CommandName="Insert" /></span>
                </ItemTemplate>
            </obout:TemplateField>
        </Fields>
        <FieldSets>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet1" Direction="Horizontal" CssClass="field-set field-set-visible" />                
            </obout:FieldSetRow>                         
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet2" Direction="Horizontal" CssClass="field-set field-set-visible field-set-hidden" />
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet3" Direction="Horizontal" CssClass="field-set field-set-visible field-set-hidden" />
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet4" Direction="Horizontal" CssClass="field-set field-set-visible field-set-hidden" />
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet5" Direction="Horizontal" CssClass="field-set field-set-buttons" ColumnSpan="2" HorizontalAlign="Center" />
            </obout:FieldSetRow>
        </FieldSets>
        <FieldHeaderStyle Width="200" />
    </obout:SuperForm>

    <div class="tdText">
        <asp:Panel runat="server" ID="Panel1" Visible="false">
            The following data can be stored in the database or sent by e-mail:<br /><br />
            
            <b>1) Please describe your position with the company:</b><br />
            <asp:Literal ID="Question1Answer" runat="server" />

            <br /><br />

            <b>2) Please describe your position with the company:</b><br />
            <asp:Literal ID="Question2Answer" runat="server" />

            <br /><br />

            <b>3) Employees have a voice in major decisions regarding changes in the work environment:</b><br />
            <asp:Literal ID="Question3Answer" runat="server" />

            <br /><br />

            <b>4) I have received the in-house training I need to get my job done:</b><br />
            <asp:Literal ID="Question4Answer" runat="server" />
                    
            <br /><br />

            <b>5) The environment of the workplace is comfortable and safe:</b><br />
            <asp:Literal ID="Question5Answer" runat="server" />

            <br /><br />

            <b>6) Employees are treated fairly and equally:</b><br />
            <asp:Literal ID="Question6Answer" runat="server" />

            <br /><br />

            <b>7) Management listens to employees:</b><br />
            <asp:Literal ID="Question7Answer" runat="server" />

            <br /><br />

            <b>8) I feel under a great deal of stress on my job:</b><br />
            <asp:Literal ID="Question8Answer" runat="server" />

            <br /><br />

            <b>9) Please rate the following areas by level of importance with 1 being most important and 6 being least important:</b><br />
            <asp:Literal ID="Literal1" runat="server" />
             
            <ul class="no-bullet">
                <li><b>Employee recognition program:</b> <asp:Literal ID="Question91Answer" runat="server" /></li>
                <li><b>Ability to make decisions:</b> <asp:Literal ID="Question92Answer" runat="server" /></li>
                <li><b>Comfortable work environment:</b> <asp:Literal ID="Question93Answer" runat="server" /></li>
                <li><b>Employee training program:</b> <asp:Literal ID="Question94Answer" runat="server" /></li>
                <li><b>Company picnic:</b> <asp:Literal ID="Question95Answer" runat="server" /></li>
                <li><b>Christmas party:</b> <asp:Literal ID="Question96Answer" runat="server" /></li>
            </ul>
             
        </asp:Panel>
    </div>

    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.<br /><br />
        This example showcases the use of the Super Form control to implement a multi-step survey.<br />
        We used <b>TemplateFields</b> to add the input controls required by a survey to the Super Form.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_fRwF span
        {
            position: static !important;            
        }
        
        td.field-set
        {
            padding-left: 0px !important;
            padding-right:0px !important;
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
        
        td.field-set .ob_fRwH, td.field-set .ob_fRwF 
        {
            padding-bottom: 0px !important;
            padding-top: 0px !important;
            width: 470px;
        }
        
        .field-set-visible
        {
            display: block;
        }
        
        .field-set-hidden
        {
            display: none;
        }
        
        .field-set-hidden-editor
        {
            visibility: hidden;
            position: absolute;
            display: block;
        }
        
        .field-set-hidden-editor #Q1
        {
            position: absolute;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }     
        
        .field-set-buttons .ob_fRwF
        {
            width: 500px;
            text-align: center !important;
        }
        
        .tabs-border
        {
            height: 2px;
            width: 100%;
            background-image: url(styles/black_glass/images/separator.png);
            top: 38px;
            position: absolute;
        }
        #scaleNumber
        {
            position:absolute;
            left: 254px;
            top: 85px;
        }
        li.no-bullet
        {
            float:left;  
        }  
        .no-bullet
        {
            list-style-type: none;
            line-height: 22px;
        }
        span.ob_iRBtnEl {
            position:absolute !important;
        }
        .Q1, .Q2
        {
            height:67px;
        }
        .Q3
        {
            height:27px;
        }
        .Q4
        {
            height:33px;
        }
        .Q5
        {
            height:130px;
        }
        
        .results th
        {
            width: 200px;
        }     
        #radiosAreas
        {
            position:absolute;
            left: 250px;
            top: 100px;
    
        }   
    </style>

    <script type="text/javascript">
        var lastVisibleFieldSetIndex = 1;
        
        function moveToPreviousStep() {
            if (lastVisibleFieldSetIndex > 1) {
                toggleFieldSets(-1);
                document.getElementById('NextButtonContainer').style.display = '';
                document.getElementById('SaveButtonContainer').style.display = 'none';

                if (lastVisibleFieldSetIndex == 1) {
                    document.getElementById('PreviousButtonContainer').style.display = 'none';
                }
            }
        }

        function moveToNextStep() {
            if (!Page_ClientValidate()) {
                return;
            }            
            
            if (lastVisibleFieldSetIndex < 4) {
                toggleFieldSets(1);
                document.getElementById('PreviousButtonContainer').style.display = '';

                if (lastVisibleFieldSetIndex == 4) {
                    document.getElementById('NextButtonContainer').style.display = 'none';
                    document.getElementById('SaveButtonContainer').style.display = '';
                }
            }
        }

        function toggleFieldSets(increment) {
            var currentFieldSet = getFieldSetByIndex(lastVisibleFieldSetIndex);
            currentFieldSet.className = currentFieldSet.className.replace(/field-set-visible/g, 'field-set-hidden');

            var newFieldSet = getFieldSetByIndex(lastVisibleFieldSetIndex + increment);
            newFieldSet.className = newFieldSet.className.replace(/field-set-hidden/g, 'field-set-visible');

            lastVisibleFieldSetIndex += increment;
        }

        function getFieldSetByIndex(index) {
            var container = document.getElementById('__dvctl00_ContentPlaceHolder1_SuperForm1__div').firstChild;
            while (container.className != 'ob_fC') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TABLE') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TBODY') {
                container = container.nextSibling;
            }

            var increment = 1;

            if (container.firstChild.nodeName != 'TR') {
                increment++;
            }

            var fieldSet = container.childNodes[index - increment].firstChild
            while (fieldSet.nodeName != 'TD') {
                fieldSet = fieldSet.nextSibling;
            }

            return fieldSet;
        }

        function validateQuestion3(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton31.checked() || OboutRadioButton32.checked() || OboutRadioButton33.checked() || OboutRadioButton34.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion4(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton41.checked() || OboutRadioButton42.checked() || OboutRadioButton43.checked() || OboutRadioButton44.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
        function validateQuestion5(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton51.checked() || OboutRadioButton52.checked() || OboutRadioButton53.checked() || OboutRadioButton54.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion6(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton61.checked() || OboutRadioButton62.checked() || OboutRadioButton63.checked() || OboutRadioButton64.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion7(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton71.checked() || OboutRadioButton72.checked() || OboutRadioButton73.checked() || OboutRadioButton74.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion8(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton81.checked() || OboutRadioButton82.checked() || OboutRadioButton83.checked() || OboutRadioButton84.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion91(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton91.checked() || OboutRadioButton92.checked() || OboutRadioButton93.checked() || OboutRadioButton94.checked() || OboutRadioButton95.checked() || OboutRadioButton96.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion92(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton97.checked() || OboutRadioButton98.checked() || OboutRadioButton99.checked() || OboutRadioButton910.checked() || OboutRadioButton911.checked() || OboutRadioButton912.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion93(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton913.checked() || OboutRadioButton914.checked() || OboutRadioButton915.checked() || OboutRadioButton916.checked() || OboutRadioButton917.checked() || OboutRadioButton918.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion94(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton919.checked() || OboutRadioButton920.checked() || OboutRadioButton921.checked() || OboutRadioButton922.checked() || OboutRadioButton923.checked() || OboutRadioButton924.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion95(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton925.checked() || OboutRadioButton926.checked() || OboutRadioButton927.checked() || OboutRadioButton928.checked() || OboutRadioButton929.checked() || OboutRadioButton930.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
        function validateQuestion96(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton931.checked() || OboutRadioButton932.checked() || OboutRadioButton933.checked() || OboutRadioButton934.checked() || OboutRadioButton935.checked() || OboutRadioButton936.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
	</script>
</asp:Content>

