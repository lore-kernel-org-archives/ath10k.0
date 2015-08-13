Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f182.google.com ([209.85.223.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPiz7-0003fN-2n
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 03:15:17 +0000
Received: by iodt126 with SMTP id t126so40010173iod.2
 for <ath10k@lists.infradead.org>; Wed, 12 Aug 2015 20:14:52 -0700 (PDT)
Date: Wed, 12 Aug 2015 23:14:44 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150813031444.GA18358@localhost>
References: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
 <20150706214921.GF23012@localhost>
 <20150712142532.GA24495@localhost>
 <20150713014333.GA14152@localhost>
 <CA+BoTQnSJWGq-Pq2aRLvOC9_ieR5GyYk=BoZsNLsszfYPZ-6+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnSJWGq-Pq2aRLvOC9_ieR5GyYk=BoZsNLsszfYPZ-6+Q@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jul 13, 2015 at 10:13:59AM +0200, Michal Kazior wrote:
> On 13 July 2015 at 03:43, Bob Copeland <me@bobcopeland.com> wrote:
> > [trimmed CC to list]
> >
> > On Sun, Jul 12, 2015 at 10:25:32AM -0400, Bob Copeland wrote:
> >> It looks like unicast self-protected action frames (peering) works fine, but
> >> broadcast multihop action frames (PREQs) never go over the air.  Does
> >> this sound familiar to anyone?
> >
> > Actually, it's any group addressed frame.  I tried playing with various
> > values for htt_data_tx_ext_tid as well as just using the tid on the frame
> > (in mesh group addressed frames still have a qos header with tid=0).
> 
> Just a quick question: did you try applying the sw crypto/raw mode
> patch[1] and using it for mesh?
> 
> [1]: https://patchwork.kernel.org/patch/6600721/

Ok, I have this working again against the latest driver, including that
patch -- I don't think anything was wrong with it, just didn't have both
raw tx and decap set properly and had some baggage from the original
patch to jettison.

Still a bit WIP but this patchset against openwrt r46584 seems to work
for me:

http://bobcopeland.com/kernel/wl/20150812/

The mac80211 bits (except for VHT) are upstream but openwrt doesn't have
them yet.

(BTW thanks to Cococorp for sending me a few APs to make testing a lot easier!)

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
