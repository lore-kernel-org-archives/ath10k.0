Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB3ot-0001X0-Sn
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 20:46:19 +0000
Received: by mail-it1-x143.google.com with SMTP id k64so1465329itb.5
 for <ath10k@lists.infradead.org>; Mon, 01 Apr 2019 13:46:14 -0700 (PDT)
Date: Mon, 1 Apr 2019 16:46:12 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH v4 1/3] cfg80211: Add support to set tx power for a
 station associated
Message-ID: <20190401204611.GA8910@localhost>
References: <1553856501-21492-1-git-send-email-bpothuno@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553856501-21492-1-git-send-email-bpothuno@codeaurora.org>
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

Hi Balaji,

I started playing with these patches a bit -- they could be useful for
my use case, but I had a question:

> + * @power: tx power (in dBm) to be used for sending data traffic. If tx power
> + *	is not provided, the default per-interface tx power setting will be
> + *	overriding. Driver should be picking up the lowest tx power, either tx
> + *	power per-interface or per-station.

Should this really dBm?  It's a bit asymmetric for WIPHY_TX_POWER_LEVEL to
use mBm and this to use dBm, and I might want to adjust in half-dB steps if
supported by hardware.  Also allocating an s16 is a bit much for dBm.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
