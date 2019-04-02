Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBJ0Q-0000RP-Vv
 for ath10k@lists.infradead.org; Tue, 02 Apr 2019 12:59:15 +0000
Received: by mail-it1-x141.google.com with SMTP id s3so4876463itk.1
 for <ath10k@lists.infradead.org>; Tue, 02 Apr 2019 05:59:10 -0700 (PDT)
Date: Tue, 2 Apr 2019 08:59:08 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH v4 1/3] cfg80211: Add support to set tx power for a
 station associated
Message-ID: <20190402125908.GD32168@localhost>
References: <1553856501-21492-1-git-send-email-bpothuno@codeaurora.org>
 <20190401204611.GA8910@localhost>
 <cd497042d164c322bc06c4cfbf26435a@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd497042d164c322bc06c4cfbf26435a@codeaurora.org>
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Apr 02, 2019 at 12:00:29PM +0530, Balaji Pothunoori wrote:
> > Should this really dBm?  It's a bit asymmetric for WIPHY_TX_POWER_LEVEL
> > to
> > use mBm and this to use dBm, and I might want to adjust in half-dB steps
> > if
> > supported by hardware.  Also allocating an s16 is a bit much for dBm.
> 
> if user will send mBm value then driver has to convert to dBm because
> firmware will expect the value in dBm.
> Please refer johannes comments on following patch " [EXT] Re: [PATCH] iw:
> Add support for controlling tx power for per station"
> for the reason why we opted dBm.

The quote was:

> I would prefer if this was *dBm*, rather than mBm, and be allowed to
> take float values, i.e. this would become "limit 20".

I read that as "iw should convert fractional dBm to mBm" not "kernel should
only support dBm".

ath10k might only support dBm, fine -- but even ath5k could support
per-packet transmit power in 0.5 dB steps, so this is already limiting
applicability to existing hardware.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
