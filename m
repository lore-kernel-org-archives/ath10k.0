Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpg7H-0001wJ-TK
 for ath10k@lists.infradead.org; Wed, 28 May 2014 15:50:13 +0000
Message-ID: <5386059B.7040301@candelatech.com>
Date: Wed, 28 May 2014 08:49:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <CALhHN=oC4LdH0vr31dAZpvFLjZnJJ_Bg2d=pnCved6TKAmwi0A@mail.gmail.com>
 <CALhHN=rw7=nm8ZoMVm1u=nVou1OLY30jUq0G6LvA861Yrknn_Q@mail.gmail.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

On 05/28/2014 08:25 AM, Vu Hai NGUYEN wrote:
>> This is set base on what driver/mac80211/cfg80211 report - function
>> wpa_driver_nl80211_capa().
>> With ath10k and new mac80211 this should be never set. So, seems you still
>> have old/wrong modules and system build/configuration problem?
>> Check cfg80211.ko/mac80211.ko ... and/or add some prints to driver_nl80211.c
> 
> Problem solved. I looked in the driver_nl80211.c and found that use_monitor relied on "poll_command_supported" and "data_tx_status". I printed these 2 parameters and saw that data_tx_status=0, it depends on NL80211_FEATURE_SK_TX_STATUS and this parameter was affected to the flags of wiphy->features, defined in /net/mac80211/main.c.I find this parameter was set = 0 in /backport-include/linux/nl80211.h
> That's why montior mode was forced to used with AP mode. I set that parameter = 1 and no more monitor interface in AP mode, my AP work in DFS mode now.
> I'll write a mail to backport mail list to ask them why do they set that parameter=0. 

So, did my firmware actually fix something, or was the problem just with the
backports and how you were using the official firmware?

> 
> I get another question: There a conflict of information about HT40+ and HT40- in hostapd and ht40allow_map (fromdebugfs). 
> In the hostapd.conf example file:
> #      Note: There are limits on which channels can be used with HT40- and
> #	HT40+. Following table shows the channels that may be available for
> #	HT40- and HT40+ use per IEEE 802.11n Annex J:
> #	freq		HT40-		HT40+
> #	5 GHz	40,48,56,64	36,44,52,60   
> It means the channel 48 is not available in HT40+. But the info from ht40allow_map said that channel 5240 Mhz (ie 48) is available in both 40+ and 40-.
> If I set ht-capab=[HT40+] and channel=48, hostapd can not setup AP mode.
> And the channel 140 can not be set neither in bandwidth 40+ nor 40- even my "iw list' show that channel 140 is available. 
> Is there a problem with ht40allow_map?

I'm not sure about any of this...might want to look at the hostapd code or log messages
to see why it fails to start.

Thanks,
Ben


> 
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
> 
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
