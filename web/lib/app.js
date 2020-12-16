import * as THREE from './three/build/three.module.js';
import {OBJLoader} from './three/examples/jsm/loaders/OBJLoader.js'

// import { OBJLoader } from './loaders/OBJLoader.js';

let container;

let camera, scene, renderer;

let mouseX = 0, mouseY = 0;

let windowHalfX = window.innerWidth / 2;
let windowHalfY = window.innerHeight / 2;
let w, h;

let object;

init();
animate();


function init() {

    // container = document.createElement( 'div' );
    container = document.getElementById('renderCanvas');
    w = container.offsetWidth;
    h = container.offsetHeight;
	// document.body.appendChild( container );

	camera = new THREE.PerspectiveCamera(
        75,
        w / h,
        0.1,
        1000
    );
    camera.position.z = 4;

	// scene

	scene = new THREE.Scene();

	const ambientLight = new THREE.AmbientLight( 0xcccccc, 0.4 );
	scene.add( ambientLight );

	const pointLight = new THREE.PointLight( 0xffffff, 0.8 );
	camera.add( pointLight );
	scene.add( camera );

	// manager

	function loadModel() {

		object.traverse( function ( child ) {

			if ( child.isMesh ) child.material.map = texture;

		} );

		scene.add( object );

	}

	const manager = new THREE.LoadingManager( loadModel );

	manager.onProgress = function ( item, loaded, total ) {

		console.log( item, loaded, total );

	};

	// texture

	const textureLoader = new THREE.TextureLoader( manager );
	const texture = textureLoader.load( 'lib/model/oak.jpg' );

	// model

	

	const loader = new OBJLoader( manager );
	loader.load( 'lib/model/W.obj', function ( obj ) {
        obj.position.y = -1.5;
        object = obj;
    

	}, 
	function ( xhr ) {
		if ( xhr.lengthComputable ) {

			const percentComplete = xhr.loaded / xhr.total * 100;
			console.log( 'model ' + Math.round( percentComplete, 2 ) + '% downloaded' );

		}

	},
		// called when loading has errors
	function ( error ) {
		console.log( 'An error happened' );
	});

	//

    renderer = new THREE.WebGLRenderer();
    renderer.setClearColor("#5c3317");
	// renderer.setPixelRatio( w/ h);
	renderer.setSize( w, h );
	container.appendChild( renderer.domElement );

	// document.addEventListener( 'mousemove', onDocumentMouseMove, false );

	//

	// window.addEventListener( 'resize', onWindowResize, false );

}

// function onWindowResize() {

// 	windowHalfX = window.innerWidth / 2;
// 	windowHalfY = window.innerHeight / 2;

// 	camera.aspect = window.innerWidth / window.innerHeight;
// 	camera.updateProjectionMatrix();

// 	renderer.setSize( window.innerWidth, window.innerHeight );

// }

// function onDocumentMouseMove( event ) {

// 	mouseX = ( event.clientX - windowHalfX ) / 2;
// 	mouseY = ( event.clientY - windowHalfY ) / 2;

// }

// //

function animate() {

    requestAnimationFrame( animate );
    if (object != null) {
                object.rotation.y += 0.01;
            }
	render();

}

function render() {
	renderer.render( scene, camera );
}