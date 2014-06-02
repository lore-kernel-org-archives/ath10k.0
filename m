Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrMHv-0006sX-0X
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 07:04:08 +0000
Received: by mail-qg0-f45.google.com with SMTP id z60so10046812qgd.18
 for <ath10k@lists.infradead.org>; Mon, 02 Jun 2014 00:03:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978F7@srvexch01.SODIELEC.local>
References: <CALhHN=ox62ktxxNwcmkbc6BfTU7o+vHXnXEwHT1dp2zrBrosJw@mail.gmail.com>
 <CALhHN=qkqvrj+GdBJ6oakd=jzX+6M2-Vb=EJjXvxDC+B+rLytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F7@srvexch01.SODIELEC.local>
Date: Mon, 2 Jun 2014 09:03:39 +0200
Message-ID: <CALhHN=q1iReDZK-Py1LwVgg3L2Bz2nuThEDMOjJDoNAq0hJKfA@mail.gmail.com>
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

On 30 May 2014 13:55, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>> OK, btw I see there is a bug when sending frame using monitor
>>> interface in mac80211 in ieee80211_monitor_start_xmit() - because of
>>> that you have this problem. Seems for old kernel < 3.3.0 monitor
>>> interface is required.
>>> I will fix mac80211 issue when monitor is used.
>
>>Please remove your hack (use_monitor again) and check attached patch.
>
> Thanks for the the patch, I applied and it worked with a monitor interface in AP mode. But do you why does it require monitor interface for old kernel < 3.3.0?
>
Seems < 3.3.0 tx_status is not reported correctly to user mode (or at
all). This is not problem in case of probe responses while hostapd
don't care about status in such case (your hack works). But
action/null frames still need correct ACK and monitor iface for <
3.3.0.

> Btw, I have a doubt, in both case (I means when I applied your patch or my hack), I have to run the command "iw wlan0 scan" (after running wpa_supplicant) on my station to connect if the channel employs DFS
> If the channel doesn't employs DFS, it can connect directly after running wpa_supplicant.
Seems you hit wpa_supplicant issue, which Jouni already fix, check this thread:

http://comments.gmane.org/gmane.linux.drivers.hostap/30454

BR
Janusz

>
>>> I get another question: There a conflict of information about HT40+ and HT40- in hostapd and ht40allow_map (fromdebugfs).
>>> In the hostapd.conf example file:
>>> #      Note: There are limits on which channels can be used with HT40- and
>>> #       HT40+. Following table shows the channels that may be available for
>>> #       HT40- and HT40+ use per IEEE 802.11n Annex J:
>>> #       freq            HT40-           HT40+
>>> #       5 GHz   40,48,56,64     36,44,52,60
>>> It means the channel 48 is not available in HT40+. But the info from ht40allow_map said that channel 5240 Mhz (ie 48) is available in both 40+ and 40-.
>>> If I set ht-capab=[HT40+] and channel=48, hostapd can not setup AP mode.
>>> And the channel 140 can not be set neither in bandwidth 40+ nor 40- even my "iw list' show that channel 140 is available.
>>> Is there a problem with ht40allow_map?
>>>
>> Seems ht40allow_map don't care about 80211n standard, just check
>> neighbor channels and set -/+. So, hostapd play with this correctly.
>> channel 140 as I remember correctly is disabled for all atheros cards.
>> I think Luis write about it.
>
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
