Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG91K-0005Zu-Gq
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 15:57:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Reporting firmware stats to ethtool
References: <53E3F65D.8080102@candelatech.com>
 <87wqajz6yg.fsf@kamboji.qca.qualcomm.com>
 <53E4EFCB.5090501@candelatech.com>
 <CAA93jw429GCjwiD0FQNFudZ0RDEKShZh4iiuOP+g+PpRjFNT7Q@mail.gmail.com>
 <53E4F6B8.50009@candelatech.com> <53E4FEA9.80803@broadcom.com>
 <87vbq2uqdt.fsf@kamboji.qca.qualcomm.com>
 <53E5CDF9.4010008@broadcom.com>
Date: Sat, 9 Aug 2014 18:56:55 +0300
In-Reply-To: <53E5CDF9.4010008@broadcom.com> (Arend van Spriel's message of
 "Sat, 9 Aug 2014 09:30:01 +0200")
Message-ID: <87y4uxu054.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Arend van Spriel <arend@broadcom.com>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, Franky Lin <frankyl@broadcom.com>

Arend van Spriel <arend@broadcom.com> writes:

>>> Does ath driver notify mac80211 about firmware restart, ie. through
>>> ieee80211_restart_hw().
>>
>> ath10k does use ieee80211_restart_hw().
>>
>>> If only user-space could get that info.
>>
>> Yeah, that would be nice to have for ath10k firmware crash dump
>> functionality. And doesn't Android also need something similar?
>
> Probably. bcmdhd seems to send a "firmware hang" event up to wpa_supp,
> which probably ends up in the android wifi framework through the
> control interface. Currently, this is a driver private event handled
> by wpa_supplicant_lib, but it seems trivial to me to add a nl80211
> event to trigger that.
>
> I am not sure what infrastructure your "ath10k firmware crash dump" is
> going to use.

Currently we are planning to just provide a debugfs file to retrieve the
latest dump.

> I have seen similar thing from Marvell recently [1] which relies on
> udev and ethtool to do the work. I guess aligning the solutions is why
> this topic is listed for the wireless breakout session at kernel
> summit in Chicago.

Yeah, we did talk about that a bit in the mailing list few months back.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
