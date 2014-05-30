Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqIt6-0003Nx-7z
 for ath10k@lists.infradead.org; Fri, 30 May 2014 09:14:09 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 30 May 2014 11:10:11 +0200
Subject: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>,
 <5386059B.7040301@candelatech.com>
In-Reply-To: <5386059B.7040301@candelatech.com>
Content-Language: fr-FR
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
To: Ben Greear <greearb@candelatech.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

On 05/28/2014 08:25 AM, Vu Hai NGUYEN wrote:
>>> This is set base on what driver/mac80211/cfg80211 report - function
>>> wpa_driver_nl80211_capa().
>>> With ath10k and new mac80211 this should be never set. So, seems you still
>>> have old/wrong modules and system build/configuration problem?
>>> Check cfg80211.ko/mac80211.ko ... and/or add some prints to driver_nl80211.c
>>
>>Problem solved. I looked in the driver_nl80211.c and found that use_monitor relied on "poll_command_supported" and "data_tx_status". I printed these 2 parameters and saw that data_tx_status=0, it depends on >>NL80211_FEATURE_SK_TX_STATUS and this parameter was affected to the flags of wiphy->features, defined in /net/mac80211/main.c.I find this parameter was set = 0 in /backport-include/linux/nl80211.h
>> That's why montior mode was forced to used with AP mode. I set that parameter = 1 and no more monitor interface in AP mode, my AP work in DFS mode now.
>> I'll write a mail to backport mail list to ask them why do they set that parameter=0.

>So, did my firmware actually fix something, or was the problem just with the
>backports and how you were using the official firmware?

Your firmware allows me  to enter the promiscuous mode to set up bridge network for myStation (using wpa_supplicant), If I use the official firmware (10.1.467-2.1) for my station, it crashed after associated with an AP. Thing that I've changed concern the backport, I disable monitor interface in AP mode to solve the connection problem in a channel using DFS and it doesn't concern your firmware.
Another thing that I've mentioned in my mail before that my AP create this interface when my station connected to my AP:
Interface wlan0.sta1                                                   
                ifindex 10                                                     
                wdev 0x6                                                       
                addr 04:f0:21:0e:38:be                                         
                type AP/VLAN                                                   
                channel 36 (5180 MHz), width: 40 MHz, center1: 5190 MHz
I am wrong because if I set up Router network for my STA, my AP won't create the interface wlan.sta1 when my STA connect, but if my STA is set up in Bridge network, the interface wlan0.sta1 will be created so this doesn't concern your firmware too.

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
