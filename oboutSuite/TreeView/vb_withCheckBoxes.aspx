﻿<%@ Page Language="VB" %>


<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Classic Style</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>
    <script runat="server">
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(sender As Object, e As EventArgs)
            ' Build the Tree
            ObTree = New Tree() With { _
             .ID = "ObClassicTree", _
             .OnNodeSelect = "cancelSelect" _
            }
            Dim nodeProducts As New Node() With { _
             .Text = "Products", _
             .Expanded = True _
            }
            Me.ObTree.Nodes.Add(nodeProducts)

            Dim nodeControls As New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>ASP.NET Controls", _
             .Expanded = True _
            }
            nodeProducts.ChildNodes.Add(nodeControls)

            nodeControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>Grid", _
             .Value = "Grid" _
            })
            nodeControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>Calendar", _
             .Value = "Calendar" _
            })
            nodeControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>Interface Controls", _
             .Value = "Interface" _
            })

            Dim nodeAjaxControls As New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>ASP.NET Ajax Controls", _
             .Expanded = True _
            }
            nodeControls.ChildNodes.Add(nodeAjaxControls)

            nodeAjaxControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>FileUpload", _
             .Value = "FileUpload" _
            })
            nodeAjaxControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>HTML Editor", _
             .Value = "AjaxEditor" _
            })
            nodeAjaxControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>TreeView", _
             .Value = "TreeView" _
            })

            Dim nodeMvcControls As New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>ASP.NET MVC Controls", _
             .Expanded = True _
            }
            nodeProducts.ChildNodes.Add(nodeMvcControls)

            nodeMvcControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>Interface Controls", _
             .Value = "MVCInterface" _
            })
            nodeMvcControls.ChildNodes.Add(New Node() With { _
             .Text = "<input type='checkbox' onclick='checkboxClick(this)'>HTML Editor", _
             .Value = "MVCEditor" _
            })

            Me.TreePlaceHolder.Controls.Add(ObTree)
        End Sub

        ' button's OnClick event's handler
        Protected Sub getCheckedNodes(sender As Object, e As EventArgs)
            ' reset the result label
            resultLabel.Text = ""
            ' if something was checked in the Tree
            If Not String.IsNullOrEmpty(checkedNodes.Value) Then
                ' indexes of checked nodes
                Dim nodeIndexes As String() = checkedNodes.Value.Split(New Char() {";"c})
                ' go through all these nodes
                For i As Integer = 0 To nodeIndexes.Length - 1
                    ' parse the current index
                    Dim indexes As String() = nodeIndexes(i).Split(New Char() {":"c})
                    ' from the root
                    Dim nodes As NodeCollection = ObTree.Nodes
                    Dim node As Node = Nothing
                    ' search for the node
                    For j As Integer = 0 To indexes.Length - 1
                        Dim index As Integer = Integer.Parse(indexes(j))
                        node = nodes(index)
                        ' to look the child nodes
                        nodes = node.ChildNodes
                    Next
                    '
                    ' Here we collect the checked nodes that have the 'Value' property set
                    '
                    If Not String.IsNullOrEmpty(node.Value) Then
                        resultLabel.Text += "<span style='color:blue'>" + node.Value & "</span><br />"
                    End If
                Next
            End If
        End Sub
    </script>
    <script type="text/javascript">
        // array of indexes of the checked nodes
        var checkedNodesList = null;
        // on checkbox clicked
        function checkboxClick(checkBox) {
            // the client-side treeview object
            var treeView = $find("<%= ObTree.ClientID %>");
            // process the the node on checkbox clicked
            addRemoveNode(treeView, treeView.getNodeByIndex(treeView.getNodeIndex(checkBox)), checkBox.checked);
        }
        // process the the node on checkbox clicked
        function addRemoveNode(tree, node, checked) {
            // get node index
            var nodeIndex = tree.getNodeIndex(node);
            // add/remove it to/from the checked nodes array
            if (checked) {
                addToNodesList(nodeIndex);
            } else {
                removeFromNodesList(nodeIndex)
            }
            // set the 'checked' status for the child nodes
            prepareChilds(tree, node, checked);
            // check the 'checked' status for the parent nodes
            prepareParents(tree, node, checked);
        }
        // check the 'checked' status for the parent nodes
        function prepareParents(tree, node, checked) {
            var parent = tree.getParentNode(node);
            // has a parent?
            if (parent != null) {
                // all child nodes of the parent
                var childNodes = tree.getChildNodes(parent);
                // number of nodes with checkboxes
                var withCheckBoxNumber = 0;
                // number of 'checked' nodes
                var checkedNumber = 0;
                // go throw all the child nodes
                for (var i = 0; i < childNodes.length; i++) {
                    var childNode = childNodes[i];
                    var checkBox = getCheckBox(tree, childNode);
                    if (checkBox != null) {
                        withCheckBoxNumber++;
                        if (checkBox.checked) {
                            checkedNumber++;
                        }
                    }
                }
                var checkBox = getCheckBox(tree, parent);
                //if the parent has checkbox only
                if (checkBox != null) {
                    // set its status
                    checkBox.checked = (withCheckBoxNumber == checkedNumber);
                    // get node index
                    var nodeIndex = tree.getNodeIndex(parent);
                    // add/remove it to/from the checked nodes array
                    if (checkBox.checked) {
                        addToNodesList(nodeIndex);
                    } else {
                        removeFromNodesList(nodeIndex)
                    }
                }
                // go up recursively
                prepareParents(tree, parent, checked);
            }
        }
        // set the 'checked' status for the child nodes
        function prepareChilds(tree, node, checked) {
            // has child nodes?
            if (tree.hasChildNode(node)) {
                // get child nodes
                var childNodes = tree.getChildNodes(node);
                // go through all chieldren
                for (var i = 0; i < childNodes.length; i++) {
                    // current child node
                    var childNode = childNodes[i];
                    // get its checkbox
                    var checkBox = getCheckBox(tree, childNode);
                    if (checkBox != null) { // if exists
                        checkBox.checked = checked; // set it
                        // get node index
                        var nodeIndex = tree.getNodeIndex(childNode);
                        // add/remove it to/from the checked nodes array
                        if (checkBox.checked) {
                            addToNodesList(nodeIndex);
                        } else {
                            removeFromNodesList(nodeIndex)
                        }
                    }
                    // go down recursively
                    prepareChilds(tree, childNode, checked);
                }
            }
        }
        // returns the 'checkbox' input element from the node
        // null - if not found
        function getCheckBox(tree, node) {
            // get the container element with the 'text'
            var txtContainer = tree._getNodeTextContainer(node);
            // look for the 'input' with 'checkbox' type
            var element = txtContainer.firstChild;
            while (element) {
                if (element.nodeType == 1 && element.tagName.toUpperCase() == "INPUT" && element.type.toUpperCase() == "CHECKBOX") {
                    return element;
                }
                element = element.nextSibling;
            }
            return null;
        }

        // Functions for the checked nodes array manipulations

        // prepare the hidden input to be passed to the server
        function prepareNodesList() {
            // sort it before
            checkedNodesList.sort();
            $get("<%= checkedNodes.ClientID %>").value = checkedNodesList.join(";");
        }
        // whether the array already contains the item
        function containsInNodesList(nodeIndex) {
            if (checkedNodesList == null) {
                checkedNodesList = new Array();
            }
            return Array.contains(checkedNodesList, nodeIndex);
        }
        // add the item (node index) to the array
        function addToNodesList(nodeIndex) {
            if (!containsInNodesList(nodeIndex)) {
                Array.add(checkedNodesList, nodeIndex);
                prepareNodesList()
            }
        }
        // remove the item (node index) from the array
        function removeFromNodesList(nodeIndex) {
            if (containsInNodesList(nodeIndex)) {
                Array.remove(checkedNodesList, nodeIndex);
                prepareNodesList()
            }
        }

        // on node select
        function cancelSelect(sender, args) {
            // cancel any selection
            args.cancel = true;
        }

        // apply 'method' on all checkboxes
        function applyOnCheckboxes(treeView, method) {
            // apply on the node
            function doIt(node) {
                // get its checkbox
                var checkBox = getCheckBox(treeView, node);
                if (checkBox != null && typeof method == "function") { // if exists
                    // apply the method on it
                    method.apply(checkBox);
                }
                if (treeView.hasChildNode(node)) { // if it has child nodes
                    // get child nodes
                    var childNodes = treeView.getChildNodes(node);
                    // go through all chieldren
                    for (var i = 0; i < childNodes.length; i++) {
                        // current child node
                        var childNode = childNodes[i];
                        // the same for the child
                        doIt(childNode);
                    }
                }
            }
            // from the root
            doIt(treeView.getNodeByIndex("0"));
        }

        // on page load
        function pageLoad(sender, e) {
            // our TreeView component
            var treeView = $find("<%= ObTree.ClientID %>");
            // on request invoke
            function invokingRequest() {
                // remove this handler
                Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
                // disable submit button
                $get("<%= sendButton.ClientID %>").disabled = true;
                // show the 'wait' image
                $get("wait").style.visibility = "visible";
                // disable all checkboxes in the tree
                applyOnCheckboxes(treeView, function () { this.disabled = true; });
            }
            // add the handler
            Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
            // enable submit button
            $get("<%= sendButton.ClientID %>").disabled = false;
            // hide the 'wait' image
            var wait = $get("wait");
            wait.style.visibility = "hidden";
            wait.style.height = document.getElementById("<%=sendButton.ClientID%>").offsetHeight + "px";
            // enable all checkboxes in the tree
            applyOnCheckboxes(treeView, function () { this.disabled = false; });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=VBNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - With checkboxes</h2>
    <br />
    <table border="0">
        <tr>
            <td valign="top">
                <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td valign="top" style="padding-left:50px;">
                Click the button below to pass the checked nodes to the server-side:
                <br /><br />
                <center>
                    <asp:Button runat="server" Text="Send info" ID="sendButton" OnClick="getCheckedNodes" />
                    <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
                    <br /><br />
                    <b>Checked values:</b>
                    <br /><br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label runat="server" ID="resultLabel">
                            </asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="sendButton" />
                        </Triggers>
                    </asp:UpdatePanel>
                </center>
                <!-- Hidden field for transfer the indexes of the checked nodes to the server-side-->
                <asp:HiddenField runat="server" ID="checkedNodes" Value="" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
