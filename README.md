## android-services 

Android services gem is a ruby wrapper over the google services for android.
  
### QuickStart
You can install the gem using
gem install android-services
You will need a google API key for communicating with the google services, which you can get from here
http://developer.android.com/guide/google/gcm/gs.html
	
After getting the API key, you can initialize it in the rails app using an initializer file.

    AndroidServices.configure do |config|
	     config.api_key = '<API KEY>'
   	  	 config.secure = true
    end	
	
### Sending a simple message

Sending a message to an Android device is easy! The simplest message you can send is:

    CloudMessage.new(:registration_ids => [])
	
Other Options you might want to use:
	
+ collapse_key: An arbitrary string (such as "Updates Available") that is used to collapse a group of like messages when the device is 								   offline, so that only the last message gets sent to the client. This is intended to avoid sending too many messages to the phone when it comes back online. 

+ data: A JSON object whose fields represents the key-value pairs of the message's payload data. If present, the payload data it will be included in the Intent as application data, with the key being the extra's name. 

+ delay_while_idle: If included, indicates that the message should not be sent immediately if the device is idle. The server will wait for the device to become active, and then only the last message for each collapse_key value will be sent.

+ time_to_live: How long (in seconds) the message should be kept on GCM storage if the device is offline.

### Contributing to android-services
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Copyright

Copyright (c) 2012 krishna rokhale. See LICENSE.txt for
further details.

