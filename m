Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSOpW-0005vq-E2
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 13:25:01 +0000
Received: from mail-oi0-f71.google.com ([209.85.218.71])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bSOp5-0004AI-Ji
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 21:24:32 +0800
Received: by mail-oi0-f71.google.com with SMTP id q62so105965oih.0
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 06:24:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57919126.7000601@candelatech.com>
References: <CA+uUJGu6qSmxupEkaqPmLBQf53wQtjyXidFCf+4X9vMxL4WmoA@mail.gmail.com>
 <CABPxzY+KHVGAUKjU2kWdKiEPZFV3=sOnWe-qBMDOPffw_vJ0+g@mail.gmail.com>
 <5790FBF0.2060800@candelatech.com>
 <CA+uUJGv4qD=-su8792tWEHCJQg5soXfQ6trzb5mwxteXDD_ZRA@mail.gmail.com>
 <57919126.7000601@candelatech.com>
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Wed, 27 Jul 2016 20:23:48 +0700
Message-ID: <CA+uUJGsf3MeGtdM=DmDOsFgmQNRpi8gbttFPw1ctJCxX0EsrwQ@mail.gmail.com>
Subject: Re: Completely disabling RTS/CTS
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
Cc: Krishna Chaitanya <chaitanya.mgit@gmail.com>, ath10k <ath10k@lists.infradead.org>

Hi Ben,

Thanks for the info. I investigated further to find that the two
firmware params ENABLE_RTSCTS and RTS_THRESHOLD are not respected by
the firmware rate control. I completely ensured that these params are
always set such that RTS/CTS can never happen. Yet I can see RTS/CTS
exchanges. Further I found from the sniffed traces that these RTS/CTS
exchanges happen whenever there are A-MPDU re-transmissions i.e. the
whole A-MPDU is lost. I suppose with such an incident the firmware
rate control infers collisions and thus activates RTS/CTS for the next
A-MPDU.

Thus a crude workaround would be to bring down the A-MPDU
re-transmissions. With lower bitrates (NSS-1, MCS-0), obviously I can
see less RTS/CTS exchanges than with the higher ones. However, it
doesn't help my purpose. I also played around aggregation. The default
aggregation setting is to have AMSDUs of maximum size 3 within an
A-MPDU. Unlike I imagined earlier, there is no significant change in
the number of A-MPDU re-transmissions when I disable AMSDU completely
(of course for the same link quality).

I really wished that the firmware rate control totally respected the
ENABLE_RTSCTS param. Nevertheless are there any better suggestions to
lower the A-MPDU re-transmissions. It would be a great help to know.

Thanks,
Raj Joshi

On Fri, Jul 22, 2016 at 10:21 AM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 07/21/2016 07:54 PM, Raj Joshi wrote:
>>
>> I am operating VHT (802.11ac) in AP-client configuration and thus
>> aggregation is inevitable (as per the standard) as well as desirable
>> (I suppose). I am receiving all A-MSDUs and not A-MPDUs. Now since
>> losses are expensive to recover in case of A-MSDUs than A-MPDUs, is
>> that the reason that there are intermittent RTS/CTS frames by rate
>> control?
>>
>> If the culprit is firmware rate-control, I can try setting the bitrate
>> mask and check again. Also how can I force the use of A-MPDUs rather
>> than A-MSDUs? If this is outside the purview of firmware rate control,
>> then I can try this one as well.
>
>
> AMPDU and AMSDU should work fine in STA and AP mode.  If you are using IBSS,
> then firmware must disable AMSDU since there seems to be some hardware bug
> with
> IBSS and AMSDU.
>
> I don't think you can affect RTS/CTS from the host.  I think it would
> require
> a firmware code change to disable RTS/CTS rate-code entries.
>
> I think there is a way to set the AMSDU size, and you could make it small
> enough to effectively disable AMSDU.
>
> Thanks,
> Ben
>
>
>>
>> Thanks,
>> Raj Joshi
>>
>>
>> On Fri, Jul 22, 2016 at 12:44 AM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>> On 07/21/2016 07:29 AM, Krishna Chaitanya wrote:
>>>>
>>>>
>>>> On Thu, Jul 21, 2016 at 7:45 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg>
>>>> wrote:
>>>>>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> I am trying to "completely" disable RTS/CTS.
>>>>>
>>>>> * Case 1: Using iw/iwconfig when I set the sender's RTS threshold to a
>>>>> very high value (RTS thr=10000 B), I expect that no RTS should be
>>>>> sent. However, it seems that this threshold is not being honored and I
>>>>> can sniff large number of RTS/CTS frames. I verified that no A-MSDU is
>>>>> exceeding 10000 B.
>>>>> * Case 2: Interestingly, when I set the sender's RTS threshold to off
>>>>> (RTS thr:off), compared to case #1 much less number of RTS/CTS frames
>>>>> are seen and throughput is seen to improve. But I can still see
>>>>> RTS/CTS frames being sent.
>>>>> * Since the channel is clear and much isolated, and there is just one
>>>>> AP and one STA, there is negligible chance of other factors playing
>>>>> any role.
>>>>> * There is one change though that I have disabled dynamic bandwidth
>>>>> i.e. ar->wmi.pdev_param->dynamic_bw set zero in mac.c. I believe this
>>>>> is likely not an issue as similar RTS/CTS behavior is seen even with
>>>>> dynamic_bw set to 1 (there are no heterogeneous channel widths in the
>>>>> network in any case).
>>>>> * Another thing I noticed is that the RTS/CTS protection mode if set,
>>>>> it is set to CTS-to-self, rather than "RTS/CTS" i.e.
>>>>> ar->wmi.vdev_param->protection_mode in mac.c is either set to 1 or 0
>>>>> (depending upon use_cts_prot), but not 2. This probably seems not
>>>>> helpful in hidden node scenarios as the CTS frame is unicasted instead
>>>>> broadcasting.
>>>>>
>>>>> I would appreciate any pointers on completely disabling RTS/CTS as
>>>>> well as the ability to choose between complete RTS/CTS versus
>>>>> CTS-to-self whenever RTS/CTS is enabled.
>>>>
>>>>
>>>> Which mode is this? For aggregated frames (AMPDU) RTS Threshold is
>>>> not checked, so it can still be enabled
>>>
>>>
>>>
>>> Probably would require firmware changes to fully disable RTS/CTS
>>> from what I recall when I was reading the rate-ctrl code...
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
Raj Joshi


On Fri, Jul 22, 2016 at 11:21 AM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 07/21/2016 07:54 PM, Raj Joshi wrote:
>>
>> I am operating VHT (802.11ac) in AP-client configuration and thus
>> aggregation is inevitable (as per the standard) as well as desirable
>> (I suppose). I am receiving all A-MSDUs and not A-MPDUs. Now since
>> losses are expensive to recover in case of A-MSDUs than A-MPDUs, is
>> that the reason that there are intermittent RTS/CTS frames by rate
>> control?
>>
>> If the culprit is firmware rate-control, I can try setting the bitrate
>> mask and check again. Also how can I force the use of A-MPDUs rather
>> than A-MSDUs? If this is outside the purview of firmware rate control,
>> then I can try this one as well.
>
>
> AMPDU and AMSDU should work fine in STA and AP mode.  If you are using IBSS,
> then firmware must disable AMSDU since there seems to be some hardware bug
> with
> IBSS and AMSDU.
>
> I don't think you can affect RTS/CTS from the host.  I think it would
> require
> a firmware code change to disable RTS/CTS rate-code entries.
>
> I think there is a way to set the AMSDU size, and you could make it small
> enough to effectively disable AMSDU.
>
> Thanks,
> Ben
>
>
>>
>> Thanks,
>> Raj Joshi
>>
>>
>> On Fri, Jul 22, 2016 at 12:44 AM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>> On 07/21/2016 07:29 AM, Krishna Chaitanya wrote:
>>>>
>>>>
>>>> On Thu, Jul 21, 2016 at 7:45 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg>
>>>> wrote:
>>>>>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> I am trying to "completely" disable RTS/CTS.
>>>>>
>>>>> * Case 1: Using iw/iwconfig when I set the sender's RTS threshold to a
>>>>> very high value (RTS thr=10000 B), I expect that no RTS should be
>>>>> sent. However, it seems that this threshold is not being honored and I
>>>>> can sniff large number of RTS/CTS frames. I verified that no A-MSDU is
>>>>> exceeding 10000 B.
>>>>> * Case 2: Interestingly, when I set the sender's RTS threshold to off
>>>>> (RTS thr:off), compared to case #1 much less number of RTS/CTS frames
>>>>> are seen and throughput is seen to improve. But I can still see
>>>>> RTS/CTS frames being sent.
>>>>> * Since the channel is clear and much isolated, and there is just one
>>>>> AP and one STA, there is negligible chance of other factors playing
>>>>> any role.
>>>>> * There is one change though that I have disabled dynamic bandwidth
>>>>> i.e. ar->wmi.pdev_param->dynamic_bw set zero in mac.c. I believe this
>>>>> is likely not an issue as similar RTS/CTS behavior is seen even with
>>>>> dynamic_bw set to 1 (there are no heterogeneous channel widths in the
>>>>> network in any case).
>>>>> * Another thing I noticed is that the RTS/CTS protection mode if set,
>>>>> it is set to CTS-to-self, rather than "RTS/CTS" i.e.
>>>>> ar->wmi.vdev_param->protection_mode in mac.c is either set to 1 or 0
>>>>> (depending upon use_cts_prot), but not 2. This probably seems not
>>>>> helpful in hidden node scenarios as the CTS frame is unicasted instead
>>>>> broadcasting.
>>>>>
>>>>> I would appreciate any pointers on completely disabling RTS/CTS as
>>>>> well as the ability to choose between complete RTS/CTS versus
>>>>> CTS-to-self whenever RTS/CTS is enabled.
>>>>
>>>>
>>>> Which mode is this? For aggregated frames (AMPDU) RTS Threshold is
>>>> not checked, so it can still be enabled
>>>
>>>
>>>
>>> Probably would require firmware changes to fully disable RTS/CTS
>>> from what I recall when I was reading the rate-ctrl code...
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
Raj Joshi


On Fri, Jul 22, 2016 at 10:21 AM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 07/21/2016 07:54 PM, Raj Joshi wrote:
>>
>> I am operating VHT (802.11ac) in AP-client configuration and thus
>> aggregation is inevitable (as per the standard) as well as desirable
>> (I suppose). I am receiving all A-MSDUs and not A-MPDUs. Now since
>> losses are expensive to recover in case of A-MSDUs than A-MPDUs, is
>> that the reason that there are intermittent RTS/CTS frames by rate
>> control?
>>
>> If the culprit is firmware rate-control, I can try setting the bitrate
>> mask and check again. Also how can I force the use of A-MPDUs rather
>> than A-MSDUs? If this is outside the purview of firmware rate control,
>> then I can try this one as well.
>
>
> AMPDU and AMSDU should work fine in STA and AP mode.  If you are using IBSS,
> then firmware must disable AMSDU since there seems to be some hardware bug
> with
> IBSS and AMSDU.
>
> I don't think you can affect RTS/CTS from the host.  I think it would
> require
> a firmware code change to disable RTS/CTS rate-code entries.
>
> I think there is a way to set the AMSDU size, and you could make it small
> enough to effectively disable AMSDU.
>
> Thanks,
> Ben
>
>
>>
>> Thanks,
>> Raj Joshi
>>
>>
>> On Fri, Jul 22, 2016 at 12:44 AM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>> On 07/21/2016 07:29 AM, Krishna Chaitanya wrote:
>>>>
>>>>
>>>> On Thu, Jul 21, 2016 at 7:45 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg>
>>>> wrote:
>>>>>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> I am trying to "completely" disable RTS/CTS.
>>>>>
>>>>> * Case 1: Using iw/iwconfig when I set the sender's RTS threshold to a
>>>>> very high value (RTS thr=10000 B), I expect that no RTS should be
>>>>> sent. However, it seems that this threshold is not being honored and I
>>>>> can sniff large number of RTS/CTS frames. I verified that no A-MSDU is
>>>>> exceeding 10000 B.
>>>>> * Case 2: Interestingly, when I set the sender's RTS threshold to off
>>>>> (RTS thr:off), compared to case #1 much less number of RTS/CTS frames
>>>>> are seen and throughput is seen to improve. But I can still see
>>>>> RTS/CTS frames being sent.
>>>>> * Since the channel is clear and much isolated, and there is just one
>>>>> AP and one STA, there is negligible chance of other factors playing
>>>>> any role.
>>>>> * There is one change though that I have disabled dynamic bandwidth
>>>>> i.e. ar->wmi.pdev_param->dynamic_bw set zero in mac.c. I believe this
>>>>> is likely not an issue as similar RTS/CTS behavior is seen even with
>>>>> dynamic_bw set to 1 (there are no heterogeneous channel widths in the
>>>>> network in any case).
>>>>> * Another thing I noticed is that the RTS/CTS protection mode if set,
>>>>> it is set to CTS-to-self, rather than "RTS/CTS" i.e.
>>>>> ar->wmi.vdev_param->protection_mode in mac.c is either set to 1 or 0
>>>>> (depending upon use_cts_prot), but not 2. This probably seems not
>>>>> helpful in hidden node scenarios as the CTS frame is unicasted instead
>>>>> broadcasting.
>>>>>
>>>>> I would appreciate any pointers on completely disabling RTS/CTS as
>>>>> well as the ability to choose between complete RTS/CTS versus
>>>>> CTS-to-self whenever RTS/CTS is enabled.
>>>>
>>>>
>>>> Which mode is this? For aggregated frames (AMPDU) RTS Threshold is
>>>> not checked, so it can still be enabled
>>>
>>>
>>>
>>> Probably would require firmware changes to fully disable RTS/CTS
>>> from what I recall when I was reading the rate-ctrl code...
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
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
