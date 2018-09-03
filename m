Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwlwj-00085i-FG
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 10:19:10 +0000
Message-ID: <1535969922.3437.37.camel@sipsolutions.net>
Subject: Re: [RFC v2] ath10k: report tx rate using ieee80211_tx_status()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 03 Sep 2018 12:18:42 +0200
In-Reply-To: <87k1o6d8hw.fsf@kamboji.qca.qualcomm.com>
References: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
 <87k1o6d8hw.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Fri, 2018-08-31 at 15:29 +0300, Kalle Valo wrote:

> Too me this feels like a bad idea but I'm not familiar enough with
> mac80211 to really comment on this. What kind of implications does this
> have for Mesh or ATF, for example? Adding Johannes and Toke to hear
> about their opinion about this.

The biggest implication is probably radiotap. Beyond that, it's using
this to report the "last rate" to nl80211, but that's not all super
useful anyway.

The retry count is also affected, and since you report "somewhat
liberally" that would lead to erroneous statistics.

I'd recommend against doing this and disentangling the necessary code in
mac80211, e.g. with ieee80211_tx_status_ext() or adding similar APIs.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
