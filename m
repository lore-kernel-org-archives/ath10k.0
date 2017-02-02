Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cZK6E-0003PO-EK
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 16:19:08 +0000
Subject: Re: 9984 VHT
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
 <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
 <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
 <ed765a12-6ae8-ed78-6626-ae82312ba525@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <8bcf2ea6-802f-f249-8e2d-96ec03553a9b@candelatech.com>
Date: Thu, 2 Feb 2017 08:18:44 -0800
MIME-Version: 1.0
In-Reply-To: <ed765a12-6ae8-ed78-6626-ae82312ba525@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/01/2017 10:45 AM, Sebastian Gottschall wrote:
> Am 01.02.2017 um 17:48 schrieb Ben Greear:
>> On 01/30/2017 02:28 AM, Sebastian Gottschall wrote:
>>> Hello
>>>
>>> with recent 9984 firmares vht160 seem to crash the firmware itself for no reason i see.
>>> is there any internal structure change in these newer firmwares we need to consider?
>>> i also tested the even more recent firmware firmware-5.bin_10.4-3.4-00068 from codeaurora. this one doesnt crash but the vdev_start returns with a error
>>>
>>> i compared the more recent wmi headers from the qca drivers, but wasnt able to find anything which could explain the behaviour
>>>
>>> Sebastian
>>>
>>>
>>
>> Hello Sebastian,
>>
>> Could you share the hostapd/supplicant config file you are using?
>>
>> And, what kernel (or backports kernel) are you using?  I'd like to
>> see how 160Mhz works on my firmware....
> always state of art for sure

Using a somewhat hacked 4.9.2+ kernel and my CT firmware, I get failure to start CAC:

1486052184.818710: Mode: IEEE 802.11a  Channel: 100  Frequency: 5500 MHz
1486052184.818714: DFS 8 channels required radar detection
1486052184.818717: DFS all channels available, (SKIP CAC): no
1486052184.818719: DFS 0 chans unavailable - choose other channel: no
1486052184.818722: vap0: interface state COUNTRY_UPDATE->DFS
1486052184.818725: DFS start CAC on 5500 MHz
1486052184.818733: vap0: DFS-CAC-START freq=5500 chan=100 sec_chan=1, width=2, seg0=114, seg1=0, cac_time=60s
1486052184.818737: nl80211: Start radar detection (CAC) 5500 MHz (ht_enabled=1, vht_enabled=1, bandwidth=160 MHz, cf1=5570 MHz, cf2=0 MHz)
1486052184.818742:   * freq=5500
1486052184.818745:   * vht_enabled=1
1486052184.818747:   * ht_enabled=1
1486052184.818749:   * bandwidth=160
1486052184.818751:   * channel_width=5
1486052184.818754:   * center_freq1=5570
1486052184.818756:   * center_freq2=0
1486052184.823437: nl80211: Failed to start radar detection: -16 (Device or resource busy)
1486052184.823444: DFS start_dfs_cac() failed, -1


I'll go dig around to see if I can figure out why...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
