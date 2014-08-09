Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG16g-0000dv-J9
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 07:30:27 +0000
Message-ID: <53E5CDF9.4010008@broadcom.com>
Date: Sat, 9 Aug 2014 09:30:01 +0200
From: Arend van Spriel <arend@broadcom.com>
MIME-Version: 1.0
Subject: Re: Reporting firmware stats to ethtool
References: <53E3F65D.8080102@candelatech.com>	<87wqajz6yg.fsf@kamboji.qca.qualcomm.com>	<53E4EFCB.5090501@candelatech.com>	<CAA93jw429GCjwiD0FQNFudZ0RDEKShZh4iiuOP+g+PpRjFNT7Q@mail.gmail.com>	<53E4F6B8.50009@candelatech.com>
 <53E4FEA9.80803@broadcom.com> <87vbq2uqdt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87vbq2uqdt.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, Franky Lin <frankyl@broadcom.com>

On 08/09/2014 08:30 AM, Kalle Valo wrote:
> Arend van Spriel <arend@broadcom.com> writes:
>
>>>> I do kind of prefer 64 bit counters in the general case. Nuke it from
>>>> orbit, it's the only way to be sure.
>>>
>>> It's 64-bit to user-space, but that means nothing because firmware
>>> uses 32-bit (or even 16 bit in some cases, probably) internally.
>>> A great deal of counters are the same, so be very careful when
>>> trying to keep long term counters grabbed from firmware/drivers/hardware.
>>>
>>> And, stations come and go when you re-associate, so all sorts of wifi counters
>>> reset themselves all the time...
>>
>> Does ath driver notify mac80211 about firmware restart, ie. through
>> ieee80211_restart_hw().
>
> ath10k does use ieee80211_restart_hw().
>
>> If only user-space could get that info.
>
> Yeah, that would be nice to have for ath10k firmware crash dump
> functionality. And doesn't Android also need something similar?

Probably. bcmdhd seems to send a "firmware hang" event up to wpa_supp, 
which probably ends up in the android wifi framework through the control 
interface. Currently, this is a driver private event handled by 
wpa_supplicant_lib, but it seems trivial to me to add a nl80211 event to 
trigger that.

I am not sure what infrastructure your "ath10k firmware crash dump" is 
going to use. I have seen similar thing from Marvell recently [1] which 
relies on udev and ethtool to do the work. I guess aligning the 
solutions is why this topic is listed for the wireless breakout session 
at kernel summit in Chicago.

Regards,
Arend

[1] http://www.spinics.net/lists/linux-wireless/msg123943.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
