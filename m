Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yfury-0004zy-Cu
 for ath10k@lists.infradead.org; Wed, 08 Apr 2015 18:38:35 +0000
Message-ID: <55257592.1080900@candelatech.com>
Date: Wed, 08 Apr 2015 11:38:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS support in ath10k - our test results and questions
References: <2680922.jiTnlqor3W@prime> <550B425A.7090505@candelatech.com>
 <1638549.OfoyQL4eQV@bentobox> <5522C8A1.6040007@candelatech.com>
 <5522E6D3.30109@candelatech.com>
In-Reply-To: <5522E6D3.30109@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@open-mesh.com>
Cc: Simon Wunderlich <simon@open-mesh.com>, marek@open-mesh.com, ath10k@lists.infradead.org

So, I've made some progress.

After fixing PSK (I had it misconfigured all of yesterday!), and with full restart of supplicant,
I can get the 4-way to complete, and I see PTK and GTK set in driver and firmware.
I do not know if the keys are set correctly, but the logs seem plausible.

After that, I see plain-text ARPs hit the air (the should be encrypted),
and the last 21 bytes of the packet appear to be random garbage.

I am guessing driver and/or firmware and/or hardware is not properly
encrypting the frames.

Off to do some more spelunking in the firmware.

Thanks,
Ben



On 04/06/2015 01:04 PM, Ben Greear wrote:
> So, IBSS RSN with ath9k works great on my systems now.
> 
> I'm trying ath10k, and what I see is that it appears the supplicant
> is trying to send the 1/4 message, and it never hits the air.
> 
> Firmware has some special handling for this sort of thing..so I'll
> go poke around...  If anyone has any suggestions, please let me know.
> 
> Thanks,
> Ben
> 
> 
> On 04/06/2015 10:55 AM, Ben Greear wrote:
>> I was missing the CONFIG_IBSS_RSN...it does not seem to be documented in
>> the defconfig for supplicant, so I didn't know to add it.
>>
>> I am going to try RSN again shortly.
>>
>> Also, I tried using my latest 4.0 kernel tree and I am seeing block-acks apparently
>> work correctly when using IBSS between two of my ath10k systems on channel 36.
>> No significant changes to my firmware from what I last uploaded to the beta
>> directory...
>>
>> Throughput is still a miserable 13Mbps or so when sending UDP/ipv5 between them,
>> but a sniff shows the rate reported as 450Mbps for at least many of the data
>> frames (I guess I am still missing patches to enable VHT IBSS currently).
>>
>> My tree is here.  It is basically a forward ported and cleaned up version
>> of my 3.19 tree, with a few additional patches.  I plan to skip 3.19
>> and focus on 4.0 for our own purposes, so my 3.19 tree is basically EOL at
>> this point:
>>
>> git clone git://dmz2.candelatech.com/linux-4.0.dev.y
>>
>> Thanks,
>> Ben
>>
>>
>> On 03/23/2015 04:24 AM, Sven Eckelmann wrote:
>>> On Thursday 19 March 2015 14:40:42 Ben Greear wrote:
>>>> In case you have a public kernel tree available somewhere with all your
>>>> patches, that might help speed up someone's attempt to reproduce this?
>>>
>>> I have uploaded the patchset of our test setup at
>>>
>>>  git://dev.cloudtrax.com/ath10k-ibss-test.git
>>>  https://dev.cloudtrax.com/git/ath10k-ibss-test.git
>>>
>>> As Simon already said, it is not a kernel tree but patches on top of compat-
>>> wireless from OpenWrt r44654. If you want to import something into an actual 
>>> tree then please create patches and replace the CPTCFG_* strings with 
>>> CONFIG_*.
>>>
>>> Here a small explanation of the branches:
>>>
>>>  * openwrt_44654: initial import of the source + patches of mac80211
>>>    (compat-wireless) package from OpenWrt r44654
>>>  * ath3.19: patches of ath10k which were between the compat-wireless version
>>>    and Linux 3.19
>>>  * candelatech-lf-lf-5.3.1 patches taken from Candelatech's 3.19 tree (minus
>>>    some patches which weren't related to the wireless stuff)
>>>  * master: the patches which were used for the IBSS test with Ben Greear's
>>>    firmware. Most came from Janusz Dziedzic. The rest are just a few small
>>>    changes to fix builds, workarounds to fix loading of the firmware and some
>>>    required patches for Janusz Dziedzic's IBSS stuff.
>>>  * fw-999.999-ibss patch to allow loading of the original firmware with most
>>>    of Ben Greear's patches. Was used to verify that the original 999.x
>>>    firmware worked fine with block ack sessions + aggregation
>>>
>>> The only patches not included here are some test patches which weren't part of 
>>> the actual "performance" tests. This includes patches used for debugging and 
>>> tests to check the IBSS RSN stuff over ath10k (which failed - most likely due 
>>> to some firmware "features" regarding encryption which resulted in non-
>>> decryptable packets).
>>>
>>> I think you can use wpa_supplicant 2.4 for VHT. I personally used a patched 
>>> version of iw which hardcoded the ibss join VHT parameters. I haven't tested 
>>> this yet because I've done the port of the OpenWrt patches on friday evening 
>>> and hadn't time to test it with ath10k. But this problem doesn't require VHT 
>>> features and thus should be visible with the plain HT setup and no VHT 
>>> enabled.
>>>
>>> Kind regards,
>>> 	Sven
>>>
>>> PS: Not sure if you have finished the test with ath9k IBSS RSN + HT. I was 
>>> under the impression that you had problems with it. Beside the stuff I already 
>>> wrote in an earlier mail, the only thing which came to my mind was the 
>>> wpa_supplicant build setup. IBSS RSN doesn't work with a standard build and 
>>> you have to enable CONFIG_IBSS_RSN in the wpa_supplicant config. An example 
>>> config which works (with the OpenWrt build system of course) can be found at
>>>
>>>  https://dev.openwrt.org/browser/trunk/package/network/services/hostapd/files/wpa_supplicant-full.config?rev=38852
>>>
>>> The wpa_supplicant (runtime) config would be look like this:
>>>
>>> ap_scan=2
>>> network={
>>>         scan_ssid=0
>>>         ssid="mesh"
>>>         key_mgmt=WPA-PSK
>>>         mode=1
>>>         fixed_freq=1
>>>         frequency=5180
>>>         mode=1
>>>         psk="9f0a965af38f2d0a13b66d8b46ab962c"
>>>         proto=RSN
>>>         bssid=02:CA:FE:CA:CA:40
>>>         # openwrt specific patch for htmode, mcast_rate
>>>         htmode=HT40+
>>>         mcast_rate=18
>>> }
>>>
>>
>>
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
