var tab = '&nbsp&nbsp&nbsp';

function addAttribute() {
         
    var cell1 = $('#attributeName').val();
    var cell2 = $('#attributeType').val();
    var cell3 = '<input class="btn btn-default btn-sm" type="button" value = "Delete" onClick="Javacsript:deleteRow(this,attributeTable)">';
    $('#attributeTable tr:last').after('<tr><td>'+cell1+'</td><td>'+cell2+'</td><td>'+cell3+'</td></tr>');
    
    $('#attributeType').val('');
    $('#attributeName').val('').focus();
}

function addRelation(relationType) {
         
    var cell1 = $("#relationName").val();
    var cell2 = $("#relationEntity").val();
    var cell3 = relationType;
    var cell4 = '<input class="btn btn-default btn-sm" type="button" value = "Delete" onClick="Javacsript:deleteRow(this,relationTable)">';
    $('#relationTable tr:last').after('<tr><td>'+cell1+'</td><td>'+cell2+'</td><td>'+cell3+'</td><td>'+cell4+'</td></tr>');

    $('#relationName').focus();
    $('#relationName').val('').focus();
}

function deleteRow(obj,table) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    table.deleteRow(index);
}

function generateEntity() {
    var namespace = $('#namespace').val(); 
    var className = $('#className').val();
    $('#contentEntity').text('<?php');
    $('#contentEntity').append('<br><br> namespace '+namespace+';<br><br>/**<br>* Class '+className+'<br>*<br>* @author Antony Deveau<br>* @copyright Class Web 2016<br>*/<br>class '+className+'<br>{<br>');
    $("#attributeTable > tbody > tr").not(':first').each(function(){
        var attributeName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var attributeType = $(this).find('td:nth-child(2)')[0]['textContent'];    
        $('#contentEntity').append(tab+'/**<br>'+tab+'* @var '+attributeType+'<br>'+tab+'*/<br>'+tab+'private $'+attributeName+';<br><br>');   
    });
    $("#relationTable > tbody > tr").not(':first').each(function(){
        var relationName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var relationEntity = $(this).find('td:nth-child(2)')[0]['textContent'];   
        $('#contentEntity').append(tab+'/**<br>'+tab+'* @var '+relationEntity+'<br>'+tab+'*/<br>'+tab+'private $'+relationName+';<br><br>'); 
    });
    $("#relationTable > tbody > tr").not(':first').each(function(){
        var relationName = $(this).find('td:nth-child(1)')[0]['textContent'];   
        var relationType = $(this).find('td:nth-child(3)')[0]['textContent'];
        if(relationType=='OneToOne'||relationType=='OneToMany')
        {
            $('#contentEntity').append(tab+'public function getToEdit'+relationName+'(){<br>'+tab+tab+'if($this->'+relationName+' instanceOf TO_EDIT'+relationName+')<br>'+tab+tab+tab+'return $this->'+relationName+'->getUid();<br>'+tab+tab+'return null; }<br><br>'); 
        }  
        if(relationType=='ManyToOne'||relationType=='ManyToMany')
        {
            $('#contentEntity').append(tab+'public function getToEdit'+relationName+'(){<br>'+tab+tab+'$uids = array();<br>'+tab+tab+'foreach($this->'+relationName+'as $object)<br>'+tab+tab+tab+'if($object instanceOf TO_EDIT'+relationName+')<br>'+tab+tab+tab+tab+'$uids[] = $obejct->getUid();<br>'+tab+tab+'return $this->$uids;}<br><br>'); 
        }
    });
    $('#contentEntity').append('}');
}

function generateDoctrine() {
    $('#contentDoctrine').text('');
    var namespace = $('#namespace').val(); 
    var className = $('#className').val();
    var table = $('#table').val();
    $('#contentDoctrine').append(namespace+'\\Entity\\'+className+':<br>'+tab+'type: entity<br>'+tab+'table: '+table+'<br>'+tab+'repositoryClass: '+namespace+'\\Repository\\'+className+'Repository<br>'+tab+'fields:<br>');
    $("#attributeTable > tbody > tr").not(':first').each(function(){
        var attributeName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var attributeType = $(this).find('td:nth-child(2)')[0]['textContent'];    
        $('#contentDoctrine').append(tab+tab+attributeName+':<br>'+tab+tab+tab+'type: '+attributeType+'<br>');   
    });
    $("#relationTable > tbody > tr").not(':first').each(function(){
        var relationName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var relationEntity = $(this).find('td:nth-child(2)')[0]['textContent'];
        var relationType = $(this).find('td:nth-child(3)')[0]['textContent']; 
        if(relationType=='OneToOne')
        {
            $('#contentDoctrine').append(tab+'oneToOne'+':<br>'+tab+tab+relationName+':<br>'+tab+tab+tab+'targetEntity: '+relationEntity+'<br>'+tab+tab+tab+'joinColumn: <br>'+tab+tab+tab+tab+'name: '+relationName+'_id<br>'+tab+tab+tab+tab+'referencedColumnName: uid<br>');   
        }
        if(relationType=='OneToMany')
        {
            $('#contentDoctrine').append(tab+'oneToMany'+':<br>'+tab+tab+relationName+':<br>'+tab+tab+tab+'targetEntity: '+relationEntity+'<br>'+tab+tab+tab+'mappedBy: '+className+'<br>');   
        }   
        if(relationType=='ManyToOne')
        {
            $('#contentDoctrine').append(tab+'manyToOne'+':<br>'+tab+tab+relationName+':<br>'+tab+tab+tab+'targetEntity: '+relationEntity+'<br>'+tab+tab+tab+'joinColumn: <br>'+tab+tab+tab+tab+'name: '+relationName+'_id<br>'+tab+tab+tab+tab+'referencedColumnName: uid<br>');   
        }
        if (relationType=='ManyToMany')
        {
            $('#contentDoctrine').append(tab+'manyToMany'+':<br>'+tab+tab+relationName+':<br>'+tab+tab+tab+'targetEntity: '+relationEntity+'<br>'+tab+tab+tab+'joinTable: <br>'+tab+tab+tab+tab+'name: TO_EDIT<br>'+tab+tab+tab+tab+'joinColumns:<br>'+tab+tab+tab+tab+tab+'TO_EDIT_ID:<br>'+tab+tab+tab+tab+tab+tab+'referencedColumnName: uid<br>'+tab+tab+tab+tab+'inverseJoinColumns:<br>'+tab+tab+tab+tab+tab+'TO_EDIT_ID<br>'+tab+tab+tab+tab+tab+tab+'referencedColumnName: uid<br>');   
        }
    });
    $('#contentDoctrine').append(tab+'lifecycleCallbacks: {  }<br>');   
}

function generateSerializer() {
    var namespace = $('#namespace').val(); 
    var className = $('#className').val();
    $('#contentSerializer').text('');
    $('#contentSerializer').append(namespace+'\\Entity\\'+className+':<br>'+tab+'exclusion_policy: all<br>'+tab+'properties:<br>');
    $("#attributeTable > tbody > tr").not(':first').each(function(){
        var attributeName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var attributeType = $(this).find('td:nth-child(2)')[0]['textContent'];    
        $('#contentSerializer').append(tab+tab+attributeName+':<br>'+tab+tab+tab+'type: '+attributeType+'<br>');   
    });
    $("#relationTable > tbody > tr").not(':first').each(function(){
        var relationName = $(this).find('td:nth-child(1)')[0]['textContent']; 
        $('#contentSerializer').append(tab+'virtual_properties:<br>');   
        $('#contentSerializer').append(tab+tab+'getToEdit'+relationName+':<br>'+tab+tab+tab+'serialized_name: '+relationName+'<br>');   
    });
}

function generateEmber() {
    $('#contentEmber').text('');
    $('#contentEmber').append('import DS from \'ember-data\';<br>import Resource from \'./resource\';<br><br>export default Resource.extend({<br>'+tab+'/** Attributes */<br>');
    $("#attributeTable > tbody > tr").not(':first').each(function(){
        var attributeName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var attributeType = $(this).find('td:nth-child(2)')[0]['textContent'];
        if(attributeType=='integer'||attributeType=='float')
        {
            attributeType = 'number';
        }
        else if(attributeType=='array')
        {
            attributeType='';
        }
        $('#contentEmber').append(tab+attributeName+': DS.attr(\''+attributeType+'\'),<br>');   
    });
    $('#contentEmber').append(tab+'/** Relations */<br>');   
    $("#relationTable > tbody > tr").not(':first').each(function(){
        var relationName = $(this).find('td:nth-child(1)')[0]['textContent'];
        var relationEntity = $(this).find('td:nth-child(2)')[0]['textContent'];
        var relationType = $(this).find('td:nth-child(3)')[0]['textContent'];
        if(relationType=='OneToOne'||relationType=='OneToMany')
        {   
            $('#contentEmber').append(tab+relationName+': DS.belongsTo(\''+relationEntity+'\'),<br>');   
        }
        if(relationType=='ManyToMany'||relationType=='ManyToOne')
        {
           $('#contentEmber').append(tab+relationName+': DS.hasMany(\''+relationEntity+'\'),<br>'); 
        }
    });
    var oldText = $('#contentEmber').html();
    var newText = oldText.slice(0, -5);
    $('#contentEmber').html(newText+'<br>');
    $('#contentEmber').append('});');   
}

function copy(content)
{
    SelectText(content[0]);
    document.execCommand('copy');
}

function SelectText(element) {
    var doc = document, range, selection;
    if (doc.body.createTextRange) 
    {
        range = document.body.createTextRange();
        range.moveToElementText(element);
        range.select();
    } 
    else if (window.getSelection) 
    {
        selection = window.getSelection();
        range = document.createRange();
        range.selectNodeContents(element);
        selection.removeAllRanges();
        selection.addRange(range);
    }
}

$(function(){

    $('#namespace').keypress(function (e) {
     var key = e.which;
         if(key == 13)  // the enter key code
          {
              $('#className').focus();
              return false;  
          }
    });

    $('#className').keypress(function (e) {
         var key = e.which;
         if(key == 13)  // the enter key code
          {
              $('#table').focus();
              return false;  
          }
    });

    $('#table').keypress(function (e) {
         var key = e.which;
         if(key == 13)  // the enter key code
          {
              $('#namespace').focus();
              return false;  
          }
    });

     $('#attributeName').keypress(function (e) {
         var key = e.which;
         if(key == 13)  // the enter key code
          {
              $('#attributeType').focus();
              return false;  
          }
    });

     $('#relationName').keypress(function (e) {
         var key = e.which;
         if(key == 13)  // the enter key code
          {
              $('#relationEntity').focus();
              return false;  
          }
    });

    $('#attributeType').keypress(function (e) {
         var key = e.which;
         if(key == 13)  // the enter key code
          {
            $('#attributeAdd').click();
            $('#attributeType').val('');
            $('#attributeName').val('').focus();
            return false;  
          }
    });
  
  $('#copyEntity').on('click', function () {
         copy($('#contentEntity'));
    });
  $('#copyDoctrine').on('click', function () {
        copy($('#contentDoctrine'));
    });
  $('#copySerializer').on('click', function () {
        copy($('#contentSerializer'));
    });
  $('#copyEmber').on('click', function () {
        copy($('#contentEmber'));
    });    
});