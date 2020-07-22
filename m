Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyEHd-0001Jl-8Y
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 12:55:43 +0000
Message-ID: <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 22 Jul 2020 14:55:06 +0200
In-Reply-To: <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
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
To: Felix Fietkau <nbd@nbd.name>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:

> I'm considering testing a different approach (with mt76 initially):
> - Add a mac80211 rx function that puts processed skbs into a list
> instead of handing them to the network stack directly.

Would this be *after* all the mac80211 processing, i.e. in place of the
rx-up-to-stack?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
