Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoZ20-0001Zd-SA
 for ath10k@lists.infradead.org; Sat, 02 May 2015 15:08:42 +0000
Message-ID: <5544E861.7060402@candelatech.com>
Date: Sat, 02 May 2015 08:08:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Which Firmware to use for STA (999.x crashes...)
References: <CAMCCUbj4jEuU9i9s_z-9m=WTW1tSxbKa9Qp9ttWM184w3zWgbA@mail.gmail.com>
 <5543A152.5050801@candelatech.com>
 <CAMCCUbgVs6WComKHvdmLVb=quQ9WE7PcBrgZmXCURhYJVrZXFA@mail.gmail.com>
 <5543AA43.7050106@candelatech.com>
 <CAMCCUbg+eKsgPLa5b83UO5YJy3k=tOfoMW7-AR8vfsyPx-nV1g@mail.gmail.com>
 <5543B066.2090706@candelatech.com>
 <CAMCCUbgLvvHYy4FLnPW4Vf44uX5T_3++3XGSP8=qAzzu1R4f4Q@mail.gmail.com>
 <CAMCCUbiSjCVxtVPtMUWKoV_zfpyaK8FvcuvwrLu9YDMn8QMNSA@mail.gmail.com>
In-Reply-To: <CAMCCUbiSjCVxtVPtMUWKoV_zfpyaK8FvcuvwrLu9YDMn8QMNSA@mail.gmail.com>
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
To: richard mayers <richard.mayers92@gmail.com>
Cc: ath10k@lists.infradead.org



On 05/01/2015 03:50 PM, richard mayers wrote:
> I found a combination that seems to work quite well. Kernel 3.16,
> drivers backported from next-20150424, and as a firmware the candela
> one.
>
> However now I had appeared another problem. I can not read the content
> of the file fw_stats. (/sys/kernel/debug/ieee80211/ath10k/). When I
> tried to read it says :
>
> fw_stats: Connection timed out.
>
> Dmesg :
>
> ath10k_pci 0000:0c:00.0: failed to request fw stats: -110.
>
> I remember that I had the same problem with the first firmware I had
> but I never had this problem with the candela firmware.
>
> Could it be the backported driver?

Could easily be driver, but first:

Please try stock 10.1.467 firmware and see if problem exists there.
If so, then it would appear to be a driver bug.  If not, then my firmware
is at fault.

And, try the CT beta firmware if you are trying version 13 currently:

http://www.candelatech.com/downloads/ath10k-fw-beta/

Thanks,
Ben

>
> Richard.
>
> 2015-05-01 19:30 GMT+02:00 richard mayers <richard.mayers92@gmail.com>:
>> I will you let know if I find differences between kernels and driver
>> versions. So far as I said at the first message my best achievement
>> was with candela firmware, kernel 3.16 and backported driver 3.19.
>>
>> The traffic generator uses around 30%, so I guess its sufficient !
>>
>> Richard
>>
>> 2015-05-01 18:57 GMT+02:00 Ben Greear <greearb@candelatech.com>:
>>> On 05/01/2015 09:43 AM, richard mayers wrote:
>>>> I meant kernel. In the web page it says that:
>>>
>>> CT firmware should work fine with upstream kernels.  The extra benefits
>>> you might get from our modified kernels should be feature related and not performance
>>> related.  I'd be interested if you found differences in throughput using
>>> various kernels...
>>>
>>> My 4.0 tree is buggy in at least some configurations..I'm working on bisecting it now,
>>> but I would stick with our 3.17 tree for now if you are using our kernels.
>>>
>>>> To take advantage of all of the CT firmware features, please consider
>>>> using one of these kernels. Both kernels are rebased fairly often to
>>>> keep all CT patches at the top of the git changelog.
>>>>
>>>> For this measurements I am actually using old laptops. I started the
>>>> experiments with a board running OpenWrt, but the results were quite
>>>> bad. So I thought that was due to the CPU and I moved to laptops,
>>>> however I tried all the lenovo laptops I had at my disposition and
>>>> none of them were listing the network card (a lot of people had the
>>>> same problem with ). Finally, I found that the cards were recognized
>>>> in old Dell laptops, they have a dual core 1.66Ghz, Do you think is
>>>> that enough ?  I will also try to modify the sockets buffers.
>>>>
>>>> I read a paper were they report throughputs of 800-900 Mbit/s using
>>>> the same network card and running the tests in normal environments.
>>>
>>> We have seen 950Mbps on one golden Netlink AP, but cannot reliably
>>> reproduce that good throughput.
>>>
>>> Your CPU is probably sufficient...but you might check 'top'
>>> to make sure your traffic generator is not at 100% CPU.
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> Thanks !
>>>>
>>>> Richard
>>>>
>>>> 2015-05-01 18:30 GMT+02:00 Ben Greear <greearb@candelatech.com>:
>>>>> On 05/01/2015 09:21 AM, richard mayers wrote:
>>>>>> Sorry for not providing details, I wanted to focus more in the
>>>>>> firmware crash. Therefore you recommend me to use the Candela
>>>>>> firmware. If I just want to run throughput, delay, and fairness
>>>>>> measurements do you think is okay not using the kernel provided by
>>>>>> them ?.
>>>>>
>>>>>
>>>>> You mean firmware not provided by them?
>>>>>
>>>>> I'd be happy to see comparisons between my CT firmware and others,
>>>>> but if official firmware just crashes, then I guess you cannot do
>>>>> that.
>>>>>
>>>>> If you can crash CT firmware, let me know...I have a chance of
>>>>> fixing it.  I have no chance of fixing upstream firmware, but
>>>>> maybe you can get some help from QCA folks.
>>>>>
>>>>> With UDP, we often see > 700Mbps throughput, but most of these
>>>>> types of tests we do in isolation chambers cabled up.
>>>>>
>>>>> Over-the-air is probably more like 600Mbps in a clean environment.
>>>>>
>>>>> You typically have to increase kernel socket buffers to get best
>>>>> throughput, and CPU on the host starts to matter at those speeds
>>>>> as well.
>>>>>
>>>>> Antenna matter a lot...just play around with it.
>>>>>
>>>>> Thanks,
>>>>> Ben
>>>>>
>>>>>>
>>>>>> Anyway, for the throughput I do as follows:
>>>>>>
>>>>>> Tool : Iperf. (iperf -c server_ip -b 1000M -i 1)
>>>>>> Protocol : UDP
>>>>>> Channel : Over the air, with three antennas.
>>>>>> AP: hostapd, channel 149, 80Mhz. With the same kernel, driver,
>>>>>> firmware, and NIC than the Station.
>>>>>> STA: I get the maximum throughput with MCS = 5/6, when I go further to
>>>>>> 7-9 the throughput drops dramatically to 50Mbit/s.
>>>>>>
>>>>>> I think the antennas should be separated each other 12 cm, I am wrong
>>>>>> ? can this have a high impact on the throughput ?
>>>>>>
>>>>>> Richard
>>>>>>
>>>>>> 2015-05-01 17:52 GMT+02:00 Ben Greear <greearb@candelatech.com>:
>>>>>>> Candela firmware should work just fine for stations.
>>>>>>>
>>>>>>> And, when reporting throughput, you should also provide details
>>>>>>> about how you tested (tool, protocol, over-the-air or not, AP
>>>>>>> involved, etc).
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Ben
>>>>>>>
>>>>>>>
>>>>>>> On 05/01/2015 08:38 AM, richard mayers wrote:
>>>>>>>> Hi everyone!
>>>>>>>>
>>>>>>>> I need to do some 802.11ac measurements. For that I am using the
>>>>>>>> Compex wle900vx.
>>>>>>>>
>>>>>>>> I had a set up in which everything was working quite well, however I
>>>>>>>> had a maximum throughput of 380Mbits/s ( with all the debug options
>>>>>>>> enabled )
>>>>>>>>
>>>>>>>> In this first set up I had been using ubuntu 14.04 LTS, kernel version
>>>>>>>> 3.16, for the driver I used the latest stable backport (3.19) and
>>>>>>>> finally as a firmware the commercial firmware from Candela Tech
>>>>>>>> (latest version) in both the AP and STA.
>>>>>>>>
>>>>>>>> However, I read in the wiki that the latest firmware version for AP is
>>>>>>>> the 10.2.4.48, and the Stations should use 999.999.0.63. For this
>>>>>>>> second set up I changed almost everything:
>>>>>>>>
>>>>>>>> - Upgraded kernel to 4.0.1
>>>>>>>> - Backported drivers from the git Modinfo output -> (backported from
>>>>>>>> Linux (v3.2-rc1-243765-ga2ff7c6) using backports
>>>>>>>> backports-20150424-2-g982)
>>>>>>>>
>>>>>>>> AP : 10.2.4.48 firmware
>>>>>>>> STA : Following the wiki : 999.999.0.63
>>>>>>>>
>>>>>>>> During boot the firmware is loaded without any problem:
>>>>>>>>
>>>>>>>> ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
>>>>>>>> 999.999.0.636 api 2 htt 2.1 wmi 1 cal otp max_sta 16
>>>>>>>>
>>>>>>>> However when I associate with the AP, the firmware crashes.
>>>>>>>>
>>>>>>>> [11831.954992] ath10k_pci 0000:0c:00.0: firmware crashed! (uuid n/a)
>>>>>>>> [11831.955031] ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c,
>>>>>>>> 0x043202ff) fw 999.999.0.636 api 2 htt 2.1 wmi 1 cal otp max_sta 16
>>>>>>>> [11831.955039] ath10k_pci 0000:0c:00.0: debug 0 debugfs 0 tracing 0
>>>>>>>> dfs 0 testmode 0
>>>>>>>> [11831.957059] ath10k_pci 0000:0c:00.0: firmware register dump:
>>>>>>>> [11831.957068] ath10k_pci 0000:0c:00.0: [00]: 0x4100016C 0x00000000
>>>>>>>> 0x009C4521 0x00000000
>>>>>>>> [11831.957076] ath10k_pci 0000:0c:00.0: [04]: 0x009C4521 0x00060530
>>>>>>>> 0x00000019 0x00955A00
>>>>>>>> [11831.957084] ath10k_pci 0000:0c:00.0: [08]: 0x00306862 0x00000000
>>>>>>>> 0x0040CC94 0x00000020
>>>>>>>> [11831.957091] ath10k_pci 0000:0c:00.0: [12]: 0x00000000 0x00000000
>>>>>>>> 0x00958360 0x0095836B
>>>>>>>> [11831.957098] ath10k_pci 0000:0c:00.0: [16]: 0x80991091 0x0040AD94
>>>>>>>> 0x0043155C 0x00000000
>>>>>>>> [11831.957106] ath10k_pci 0000:0c:00.0: [20]: 0x0000FFFF 0x00000000
>>>>>>>> 0x0043155C 0x00000000
>>>>>>>> [11831.957114] ath10k_pci 0000:0c:00.0: [24]: 0x809A0978 0x0040AD94
>>>>>>>> 0x00439484 0xC1A18834
>>>>>>>> [11831.957121] ath10k_pci 0000:0c:00.0: [28]: 0x809AD1A2 0x0040ADE4
>>>>>>>> 0x00439484 0x0043FB1C
>>>>>>>> [11831.957129] ath10k_pci 0000:0c:00.0: [32]: 0x809B35A3 0x0000001A
>>>>>>>> 0x00440A50 0x0000000E
>>>>>>>> [11831.957136] ath10k_pci 0000:0c:00.0: [36]: 0x00000000 0x00000000
>>>>>>>> 0x00000000 0x00000000
>>>>>>>> [11831.957143] ath10k_pci 0000:0c:00.0: [40]: 0x00000000 0x00000000
>>>>>>>> 0x00000000 0x00000094
>>>>>>>> [11831.957151] ath10k_pci 0000:0c:00.0: [44]: 0x00439DC8 0x00000000
>>>>>>>> 0x00000000 0x00400000
>>>>>>>> [11831.957158] ath10k_pci 0000:0c:00.0: [48]: 0x809AE0B4 0x0040AE04
>>>>>>>> 0x00400000 0x0043FB1C
>>>>>>>> [11831.957166] ath10k_pci 0000:0c:00.0: [52]: 0x00000001 0x00000000
>>>>>>>> 0x00423410 0x00400000
>>>>>>>> [11831.957173] ath10k_pci 0000:0c:00.0: [56]: 0x809AE17E 0x0040AE44
>>>>>>>> 0x0040FE6C 0x0040D310
>>>>>>>> [11832.046908] ath10k_pci 0000:0c:00.0: failed to synchronize monitor
>>>>>>>> vdev 1 stop: -108
>>>>>>>> [11832.046915] ath10k_pci 0000:0c:00.0: failed to stop monitor vdev: -108
>>>>>>>>
>>>>>>>>   I have seen that in the past a lot of people had problems with this
>>>>>>>> firmware but since years have passed maybe the way of solving have
>>>>>>>> evolved.
>>>>>>>>
>>>>>>>> Apart from that I also got the 00:03:07:12:34:56 MAC address issue.
>>>>>>>>
>>>>>>>> Any ideas guys? Should I use the candelatech firmware for the stations ?
>>>>>>>> Richard
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> ath10k mailing list
>>>>>>>> ath10k@lists.infradead.org
>>>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> Ben Greear <greearb@candelatech.com>
>>>>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> Ben Greear <greearb@candelatech.com>
>>>>> Candela Technologies Inc  http://www.candelatech.com
>>>>>
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
