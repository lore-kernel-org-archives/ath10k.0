Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f172.google.com ([209.85.223.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRgEF-0005L3-O3
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 12:43:00 +0000
Received: by iodb91 with SMTP id b91so186503363iod.1
 for <ath10k@lists.infradead.org>; Tue, 18 Aug 2015 05:42:37 -0700 (PDT)
Date: Tue, 18 Aug 2015 08:42:33 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 0/3] ath10k mesh support
Message-ID: <20150818124233.GA867@localhost>
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
 <878u98dddv.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878u98dddv.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On Tue, Aug 18, 2015 at 02:50:20PM +0300, Kalle Valo wrote:
> Bob Copeland <me@bobcopeland.com> writes:
> >
> >     if=wlan0
> >     meship=10.10.1.10
> >     ip link set $if down
> >     ip addr flush $if
> >     iw dev $if set type mp
> >     ip link set $if up
> >     ip addr add $meship/24 dev $if
> >     iw dev $if set freq 5745 80 5775
> >     iw dev $if mesh join mesh-vht
> 
> Can you add this example to patch 3, please? Also mention in patch 3
> what firmware version you used to test this. Oh, but I haven't made a
> firmware release with RAW_MODE flag set. Need to do that.

Sure -- yes I guess this patch is also missing a check for the firmware
feature flag (although it works on 10.2.4.70-2 apparently) -- will add
once you do such a release.

> > * I'm not crazy about requiring a modparam and advertising mesh interfaces
> > that are only really usable when the modparam is set, but I'm not sure how
> > to set rx decap mode on the fly and whether we can do that on a per-vif
> > basis.
> 
> This is good enough for now, but I would prefer that we advertise mesh
> support to user space only when the rawmode modparam is set. I guess we
> should start building all iface_limits dynamically? But that's future
> cleanup.

I started down this path originally, but "it's complicated."  There's a
bit of a combinatorial explosion problem since there are already 4
different if_limits with different combinations.  I guess we could
iterate over them and set the bits just before calling into mac80211,
but we'd need to cast away a const or two.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
