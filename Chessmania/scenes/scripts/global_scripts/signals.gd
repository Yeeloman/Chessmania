extends Node


signal locker_entered
signal locker_exited

signal locker_active
signal locker_passive

signal same_piece #handle the case where the locker lock delock then lock
