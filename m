Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd8R4-0000kr-Rv
 for ath10k@lists.infradead.org; Tue, 18 Jun 2019 07:21:44 +0000
Subject: RE: [PATCH] ath10k: add mic bytes for pmf management packet
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Tue, 18 Jun 2019 07:21:30 +0000
Message-ID: <9403fef58374427fa76fb32ee64ee333@aptaiexm02f.ap.qualcomm.com>
References: <1560757079-19266-1-git-send-email-wgong@codeaurora.org>
 <136d04d4-671b-8dde-2abd-63070b07bd26@candelatech.com>
In-Reply-To: <136d04d4-671b-8dde-2abd-63070b07bd26@candelatech.com>
Content-Language: en-US
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
To: Ben Greear <greearb@candelatech.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Ben
> Greear
> Sent: Tuesday, June 18, 2019 12:04 AM
> To: Wen Gong <wgong@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: [EXT] Re: [PATCH] ath10k: add mic bytes for pmf management
> packet
> 
> I was looking at mac80211 code recently, and it seems some action
> frames are NOT supposed to be protected.  I added my own helper
> method to my local ath10k.  Maybe you want to use this?
> 
> 
> /* Copied from ieee80211_is_robust_mgmt_frame, but disable the check for
> has_protected
>   * since we do tx hw crypt, and it won't actually be encrypted even when this
> flag is
>   * set.
>   */
> bool ieee80211_is_robust_mgmt_frame_tx(struct ieee80211_hdr *hdr)
> {
>          if (ieee80211_is_disassoc(hdr->frame_control) ||
>              ieee80211_is_deauth(hdr->frame_control))
>                  return true;
> 
>          if (ieee80211_is_action(hdr->frame_control)) {
>                  u8 *category;
> 
>                  /*
>                   * Action frames, excluding Public Action frames, are Robust
>                   * Management Frames. However, if we are looking at a Protected
>                   * frame, skip the check since the data may be encrypted and
>                   * the frame has already been found to be a Robust Management
>                   * Frame (by the other end).
>                   */
> 		/*
> 		if (ieee80211_has_protected(hdr->frame_control))
>                          return true;
> 		*/
>                  category = ((u8 *) hdr) + 24;
>                  return *category != WLAN_CATEGORY_PUBLIC &&
>                          *category != WLAN_CATEGORY_HT &&
>                          *category != WLAN_CATEGORY_WNM_UNPROTECTED &&
>                          *category != WLAN_CATEGORY_SELF_PROTECTED &&
>                          *category != WLAN_CATEGORY_UNPROT_DMG &&
>                          *category != WLAN_CATEGORY_VHT &&
>                          *category != WLAN_CATEGORY_VENDOR_SPECIFIC;
>          }
> 
>          return false;
> }
> 
> Thanks,
> Ben
> 
> > +
> >   	data_len = msdu->len;
> >
> >   	switch (txmode) {
> >
> 
> 
Thanks Ben,

seems the ieee80211_is_robust_mgmt_frame_tx is not 
match my change.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
