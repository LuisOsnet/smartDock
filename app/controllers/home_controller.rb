# frozen_string_literal: true

class HomeController < ApplicationController
  require 'rubygems'
  require 'arduino_firmata'
  before_action :arduino_connect?, only: %i[index turn_on turn_off]

  def index
    if @arduino
      @arduino_version = @arduino.version
    else
      @error = 'no hay conexion'
    end
  end

  # Enciende led
  def turn_on
    @arduino.digital_write 13, true
    puts 'Prende'
  end

  # Apaga led
  def turn_off
    @arduino.digital_write 13, false
    puts 'Apaga'
  end

  # iniciamos la conexion a Arduino
  def arduino_connect?
    @arduino = ArduinoFirmata.connect
  end

  # Imprimimos la version de Firmata como exito en la conexion
  def arduino_version
    @arduino_version = @arduino.version
  end
end
