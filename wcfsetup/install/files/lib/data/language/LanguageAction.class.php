<?php
namespace wcf\data\language;
use wcf\data\AbstractDatabaseObjectAction;
use wcf\system\exception\PermissionDeniedException;
use wcf\system\exception\ValidateActionException;
use wcf\system\WCF;

/**
 * Executes language-related actions.
 * 
 * @author	Alexander Ebert
 * @copyright	2001-2012 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf
 * @subpackage	data.language
 * @category	Community Framework
 */
class LanguageAction extends AbstractDatabaseObjectAction {
	/**
	 * @see	wcf\data\AbstractDatabaseObjectAction::$className
	 */
	protected $className = 'wcf\data\language\LanguageEditor';
	
	/**
	 * @see	wcf\data\AbstractDatabaseObjectAction::$permissionsCreate
	 */
	protected $permissionsCreate = array('admin.language.canAddLanguage');
	
	/**
	 * @see	wcf\data\AbstractDatabaseObjectAction::$permissionsDelete
	 */
	protected $permissionsDelete = array('admin.language.canDeleteLanguage');
	
	/**
	 * @see	wcf\data\AbstractDatabaseObjectAction::$permissionsUpdate
	 */
	protected $permissionsUpdate = array('admin.language.canEditLanguage');
	
	/**
	 * Validates permission to set a language as default.
	 */
	public function validateSetAsDefault() {
		try {
			WCF::getSession()->checkPermissions($this->permissionsUpdate);
		}
		catch (PermissionDeniedException $e) {
			throw new ValidateActionException('Insufficient permissions');
		}
		
		// read objects
		if (empty($this->objects)) {
			$this->readObjects();
			
			if (empty($this->objects)) {
				throw new ValidateActionException('Invalid object id');
			}
		}
	}
	
	/**
	 * Sets language as default
	 */	
	public function setAsDefault() {
		$language = array_shift($this->objects);
		$language->setAsDefault();
	}
}
