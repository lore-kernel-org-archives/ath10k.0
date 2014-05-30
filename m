Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqO8G-0008E2-AV
 for ath10k@lists.infradead.org; Fri, 30 May 2014 14:50:08 +0000
Message-ID: <53889A89.90802@candelatech.com>
Date: Fri, 30 May 2014 07:49:45 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E6@srvexch01.SODIELEC.local>
 <87lhttwyos.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E8@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E9@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EA@srvexch01.SODIELEC.local>
 <CALhHN=qsgcL04x+vsXgmHnSr5H-aoQW7oC5Y+NmCZCLS1DWGAQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F0@srvexch01.SODIELEC.local>
 <CAFED-j=i5uhjqaJYL+dm_ui48EFeHG3isHYSSSo=+3gk-Wa5YQ@mail.gmail.com>,
 <CALhHN=r3eYxgFTRo7zAna3q1qopo21WvzREM=6rQY6hfuQmPeQ@mail.gmail.com>,
 <EE97821C81277E459BEA5C6384C6F241012F109978F2@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>,
 <5386059B.7040301@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>



On 05/30/2014 02:10 AM, Vu Hai NGUYEN wrote:
> On 05/28/2014 08:25 AM, Vu Hai NGUYEN wrote:
>>>> This is set base on what driver/mac80211/cfg80211 report - function
>>>> wpa_driver_nl80211_capa().
>>>> With ath10k and new mac80211 this should be never set. So, seems you still
>>>> have old/wrong modules and system build/configuration problem?
>>>> Check cfg80211.ko/mac80211.ko ... and/or add some prints to driver_nl80211.c
>>>
>>> Problem solved. I looked in the driver_nl80211.c and found that use_monitor relied on "poll_command_supported" and "data_tx_status". I printed these 2 parameters and saw that data_tx_status=0, it depends on >>NL80211_FEATURE_SK_TX_STATUS and this parameter was affected to the flags of wiphy->features, defined in /net/mac80211/main.c.I find this parameter was set = 0 in /backport-include/linux/nl80211.h
>>> That's why montior mode was forced to used with AP mode. I set that parameter = 1 and no more monitor interface in AP mode, my AP work in DFS mode now.
>>> I'll write a mail to backport mail list to ask them why do they set that parameter=0.
>
>> So, did my firmware actually fix something, or was the problem just with the
>> backports and how you were using the official firmware?
>
> Your firmware allows me  to enter the promiscuous mode to set up bridge network for myStation (using wpa_supplicant), If I use the official firmware (10.1.467-2.1) for my station, it crashed after associated with an AP. Thing that I've changed concern the backport, I disable monitor interface in AP mode to solve the connection problem in a channel using DFS and it doesn't concern your firmware.

Thanks for the confirmation.  I haven't tested bridged networks yet, but maybe you were
hitting some more general firmware problem that I had already fixed.

Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
