extends Control

var startMoney : float = 0  ## Ska vara 0 när spelet är klart, kan användas för testning

var solarPrice : float = 10
var solarScale : float = 1.01  # Priset för nästa byggnad är priest *= scale

var windPrice : float = 100
var windScale : float = 1.05  # Priset för nästa byggnad är priest *= scale

var hydroPrice : float = 1000
var hydroScale : float = 1.09  # Priset för nästa byggnad är priest *= scale

var coalPrice : float = 100
var coalScale : float = 1.25  # Priset för nästa byggnad är priest *= scale

var gasPrice : float = 100
var gasScale : float = 1.25  # Priset för nästa byggnad är priest *= scale

var oilPrice : float = 100
var oilScale : float = 1.25  # Priset för nästa byggnad är priest *= scale
