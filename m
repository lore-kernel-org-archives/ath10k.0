Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f174.google.com ([209.85.223.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhU1W-0003Nj-4V
 for ath10k@lists.infradead.org; Thu, 01 Oct 2015 02:55:11 +0000
Received: by ioii196 with SMTP id i196so70289444ioi.3
 for <ath10k@lists.infradead.org>; Wed, 30 Sep 2015 19:54:35 -0700 (PDT)
Date: Wed, 30 Sep 2015 22:54:32 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: only advertise mesh support in raw mode
Message-ID: <20151001025432.GA1664@localhost>
References: <1443445192-30464-1-git-send-email-me@bobcopeland.com>
 <56097882.4090004@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56097882.4090004@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Sep 28, 2015 at 10:27:30AM -0700, Peter Oh wrote:
> I prefer the current design to this new approach because drivers already
> know if it's mesh capable or not at build time, hence adding runtime
> configuration is redundant.

I do think the proposed patch is a bit overboard, so I suppose my vote is to
keep it the way it is, even if a little user-unfriendly.

> One more thing we have to think about is enabling mesh in only raw mode.
> In standard view point, mesh is only available in raw mode on ath10k,
> however ath10k is also able to run mesh in native WiFi mode in current
> mac80211 design since mac80211 handles packets per interface. So that
> mac80211 knows that packets are for mesh without looking at mesh control
> present bit when they come into mesh interface.

This is true, it'll work with mac80211, but it violates the standard
(802.11-2012 8.2.4.7.3).

For the benefit of others, as I just retested non-rawmode -- the issue is
that QoS control in nwifi frames is missing the "Mesh Control Present" bit.
However, it still includes the mesh control field, which is the part
that has the mesh sequence number and address extension fields.

As a result, a packet parser might misinterpret the mesh control field as
the LLC header -- the wireshark dissector at least gets confused like this.

I would think a small change to ath10k firmware could fix this though,
vendor willing.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
