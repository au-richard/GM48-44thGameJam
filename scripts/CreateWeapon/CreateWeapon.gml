// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateWeapon(_sprite = sPistol, _weaponLength = 0, _bulletObj = oPistolBullet, _cooldown = 1, _bulletNum = 1, _spread = 0 /*, _gun_kickback*/ ) constructor {
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;	
};

// weapon inventory
global.PlayerWeapons = array_create(0);

// weapons
global.WeaponList = {	
	pistol: new CreateWeapon(
		sPistol,
		4,
		oPistolBullet,
		10,
		1,
		0 
		//gun_kickback(global.WeaponList.pistol)
	),
	machineGun: new CreateWeapon(
		sMachineGun,
		4,
		oMachineGunBullet,
		3,
		1,
		0
		//gun_kickback(global.WeaponList.machineGun)
	),	
	shotgun: new CreateWeapon(
		sShotgun,
		4,
		oShotgunBullet,
		20,
		5,
		45
		//(global.WeaponList.shotgun)
	),
}