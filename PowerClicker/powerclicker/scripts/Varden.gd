extends Control

var startMoney : float = 0  ## Ska vara 0 när spelet är klart, kan användas för testning

var solarPrice : float = 10   # Startpriset
var solarScale : float = 0.01  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}

var windPrice : float = 100  # Startpriset
var windScale : float = 0.2  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}

var hydroPrice : float = 1000 # Startpriset
var hydroScale : float = 0.5  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}

var coalPrice : float = 10000  # Startpriset
var coalScale : float = 1.3  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}

var gasPrice : float = 10000   # Startpriset
var gasScale : float = 1.3  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}

var oilPrice : float = 10000   # Startpriset
var oilScale : float = 1.3  # Priset för nästa byggnad är {Nuvarande pris} + {startpriset} * {scaling}
