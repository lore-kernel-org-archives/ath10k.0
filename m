Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRfPj-00013M-Vl
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 11:50:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k mesh support
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
Date: Tue, 18 Aug 2015 14:50:20 +0300
In-Reply-To: <1439738757-29199-1-git-send-email-me@bobcopeland.com> (Bob
 Copeland's message of "Sun, 16 Aug 2015 11:25:54 -0400")
Message-ID: <878u98dddv.fsf@kamboji.qca.qualcomm.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: ath10k@lists.infradead.org

Bob Copeland <me@bobcopeland.com> writes:

> This patchset implements mesh support for ath10k.  In the end there aren't
> too many changes required now that raw mode is upstream.
>
> When the module is loaded with (newly implemented) modparam rawmode=1, it
> will enable operating an open mesh STA via something like the following:
>
>     if=wlan0
>     meship=10.10.1.10
>     ip link set $if down
>     ip addr flush $if
>     iw dev $if set type mp
>     ip link set $if up
>     ip addr add $meship/24 dev $if
>     iw dev $if set freq 5745 80 5775
>     iw dev $if mesh join mesh-vht

Can you add this example to patch 3, please? Also mention in patch 3
what firmware version you used to test this. Oh, but I haven't made a
firmware release with RAW_MODE flag set. Need to do that.

> Prerequisites:
>
> * latest mac80211-next is needed to ensure that a valid AID is supplied with
> stations, without which firmware will crash.
>
> * another mac80211 patch is needed to enable VHT mesh; I'll be sending this
> separately to linux-wireless, but you can find it here:
>
> http://bobcopeland.com/kernel/wl/20150816/
>
> Notes:
> * Even with 80 MHz VHT enabled, performance is not great: I get about 65 Mbps
> OTA.  It looks like we only send 1 frame per a-mpdu; any thoughts on how
> to fix would be welcome.
>
> * I'm not crazy about requiring a modparam and advertising mesh interfaces
> that are only really usable when the modparam is set, but I'm not sure how
> to set rx decap mode on the fly and whether we can do that on a per-vif
> basis.

This is good enough for now, but I would prefer that we advertise mesh
support to user space only when the rawmode modparam is set. I guess we
should start building all iface_limits dynamically? But that's future
cleanup.

This looks good to me, I'll just wait that mac80211-next trickles down
to ath.git. But before that can you resend and also CC linux-wireless so
that this gets wider review?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
