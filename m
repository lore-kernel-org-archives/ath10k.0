Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuVr0-000730-Sq
 for ath10k@lists.infradead.org; Sat, 29 Nov 2014 00:25:39 +0000
Received: by mail-wg0-f54.google.com with SMTP id l2so9916711wgh.13
 for <ath10k@lists.infradead.org>; Fri, 28 Nov 2014 16:25:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5478A2B2.3090402@candelatech.com>
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
 <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
 <CAEFj987HmrPz1vsjmckURuC4ZYT2h6MgBT6K3yQTWy3U5s+ZtQ@mail.gmail.com>
 <5478A2B2.3090402@candelatech.com>
Date: Sat, 29 Nov 2014 08:25:16 +0800
Message-ID: <CAEFj987J63pkrWvxg_S6onTQDJuOMjo2Bc=5hnC2PzMTEWXEKQ@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Pushpal Sidhu <psidhu@gateworks.com>, ath10k <ath10k@lists.infradead.org>

On Sat, Nov 29, 2014 at 12:28 AM, Ben Greear <greearb@candelatech.com> wrote:
> I'll investigate the rate-control logic.  I don't know enough
> about IBSS currently to know why it would use different rate-ctrl logic than
> the normal sta/ap, but hopefully I can figure it out.
>
> Can you post some details on how you configure HT20 v/s legacy mode
> for IBSS interfaces?

Alright, this is how I configure adhoc mode.

HT20 Mode:
iw phy0 interface add wlan0 type adhoc
ifconfig wlan0 1.1.1.1 netmask 255.255.255.0
iw wlan0 ibss join adhocnet 5180 HT20

Legacy Mode:
iw phy0 interface add wlan0 type adhoc
ifconfig wlan0 1.1.1.1 netmask 255.255.255.0
iw wlan0 ibss join adhocnet 5180

By the way, the peer in ath10k is up in legacy mode first before
updating the rate to HT20, triggered by drv_sta_rc_update in
net/mac80211/ibss.c.

Is EEE80211_RC_SUPP_RATES_CHANGED working correctly for ath10k?

>
> Do you have any reason to believe the problem is in the driver or mac80211
> stack, or is this all a firmware issue?
>

Rate control is implemented in firmware, right? So it should be
firmware issue unless we intended to use the rate control implemented
in mac80211 (minstrel).

By the way, I haven't done the testing on CT firmware. But as far as I
know, for 363 firmware, the setting of higher fixed TX rate is
possible if you configure HT20, such as follow:

iw wlanX set bitrates legacy-5 ht-mcs-5 3 vht-mcs-5
will setup HT, nss=1, mcs=3

So I think that rate control logic in firmware is not working properly
in IBSS mode.

> And, if anyone has a different /AC NIC that can do IBSS, I'm curious
> if ath10k will receive at higher speeds?
>

ath9k but the rate control is managed by mac80211.

----
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
