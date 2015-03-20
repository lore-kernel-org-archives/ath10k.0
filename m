Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxPn-0006VB-PC
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 13:56:45 +0000
Message-ID: <550C26F7.4010300@candelatech.com>
Date: Fri, 20 Mar 2015 06:56:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS support in ath10k - our test results and questions
References: <2680922.jiTnlqor3W@prime>	<550B425A.7090505@candelatech.com>
 <CALhHN=qch721dGPWWjmBb15qwH8gGQprafUEK+XjYu0ajm-tZw@mail.gmail.com>
In-Reply-To: <CALhHN=qch721dGPWWjmBb15qwH8gGQprafUEK+XjYu0ajm-tZw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Simon Wunderlich <simon@open-mesh.com>, sven@open-mesh.com, marek@open-mesh.com, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 03/19/2015 11:44 PM, Janusz Dziedzic wrote:
> On 19 March 2015 at 22:40, Ben Greear <greearb@candelatech.com> wrote:
>> On 03/19/2015 10:06 AM, Simon Wunderlich wrote:
>>> Hi ath10k devs,
>>>
>>> since there has been quite a bit of progress on IBSS in ath10k, we've been
>>> trying to integrate it into our OpenWRT based firmware and test it. Since there
>>> seems to be many people interested, I'd like to share our status and also ask
>>> for comments and support on current issues:
>>>
>>>   * Our test was based on Ben Greears firmware v 13, OpenWRT rev 44654 and
>>> various patches (see details below at [1])
>>>   * We can set up IBSS networks without problems, at least without IBSS/RSN
>>> encryption
>>>   * AP+IBSS simultaneously works somewhat, but with quirks
>>>   * We see low throughput when communicating via IBSS between 2x ath10k or 1x
>>> ath9k + 1x ath10k (~30 MiBit/s). With HT we would have expected ~150 MBit/s,
>>> with VHT even more.
>>
>> Do you see this problem with only an IBSS interface?  In other words, is my
>> firmware worse at this than stock 999.x firmware in same configuration?
>>
>
> This is results I get today morning.
> This is for ath9k - HT40
>
> janusz@dell6430:~/work/tools/test$ stdbuf -o 0 ./ibss.py t2-ath9k
> t3-ath9k 5745 |grep "TC RESULT"
> TC RESULT - t2-ath9k >> t3-ath9k pkt loss: 0%
> TC RESULT - t2-ath9k >> t3-ath9k pkt loss: 0%
> TC RESULT - parallel ping
> TC RESULT - pkt_loss t2-ath9k 0%
> TC RESULT - pkt_loss t3-ath9k 0%
> TC RESULT - (udp) t3-ath9k >>>> t2-ath9k speed: 245 Mbits/sec
> TC RESULT - (tcp) t3-ath9k >>>> t2-ath9k speed: 149 Mbits/sec
> TC RESULT - (udp) t2-ath9k >>>> t3-ath9k speed: 246 Mbits/sec
> TC RESULT - (tcp) t2-ath9k >>>> t3-ath9k speed: 151 Mbits/sec
> TC RESULT - --------dual---------------------------------
> TC RESULT - (tcp) - t2-ath9k >>> t3-ath9k: 70.8 Mbits/sec
> TC RESULT - (tcp) - t3-ath9k >>> t2-ath9k: 88.3 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (tcp) - t2-ath9k >>> t3-ath9k: 21.0 Mbits/sec
> TC RESULT - (udp) - t3-ath9k >>> t2-ath9k: 185 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (udp) - t2-ath9k >>> t3-ath9k: 183 Mbits/sec
> TC RESULT - (tcp) - t3-ath9k >>> t2-ath9k: 21.9 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (udp) - t2-ath9k >>> t3-ath9k: 116 Mbits/sec
> TC RESULT - (udp) - t3-ath9k >>> t2-ath9k: 122 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT -  ./ibss.py t2-ath9k t3-ath9k 5745 - PASS
>
> And ath10k - VHT80 - firmware 636
>
> janusz@dell6430:~/work/tools/test$ stdbuf -o 0 ./ibss.py t2-ath10k
> t3-ath10k 5745 |grep "TC RESULT"
> TC RESULT - t2-ath10k >> t3-ath10k pkt loss: 0%
> TC RESULT - t2-ath10k >> t3-ath10k pkt loss: 0%
> TC RESULT - parallel ping
> TC RESULT - pkt_loss t2-ath10k 0%
> TC RESULT - pkt_loss t3-ath10k 0%
> TC RESULT - (udp) t3-ath10k >>>> t2-ath10k speed: 409 Mbits/sec
> TC RESULT - (tcp) t3-ath10k >>>> t2-ath10k speed: 248 Mbits/sec
> TC RESULT - (udp) t2-ath10k >>>> t3-ath10k speed: 506 Mbits/sec
> TC RESULT - (tcp) t2-ath10k >>>> t3-ath10k speed: 349 Mbits/sec
> TC RESULT - --------dual---------------------------------
> TC RESULT - (tcp) - t2-ath10k >>> t3-ath10k: 144 Mbits/sec
> TC RESULT - (tcp) - t3-ath10k >>> t2-ath10k: 98.8 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (tcp) - t2-ath10k >>> t3-ath10k: 28.2 Mbits/sec
> TC RESULT - (udp) - t3-ath10k >>> t2-ath10k: 371 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (udp) - t2-ath10k >>> t3-ath10k: 307 Mbits/sec
> TC RESULT - (tcp) - t3-ath10k >>> t2-ath10k: 18.2 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT - --------dual---------------------------------
> TC RESULT - (udp) - t2-ath10k >>> t3-ath10k: 221 Mbits/sec
> TC RESULT - (udp) - t3-ath10k >>> t2-ath10k: 216 Mbits/sec
> TC RESULT - ---------------------------------------------
> TC RESULT -  ./ibss.py t2-ath10k t3-ath10k 5745 - PASS
>
> Regarding IBSS/RSN and 636 firmware, this works sometimes (ath10k
> patch required here).
> But in case this don't work firmware don't send EAPOL frames - I think
> this is main problem ...

What ath10k patch is required for IBSS/RSN to (sometimes) work?

I have something that at least resembles the 636 source..so maybe
I can find the bits that is needed and port it to my 10.1.467 firmware.

I'm still interested if Simon or someone can run similar test with my firmware
and stock firmware in same config.  The reason is I want to know if my firmware
just has issues with IBSS throughput, or if the problem only happens when an AP
vdev is added as well.  That should help me understand better where the problem lies.

Thanks,
Ben

>
> BR
> Janusz
>
>> Thanks for all the details...  Sounds like you have done more testing on this
>> than I have for sure.
>>
>> In case you have a public kernel tree available somewhere with all your patches,
>> that might help speed up someone's attempt to reproduce this?
>>
>> Thanks,
>> Ben
>>
>>
>>>   * We tracked down the reason to be aggregation not working - ath10k never
>>> sends ADDBA, and also does not respond to ADDBAs sent by ath9k
>>>   * Aggregation works just fine in AP mode in ath10k
>>>
>>> Therefore, I'd like to know if anyone has experience with Bens firmware and
>>> IBSS mode and can point us to existing issues/fixes, or recommend versions to
>>> test which are supposed to work. We had to add various VHT patches by hand, so
>>> we wonder if anyone had success with that yet, but even the HT performance is
>>> far from satisfactory.
>>>
>>> Note that we also tried firmware 999.999.0.636 firmware and got better
>>> performance (70-90 MBit/s), but since it does not properly support AP it's not
>>> an option for us.
>>>
>>> There are also a few other issues (IBSS/RSN not working - ath10k firmware does
>>> not seem to support software encryption properly ; IBSS+AP has spurious AP
>>> issues with a lot of packetloss), but that would be a topic for another time.
>>> Maybe we are just missing the right versions here ... :)
>>>
>>> Thanks!!
>>>      Simon
>>>
>>>
>>>
>>> [1] Our components and software versions:
>>>   * the devices were ath9k 2x2 (HT40), ath10k 2x2 (VHT80)
>>>   * Ben Greears firmware 13 (all variants)
>>>   * OpenWrt 44654
>>>   * all ath10k patches between f3660a25c4ff15c10c197930b5e039311a25b477
>>>     (master-2014-11-04) and v3.19
>>>   * patches from git://dmz2.candelatech.com/linux-3.19.dev.y starting with
>>>     3.19 and ending at lf-5.3.1 (patches for NFS, PCI, igb, ARM, hwmon,
>>>     configs, ath9k, neigh, cifs, aesni, hwsim and vlan were dropped)
>>>   * some patches to work around build errors in Ben Greears patches
>>>   * a revert of "ath10k: Request OTP to return debug code." because it didn't
>>>     work with his firmware on the target platform
>>>   * patch "cfg80211: add extensible feature flag attribute"
>>>   * patch "cfg80211: add VHT support for IBSS"
>>>   * patch "mac80211: IBSS fix scan request"
>>>   * Revert "mac80211: notify NSS changed when IBSS and HT"
>>>     (required to update to the latest available patch)
>>>   * "mac80211: notify NSS changed when IBSS and HT"
>>>     (from http://mid.gmane.org/1418806852-558-1-git-send-email-janusz.dziedzic@tieto.com )
>>>
>>> Most likely not relevant because it is just for the VHT support in IBSS
>>> and the problem was already there before adding these patches
>>>
>>>   * "mac80211: ibss refactor ieee80211_rx_bss_info"
>>>   * "mac80211: tdls: disentangle HT supported conditions"
>>>   * "mac80211: TDLS: support VHT between peers"
>>>   * "mac80211: add VHT support for IBSS"
>>>   * a patch to synchronize include/uapi/linux/nl80211.h with the version
>>>     shipped by iw from OpenWrt 44654
>>>   * a patch in ath10k to enable NL80211_EXT_FEATURE_VHT_IBSS
>>>   * a patch to disable SMPS STATIC to get multiple chains HT MCS rates
>>>     when communicating with ath9k
>>>   * a patch to set a VHT channel when using "ibss join"
>>>   * some patches to test things like encryption, trace wmi, ...
>>>   * some patches to automatically install the CT community firmware using
>>>     OpenWrt
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>
>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
