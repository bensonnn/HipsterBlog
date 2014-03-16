require 'securerandom'
require 'openssl'
require 'base64'

module PasswordHasher

  PBKDF2_ITERATIONS = 1000
  SALT_BYTE_SIZE = 24
  HASH_BYTE_SIZE = 24

  def self.new_salt
    SecureRandom.base64( SALT_BYTE_SIZE )
  end

  def self.get_hash( password, salt )
    pbkdf2 = OpenSSL::PKCS5::pbkdf2_hmac_sha1(
      password,
      salt,
      PBKDF2_ITERATIONS,
      HASH_BYTE_SIZE
    )
    Base64.encode64(pbkdf2).chomp
  end
end
