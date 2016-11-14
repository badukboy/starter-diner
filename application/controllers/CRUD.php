<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Crud extends Application
{
	public function index() {		
		$this->data['pagebody'] = 'mtce';//added//
	
		$result = '';
                $this->data['userrole'] = $this->session->userdata('userrole');
                if ($this->data['userrole'] == NULL) {
                    $this->data['userrole'] = '?';
                }
                else if($this->data['userrole'] == 'admin') {
                        $result = 'Admin entered';
                                $this->data['items'] = $this->menu->all();//added//
                }
                else if($this->data['userrole'] == 'user') {
                        $result = 'Admin only no user';
                                $this->data['content'] = $result;
                }

                    $this->render();
	}
	public function edit($id=null) {
		//session
		$key = $this->session->userdata('key');
		$record = $this->session->userdata('record');
		
		//db
		if(empty($record)){
			$record = $this->menu->get($id);
			$key = $id;
			$this->session->set_userdata('key',$id);
			$this->session->set_userdata('record',$record);
		}
		
		//$this->data['content'] = "Looking at " . $key . ':' . $record->name;
		$this->data['fid'] = makeTextField('Menu code', 'id', $record->id);
		$this->data['fname'] = makeTextField('Item name', 'name', $record->name);
		$this->data['fdescription'] = makeTextField('Description', 'description', $record->description);
                $this->data['fdescription'] = makeTextArea('Description', 'description', $record->description);
		$this->data['fprice'] = makeTextField('Price, each', 'price', $record->price);
		$this->data['fpicture'] = makeTextField('Item image', 'picture', $record->picture);
		$this->data['fcategory'] = makeTextField('Category', 'category', $record->category);
		$cats = $this->categories->all(); // get an array of category objects
                foreach($cats as $code => $category) // make it into an associative array
                $codes[$code] = $category->name;
                $this->data['fcategory'] = makeCombobox('Category', 'category', $record->category,$codes);
                $this->data['zsubmit'] = makeSubmitButton('Save', 'Submit changes');
                $this->data['action'] = (empty($key)) ? 'Adding' : 'Editing';
                
		$this->data['pagebody'] = "mtce-edit";
		$this->render();
	}
	public function cancel() {
		$this->session->unset_userdata('key');
		$this->session->unset_userdata('record');
		$this->index();
	}
	public function save() {        
		// try the session first        
		$key = $this->session->userdata('key');        
		$record = $this->session->userdata('record');        
		// if not there, nothing is in progress        
		if (empty($record)) {                
		$this->index();        
		}        
		// validate        
		// save or not
	}
        function delete() {
                $key = $this->session->userdata('key');
                $record = $this->session->userdata('record');
                // only delete if editing an existing record
                if (! empty($record)) {
                $this->menu->delete($key);
                }
                $this->index();
        }
        
        function add() {
                $key = NULL;
                $record = $this->menu->create();
                $this->session->set_userdata('key', $key);
                $this->session->set_userdata('record', $record);
                $this->edit();
        }
}