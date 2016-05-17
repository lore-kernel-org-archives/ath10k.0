Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2ZEc-0001PX-NZ
 for ath10k@lists.infradead.org; Tue, 17 May 2016 07:16:10 +0000
Received: from mail-ig0-f198.google.com ([209.85.213.198])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:RC4-SHA:128)
 id 1b2ZDx-0003C6-65
 for ath10k@lists.infradead.org; Tue, 17 May 2016 15:15:26 +0800
Received: by mail-ig0-f198.google.com with SMTP id kj7so20182075igb.3
 for <ath10k@lists.infradead.org>; Tue, 17 May 2016 00:15:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5738AE96.8040800@candelatech.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Tue, 17 May 2016 14:14:43 +0700
Message-ID: <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
Subject: Re: Setting per-frame tx rate for frames injected in raw tx mode
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

I see.. So the RA is implemented in firmware and is closed source.
Also it is unclear if the driver (ath10k) has implemented an API for
it.

Your idea sounds similar to how it is working for me in ath9k - in the
file net/mac80211/tx.c, the HT rate information from the radiotap
header is parsed and set in the struct ieee80211_tx_info (see the
method ieee80211_parse_tx_radiotap()). A recent commit [1] also added
parsing for VHT information from radiotap. This seems to be a standard
way of doing it and it seems to work with "d-link dir-860l rev b1
running OpenWrt trunk and mt76 driver" as the commit description
mentions. However with ath10k, the rate from this tx_info seems to be
not honored :(

But I believe there should be some way of fixing rate settings from
upper layers of the pipeline. iw lets us do manual bitrate
configuration [2] for ath10k which works as expected. But this only
helps in setting of rate per-session. I am still finding answers to
the following questions:
1) What is it that iw does that it manages to get the manual bitrate
configuration?
2) How does it ask the firmware to not do any RA and always honor the
set rate? Basically how does it override the default RA?
3) Can we do the same on a per-packet basis?

It would be very helpful if someone can shed light on these questions
regarding iw's manual bitrate configuration for ath10k.

[1] https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/net/mac80211/tx.c?id=646e76bb5daf4ca38438c69ffb72cccb605f3466
[2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug#manual_bitrates_configuration

Thanks,
Raj Joshi

On Mon, May 16, 2016 at 1:15 AM, Ben Greear <greearb@candelatech.com> wrote:
> I guess another thought comes to mind.
>
> Maybe I could extend the pkt header when sending the frame to the firmware
> so that it *already* has the rateset specified.  And rip out the rate-ctrl
> logic
> from the firmware entirely.  I'm not sure this would work for mu-mimo, but
> might
> work for QCA9880 chips...
>
> Thanks,
> Ben
>
>
> On 05/15/2016 08:17 AM, Ben Greear wrote:
>>
>>
>>
>> On 05/14/2016 07:40 PM, Raj Joshi wrote:
>>>
>>> Thanks for such useful info. Setting of multiple rate codes for
>>> channel width, GI, NSS and MCS is what my RA implementation for ath9k
>>> does. It also relies on advanced tx-status reporting to know the
>>> retries etc. I am not planning to account for MU-MIMO for the
>>> beginning. But it helps to know that it would require work and the
>>> support is not ready yet.
>>>
>>> For my understanding, I would like to know ath10k vis-a-vis ath9k from
>>> the perspective of rate-adaptation (RA):
>>> 1) Scheme/Algorithm: ath9k uses Minstrel-HT and an overview (basis of
>>> the algorithm) is available online [1]. What is the scheme/algorithm
>>> being used by ath10k? Any overview/documentation available?
>>
>>
>> No documentation is available, and the information would be proprietary
>> since
>> it is in the closed-source firmware.
>>
>>> 2) Where implemented?: Minstrel-HT is implemented in mac80211. Where
>>> is ath10k's RA implemented?
>>
>>
>> In the firmware itself.
>>
>>> 3) Where in pipeline is the rate set?: With Minstrel-HT rate is set in
>>> mac80211 before passing the frame onto ath9k. With ath10k, where the
>>> rate is set? Can anyone point me to the line(s) of code where the rate
>>> is it (of course if that part is open-source). As far as I have
>>> investigated, the rate set in mac80211 is not honored by
>>> ath10k/firmware/hardware.
>>
>>
>> I am not sure the driver has even implemented the API.  But,the basic idea
>> is that the driver could set the rateset for a peer (and do so fairly
>> often
>> as things change), and the firmware will apply that rateset to frames
>> in it's transmit logic.
>>
>> Can you tell me the minimum information you need for tx-status to support
>> your API?
>>
>> Thanks,
>> Ben
>>
>>>
>>> [1]
>>> https://wireless.wiki.kernel.org/en/developers/documentation/mac80211/ratecontrol/minstrel
>>>
>>> Thanks,
>>> Raj Joshi
>>>
>>>
>>> On Thu, May 12, 2016 at 12:13 AM, Ben Greear <greearb@candelatech.com>
>>> wrote:
>>>>
>>>> On 05/10/2016 11:41 PM, Raj Joshi wrote:
>>>>>
>>>>>
>>>>> Thanks Ben for the info. Sorry about my ignorance; but I do not know
>>>>> the link to your kernel tree. Could you kindly share?
>>>>
>>>>
>>>>
>>>> Scroll down this page a bit:
>>>>
>>>> http://www.candelatech.com/ath10k-10.1.php
>>>>
>>>>>
>>>>> Let me explain why I need this functionality in first place - I want
>>>>> to use a custom rate-adaptation (RA) scheme instead of the default.
>>>>> With ath9k, it was straight-ward to implement a custom RA scheme in
>>>>> user-space. My user-space daemon gets the packets from an IP
>>>>> interface, adds the radiotap header with rate information as per my
>>>>> custom RA scheme and then injects the frame into a monitor interface.
>>>>> By disabling minstrel-ht in mac80211, I ensure that the rate set in
>>>>> the radiotap header is what remains the final tx rate at which the
>>>>> frame is transmitted.
>>>>>
>>>>> Now things seem drastically different if I were to do the same with
>>>>> ath10k. Thus I would like to further know:
>>>>> 1) Where exactly in the ath10k packet/frame flow does the RA algorithm
>>>>> come in picture? Where is it implemented and how can I tweak it to my
>>>>> liking? Also is there any documentation about the default RA scheme?
>>>>> 2) Or if #1 is not possible, then what changes would be required to
>>>>> override the default RA on a per-packet basis at any easily accessible
>>>>> level - mac80211 or user-space. From what I discern from the
>>>>> description of this commit
>>>>>
>>>>>
>>>>> (https://github.com/kvalo/ath/commit/646e76bb5daf4ca38438c69ffb72cccb605f3466),
>>>>> it seems that with a different driver-firmware-chipset combination,
>>>>> such a thing is possible to do.
>>>>>
>>>>> Any help is deeply appreciated.
>>>>
>>>>
>>>>
>>>> For per-packet rate-ctrl, you would need to be able to specify multiple
>>>> rate codes, including rate for 80Mhz, 40Mhz, 20Mhz (and 160Mhz for newer
>>>> chips, probably).  For mu-mimo, you need to also specify rates based on
>>>> the NSS for a peer as well.
>>>>
>>>> You may also need to specify fall-back codes in case of retransmits.
>>>>
>>>> The firmware has at least partial support for configuring the ratesets
>>>> on a per-peer basis.  That would let you do per-peer ratectrl, but not
>>>> exactly per-packet rate-ctrl.  And, it would require some firmware
>>>> patches or at least re-compilation to allow it to work.
>>>>
>>>> To make decisions on rate-ctrl on the host, you need to know advanced
>>>> tx-status reporting.  My firmware can report the tx-rate, but I think
>>>> you would also need to know retry count for the various rates to have
>>>> a good picture of the RF connection to a specific peer.  This would
>>>> require a good bit more work in the firmware.
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>>>
>>>>> Thanks,
>>>>> Raj Joshi
>>>>>
>>>>>
>>>>> On Wed, May 11, 2016 at 12:28 AM, Ben Greear <greearb@candelatech.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 05/09/2016 11:11 PM, Raj Joshi wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> For a research project, I need to inject frames in monitor mode and
>>>>>>> have them sent out with rate settings as set in the radiotap header -
>>>>>>> basically setting per-frame tx rate. I have tried doing so, but the
>>>>>>> frame is transmitted at a basic rate with 802.11a instead of a VHT
>>>>>>> rate as set in the radiotap. Following are the setup and methodology
>>>>>>> details. Sorry about email length; but wanted to provide as much
>>>>>>> relevant information.
>>>>>>>
>>>>>>> ---------------
>>>>>>> Setup Info
>>>>>>> ---------------
>>>>>>> * x86-64 board running Ubuntu 12.04.5 LTS
>>>>>>> * Chipset: QCA9880 hw2.0 with 3 x 3 antennas
>>>>>>> * Kernel: 3.8.0-29-generic x86_64
>>>>>>> * Firmware: Initially QCA's 10.2.4.70.42-2 obtained via
>>>>>>> https://github.com/kvalo/ath10k-firmware. After experiencing crashes,
>>>>>>> later changed to one from CT (10.2.4.70-31-ct-xtW-003-3b0444c) | Both
>>>>>>> the firmwares support raw-mode.
>>>>>>> * ath10k: https://github.com/kvalo/ath (snapshot of commit
>>>>>>> 7de1931eec121045e4e35d0b519ce8bad9b10b51 | Wed Mar 23 14:27:35 2016
>>>>>>> +0200)
>>>>>>>     => backport generated using backports.git
>>>>>>>
>>>>>>> (https://git.kernel.org/cgit/linux/kernel/git/backports/backports.git)
>>>>>>> backports-20160122-0-ga91a3e6. Backporting was not clean; had to fix
>>>>>>> a
>>>>>>> few compile errors due to missing files by manually copying those
>>>>>>> files.
>>>>>>>
>>>>>>> -------------------
>>>>>>> Methodology
>>>>>>> -------------------
>>>>>>> * Setup up a hostapd 802.11ac AP on one of the boards with 80 MHz
>>>>>>> channel width and correctly specified center frequencies.
>>>>>>> * Setup monitor mode on another board for sniffing traffic on the
>>>>>>> same
>>>>>>> 80 MHz channel width.
>>>>>>> * Connect an 802.11ac capable laptop (Windows/Ubuntu) and exchange
>>>>>>> data frames with the AP | Capture them on the sniffer board (with all
>>>>>>> the VHT info in radiotap) so that they could be used as reference to
>>>>>>> construct injection frame.
>>>>>>> * Now shutdown the AP and change the interface on the AP board to
>>>>>>> monitor mode. Re-load ath10k_core with rawmode=1 and then ath10k_pci
>>>>>>> as well. Inject one of the captured frame with radiotap VHT rate info
>>>>>>> into the monitor interface and use the sniffer to check if it was
>>>>>>> transmitted.
>>>>>>> * The firmware (QCA 10.2.4.70.42-2) crashed in this case => couldn't
>>>>>>> understand the firmware crash dump. Changed the firmware to CT
>>>>>>> 10.2.4.70-31-ct-xtW-003-3b0444c.
>>>>>>> * Now the frame is transmitted and detected by the sniffer. However,
>>>>>>> the radio information via radiotap shows that it was sent with a
>>>>>>> basic
>>>>>>> rate of 802.11a.
>>>>>>> * Tried for both encrypted (WPA2) and non-encrypted frames. Result is
>>>>>>> the
>>>>>>> same.
>>>>>>>
>>>>>>> --------------------------------
>>>>>>> Other Considerations
>>>>>>> --------------------------------
>>>>>>> * The raw tx patch: As suggested on the CT firmware page, I looked
>>>>>>> into the so called "out-of-tree" raw tx patch
>>>>>>> (http://comments.gmane.org/gmane.linux.drivers.ath10k.devel/246) and
>>>>>>> tried to reconcile it with the current ath10k source. Apparently
>>>>>>> other
>>>>>>> than changes to cmd_tx.len,  the suggested changes in the patch are
>>>>>>> either already in place by use of 'txmode' variable or they are no
>>>>>>> more relevant with the new source code. For my non-encrypted frame, I
>>>>>>> got my custom ASCII string inside the frame correctly transmitted and
>>>>>>> so I 'believe' the changes to cmd_tx.len are no more required due to
>>>>>>> correct msdu->len. Thus, it seems that this patch is no more
>>>>>>> necessary
>>>>>>> and that this patch has nothing to do with correct tx rate setting.
>>>>>>> * QoS versus non-QoS: Both of my sample injection frames are QoS data
>>>>>>> with radiotap on top of it. I couldn't find a way to disable QoS and
>>>>>>> it seems that it is not required either as there is no length issue
>>>>>>> anymore as was discussed in the raw tx patch discussion; my frame is
>>>>>>> transmitted whole and correct.
>>>>>>> * VHT Parsing in Radiotap: I have double checked that my
>>>>>>> net/mac80211/tx.c has the relevant updated code wrt parsing of VHT
>>>>>>> rate information
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> (https://github.com/kvalo/ath/commit/646e76bb5daf4ca38438c69ffb72cccb605f3466)
>>>>>>> * Disabling A-MSDU: I didn't have to do this as I could resolve my
>>>>>>> firmware crash by switching to the CT firmware.
>>>>>>> * Using the ath10k master development branch: I also tried
>>>>>>> backporting
>>>>>>> master of https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git,
>>>>>>> but compilation of backported code failed due to lack of some methods
>>>>>>> such as nla_put_net64, nla_put_be64, etc. in include/net/netlink.h of
>>>>>>> my stock kernel headers (I believe). So I am not sure if things have
>>>>>>> changed since the Mar 23 2016 snapshot of ath10k github repo and now
>>>>>>> that rate is correctly set for VHT raw tx injection.
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> There is no way to specify the TX rate for individual frames with
>>>>>> CT firmware, nor with any other firmware that I am aware of.
>>>>>>
>>>>>> This is probably something I could fix, but it would be a fair bit of
>>>>>> work, and would require even more changes to the ath10k driver, so
>>>>>> at best you would have to use my kernel tree...
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Ben
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Ben Greear <greearb@candelatech.com>
>>>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> ath10k mailing list
>>>>> ath10k@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>
>>>>
>>>> --
>>>> Ben Greear <greearb@candelatech.com>
>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>
>>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
Raj Joshi


On Mon, May 16, 2016 at 12:15 AM, Ben Greear <greearb@candelatech.com> wrote:
> I guess another thought comes to mind.
>
> Maybe I could extend the pkt header when sending the frame to the firmware
> so that it *already* has the rateset specified.  And rip out the rate-ctrl
> logic
> from the firmware entirely.  I'm not sure this would work for mu-mimo, but
> might
> work for QCA9880 chips...
>
> Thanks,
> Ben
>
>
> On 05/15/2016 08:17 AM, Ben Greear wrote:
>>
>>
>>
>> On 05/14/2016 07:40 PM, Raj Joshi wrote:
>>>
>>> Thanks for such useful info. Setting of multiple rate codes for
>>> channel width, GI, NSS and MCS is what my RA implementation for ath9k
>>> does. It also relies on advanced tx-status reporting to know the
>>> retries etc. I am not planning to account for MU-MIMO for the
>>> beginning. But it helps to know that it would require work and the
>>> support is not ready yet.
>>>
>>> For my understanding, I would like to know ath10k vis-a-vis ath9k from
>>> the perspective of rate-adaptation (RA):
>>> 1) Scheme/Algorithm: ath9k uses Minstrel-HT and an overview (basis of
>>> the algorithm) is available online [1]. What is the scheme/algorithm
>>> being used by ath10k? Any overview/documentation available?
>>
>>
>> No documentation is available, and the information would be proprietary
>> since
>> it is in the closed-source firmware.
>>
>>> 2) Where implemented?: Minstrel-HT is implemented in mac80211. Where
>>> is ath10k's RA implemented?
>>
>>
>> In the firmware itself.
>>
>>> 3) Where in pipeline is the rate set?: With Minstrel-HT rate is set in
>>> mac80211 before passing the frame onto ath9k. With ath10k, where the
>>> rate is set? Can anyone point me to the line(s) of code where the rate
>>> is it (of course if that part is open-source). As far as I have
>>> investigated, the rate set in mac80211 is not honored by
>>> ath10k/firmware/hardware.
>>
>>
>> I am not sure the driver has even implemented the API.  But,the basic idea
>> is that the driver could set the rateset for a peer (and do so fairly
>> often
>> as things change), and the firmware will apply that rateset to frames
>> in it's transmit logic.
>>
>> Can you tell me the minimum information you need for tx-status to support
>> your API?
>>
>> Thanks,
>> Ben
>>
>>>
>>> [1]
>>> https://wireless.wiki.kernel.org/en/developers/documentation/mac80211/ratecontrol/minstrel
>>>
>>> Thanks,
>>> Raj Joshi
>>>
>>>
>>> On Thu, May 12, 2016 at 12:13 AM, Ben Greear <greearb@candelatech.com>
>>> wrote:
>>>>
>>>> On 05/10/2016 11:41 PM, Raj Joshi wrote:
>>>>>
>>>>>
>>>>> Thanks Ben for the info. Sorry about my ignorance; but I do not know
>>>>> the link to your kernel tree. Could you kindly share?
>>>>
>>>>
>>>>
>>>> Scroll down this page a bit:
>>>>
>>>> http://www.candelatech.com/ath10k-10.1.php
>>>>
>>>>>
>>>>> Let me explain why I need this functionality in first place - I want
>>>>> to use a custom rate-adaptation (RA) scheme instead of the default.
>>>>> With ath9k, it was straight-ward to implement a custom RA scheme in
>>>>> user-space. My user-space daemon gets the packets from an IP
>>>>> interface, adds the radiotap header with rate information as per my
>>>>> custom RA scheme and then injects the frame into a monitor interface.
>>>>> By disabling minstrel-ht in mac80211, I ensure that the rate set in
>>>>> the radiotap header is what remains the final tx rate at which the
>>>>> frame is transmitted.
>>>>>
>>>>> Now things seem drastically different if I were to do the same with
>>>>> ath10k. Thus I would like to further know:
>>>>> 1) Where exactly in the ath10k packet/frame flow does the RA algorithm
>>>>> come in picture? Where is it implemented and how can I tweak it to my
>>>>> liking? Also is there any documentation about the default RA scheme?
>>>>> 2) Or if #1 is not possible, then what changes would be required to
>>>>> override the default RA on a per-packet basis at any easily accessible
>>>>> level - mac80211 or user-space. From what I discern from the
>>>>> description of this commit
>>>>>
>>>>>
>>>>> (https://github.com/kvalo/ath/commit/646e76bb5daf4ca38438c69ffb72cccb605f3466),
>>>>> it seems that with a different driver-firmware-chipset combination,
>>>>> such a thing is possible to do.
>>>>>
>>>>> Any help is deeply appreciated.
>>>>
>>>>
>>>>
>>>> For per-packet rate-ctrl, you would need to be able to specify multiple
>>>> rate codes, including rate for 80Mhz, 40Mhz, 20Mhz (and 160Mhz for newer
>>>> chips, probably).  For mu-mimo, you need to also specify rates based on
>>>> the NSS for a peer as well.
>>>>
>>>> You may also need to specify fall-back codes in case of retransmits.
>>>>
>>>> The firmware has at least partial support for configuring the ratesets
>>>> on a per-peer basis.  That would let you do per-peer ratectrl, but not
>>>> exactly per-packet rate-ctrl.  And, it would require some firmware
>>>> patches or at least re-compilation to allow it to work.
>>>>
>>>> To make decisions on rate-ctrl on the host, you need to know advanced
>>>> tx-status reporting.  My firmware can report the tx-rate, but I think
>>>> you would also need to know retry count for the various rates to have
>>>> a good picture of the RF connection to a specific peer.  This would
>>>> require a good bit more work in the firmware.
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>>>>
>>>>> Thanks,
>>>>> Raj Joshi
>>>>>
>>>>>
>>>>> On Wed, May 11, 2016 at 12:28 AM, Ben Greear <greearb@candelatech.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 05/09/2016 11:11 PM, Raj Joshi wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> For a research project, I need to inject frames in monitor mode and
>>>>>>> have them sent out with rate settings as set in the radiotap header -
>>>>>>> basically setting per-frame tx rate. I have tried doing so, but the
>>>>>>> frame is transmitted at a basic rate with 802.11a instead of a VHT
>>>>>>> rate as set in the radiotap. Following are the setup and methodology
>>>>>>> details. Sorry about email length; but wanted to provide as much
>>>>>>> relevant information.
>>>>>>>
>>>>>>> ---------------
>>>>>>> Setup Info
>>>>>>> ---------------
>>>>>>> * x86-64 board running Ubuntu 12.04.5 LTS
>>>>>>> * Chipset: QCA9880 hw2.0 with 3 x 3 antennas
>>>>>>> * Kernel: 3.8.0-29-generic x86_64
>>>>>>> * Firmware: Initially QCA's 10.2.4.70.42-2 obtained via
>>>>>>> https://github.com/kvalo/ath10k-firmware. After experiencing crashes,
>>>>>>> later changed to one from CT (10.2.4.70-31-ct-xtW-003-3b0444c) | Both
>>>>>>> the firmwares support raw-mode.
>>>>>>> * ath10k: https://github.com/kvalo/ath (snapshot of commit
>>>>>>> 7de1931eec121045e4e35d0b519ce8bad9b10b51 | Wed Mar 23 14:27:35 2016
>>>>>>> +0200)
>>>>>>>     => backport generated using backports.git
>>>>>>>
>>>>>>> (https://git.kernel.org/cgit/linux/kernel/git/backports/backports.git)
>>>>>>> backports-20160122-0-ga91a3e6. Backporting was not clean; had to fix
>>>>>>> a
>>>>>>> few compile errors due to missing files by manually copying those
>>>>>>> files.
>>>>>>>
>>>>>>> -------------------
>>>>>>> Methodology
>>>>>>> -------------------
>>>>>>> * Setup up a hostapd 802.11ac AP on one of the boards with 80 MHz
>>>>>>> channel width and correctly specified center frequencies.
>>>>>>> * Setup monitor mode on another board for sniffing traffic on the
>>>>>>> same
>>>>>>> 80 MHz channel width.
>>>>>>> * Connect an 802.11ac capable laptop (Windows/Ubuntu) and exchange
>>>>>>> data frames with the AP | Capture them on the sniffer board (with all
>>>>>>> the VHT info in radiotap) so that they could be used as reference to
>>>>>>> construct injection frame.
>>>>>>> * Now shutdown the AP and change the interface on the AP board to
>>>>>>> monitor mode. Re-load ath10k_core with rawmode=1 and then ath10k_pci
>>>>>>> as well. Inject one of the captured frame with radiotap VHT rate info
>>>>>>> into the monitor interface and use the sniffer to check if it was
>>>>>>> transmitted.
>>>>>>> * The firmware (QCA 10.2.4.70.42-2) crashed in this case => couldn't
>>>>>>> understand the firmware crash dump. Changed the firmware to CT
>>>>>>> 10.2.4.70-31-ct-xtW-003-3b0444c.
>>>>>>> * Now the frame is transmitted and detected by the sniffer. However,
>>>>>>> the radio information via radiotap shows that it was sent with a
>>>>>>> basic
>>>>>>> rate of 802.11a.
>>>>>>> * Tried for both encrypted (WPA2) and non-encrypted frames. Result is
>>>>>>> the
>>>>>>> same.
>>>>>>>
>>>>>>> --------------------------------
>>>>>>> Other Considerations
>>>>>>> --------------------------------
>>>>>>> * The raw tx patch: As suggested on the CT firmware page, I looked
>>>>>>> into the so called "out-of-tree" raw tx patch
>>>>>>> (http://comments.gmane.org/gmane.linux.drivers.ath10k.devel/246) and
>>>>>>> tried to reconcile it with the current ath10k source. Apparently
>>>>>>> other
>>>>>>> than changes to cmd_tx.len,  the suggested changes in the patch are
>>>>>>> either already in place by use of 'txmode' variable or they are no
>>>>>>> more relevant with the new source code. For my non-encrypted frame, I
>>>>>>> got my custom ASCII string inside the frame correctly transmitted and
>>>>>>> so I 'believe' the changes to cmd_tx.len are no more required due to
>>>>>>> correct msdu->len. Thus, it seems that this patch is no more
>>>>>>> necessary
>>>>>>> and that this patch has nothing to do with correct tx rate setting.
>>>>>>> * QoS versus non-QoS: Both of my sample injection frames are QoS data
>>>>>>> with radiotap on top of it. I couldn't find a way to disable QoS and
>>>>>>> it seems that it is not required either as there is no length issue
>>>>>>> anymore as was discussed in the raw tx patch discussion; my frame is
>>>>>>> transmitted whole and correct.
>>>>>>> * VHT Parsing in Radiotap: I have double checked that my
>>>>>>> net/mac80211/tx.c has the relevant updated code wrt parsing of VHT
>>>>>>> rate information
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> (https://github.com/kvalo/ath/commit/646e76bb5daf4ca38438c69ffb72cccb605f3466)
>>>>>>> * Disabling A-MSDU: I didn't have to do this as I could resolve my
>>>>>>> firmware crash by switching to the CT firmware.
>>>>>>> * Using the ath10k master development branch: I also tried
>>>>>>> backporting
>>>>>>> master of https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git,
>>>>>>> but compilation of backported code failed due to lack of some methods
>>>>>>> such as nla_put_net64, nla_put_be64, etc. in include/net/netlink.h of
>>>>>>> my stock kernel headers (I believe). So I am not sure if things have
>>>>>>> changed since the Mar 23 2016 snapshot of ath10k github repo and now
>>>>>>> that rate is correctly set for VHT raw tx injection.
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> There is no way to specify the TX rate for individual frames with
>>>>>> CT firmware, nor with any other firmware that I am aware of.
>>>>>>
>>>>>> This is probably something I could fix, but it would be a fair bit of
>>>>>> work, and would require even more changes to the ath10k driver, so
>>>>>> at best you would have to use my kernel tree...
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Ben
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Ben Greear <greearb@candelatech.com>
>>>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> ath10k mailing list
>>>>> ath10k@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>
>>>>
>>>> --
>>>> Ben Greear <greearb@candelatech.com>
>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>
>>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
