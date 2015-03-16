Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXc9N-0002MQ-LC
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 21:02:14 +0000
Received: by wggv3 with SMTP id v3so50056282wgg.1
 for <ath10k@lists.infradead.org>; Mon, 16 Mar 2015 14:01:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1934267.DCC3TFggkK@prime>
References: <1934267.DCC3TFggkK@prime>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 16 Mar 2015 14:01:19 -0700
Message-ID: <CAD1M0607YjHHN+cO6=20enKAdpGSutc_GR60Fp_hfdU5qGPYnw@mail.gmail.com>
Subject: Re: ath10k tx99-like test mode?
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Mar 16, 2015 at 5:21 AM, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> is there a test mode for ath10k where one can set different legacy/MCS rates to
> test output power levels in a lab? We used tx99 on ath9k for that purpose, is
> there an equivalent feature in ath10k as well?

Simon,

I've asked about this before since a 'testmode' was added to ath10k
several months ago, but was pretty much shot down. However, there's a
nifty tool called wperf (https://github.com/anyfi/wperf) that might
accomplish what you're after. I've yet to try it, but it does seem
promising since you'll hopefully be able to use UDP traffic to inject
frames into the air, though I'm not sure how the firmware will react.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
