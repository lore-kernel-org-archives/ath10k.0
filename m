Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4MbY-0008Vh-Kk
 for ath10k@lists.infradead.org; Wed, 19 Feb 2020 10:29:22 +0000
Message-ID: <5E4D0DFA.3080409@candelatech.com>
Date: Wed, 19 Feb 2020 02:29:14 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Management rate-control on IPQ4019
References: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
 <5E4C41F3.2000500@candelatech.com>
 <40026add-c28a-da90-f17a-feeb8379c544@david-bauer.net>
In-Reply-To: <40026add-c28a-da90-f17a-feeb8379c544@david-bauer.net>
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
To: David Bauer <mail@david-bauer.net>
Cc: ath10k@lists.infradead.org

On 02/18/2020 03:06 PM, David Bauer wrote:
> Hello Ben,
>
> On 2/18/20 8:58 PM, Ben Greear wrote:
>> On 02/18/2020 11:12 AM, David Bauer wrote:
>>> Hello,
>>>
>>> while playing around with the 2.4GHz WiFi part of the IPQ4019, i was
>>> expecting being able to set the rate at which IPQ4019 transmits it's beacon
>>> frames.
>>>
>>> Using OpenWrt, setting "legacy_rates=0" on the radio leads to only advertising
>>> 802.11g speeds, however the beacons are still sent out at 1 Mbit/s. Using a QCA9984,
>>> the beacons are correctly sent out at the lowest 802.11g rate (6 Mbit/s). So i assume
>>> this is either a bug in the ath10k firmware or a hardware-shortcoming. Has anyone else
>>> experienced this bug and is it likely we'll see it fixed in a later firmware release?
>>>
>>> Hardware: IPQ4029 (Aruba AP-303)
>>> Firmware  Version: 10.4-3.6-00140 / 10.4-3.5.3-00078
>>
>> There are separate API for setting management frame rates.  I forget exactly how
>> upstream supports this, but maybe check debugfs?
>
> I'm using the mac80211 interface here [0], which works well for the QCA9984, but not for
> the IPQ4019. I'm not aware of a debugfs interface with ath10k for setting the management
> rate.
>
> I can try the one ath10k-ct implements, but the fact it works on the QCA9984 makes me believe
> the culprit is the firmware. The patch adding support for mgmt-rate setting does not list the
> IPQ4019 as a tested platform also.
>
> [0] https://patchwork.kernel.org/patch/10593573/

Ok, maybe so.  I compile all of the wave-2 targets from the same firmware source,
but maybe upstream 4019 firmware lags others for one reason or another.

If you want to try -ct firmware/driver, please search for "Set multicast, broadcast, beacon tx rates."
in the link below:

http://www.candelatech.com/ath10k-ug.php

Possibly these driver changes will work with upstream firmware, I have not tried it.

# cat /debug/ieee80211/wiphy1/ath10k/set_rates
This is to set fixed bcast, mcast, and beacon rates.  Normal rate-ctrl
is handled through normal API using 'iw', etc.
To set a value, you specify the dev-name, type, band and rate-code:
types: bcast, mcast, beacon
bands: 2, 5, 60
rate-codes: 0x43 1M, 0x42 2M, 0x41 5.5M, 0x40 11M, 0x3 6M, 0x7 9M, 0x2 12M, 0x6 18M, 0x1 24M, 0x5 36M, 0x0 48M, 0x4 54M, 0xFF default
  For example, to set beacon to 18Mbps on wlan0:  echo "wlan0 beacon 2 0x6" > /debug/..../set_rates

I'm not sure if 'beacon' also controls other mgt frames or not w/out reviewing the code.

Thanks,
Ben

>
> Best wishes
> David
>
>>
>> Thanks,
>> Ben
>>
>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
