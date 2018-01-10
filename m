Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZCr8-00030H-4f
 for ath10k@lists.infradead.org; Wed, 10 Jan 2018 09:39:35 +0000
Date: Wed, 10 Jan 2018 10:39:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-stable-4.9.y: please apply serious ath10k security
Message-ID: <20180110093919.GB22851@kroah.com>
References: <87r2qzyt78.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r2qzyt78.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org, stable@vger.kernel.org

On Tue, Jan 09, 2018 at 04:58:51PM +0200, Kalle Valo wrote:
> Hi Linux stable team,
> 
> ath10k has a replay detection problem which was fixed in v4.14. I would
> like to get the fix also to linux-stable-4.9.y but for that it depends
> on a small mac80211 patch. So then cherrypicking the fixes please take
> the mac80211 commit first:
> 
> cef0acd4d7d4 mac80211: Add RX flag to indicate ICV stripped
> 7eccb738fce5 ath10k: rebuild crypto header in rx data frames
> 
> I tested and in this order commits apply just fine to linux-4.9.y.
> 
> The ath10k patch is largish but as this fixes a security issue I hope it
> still can be applied to linux-stable. Please let me know if there are
> any problems.

Both now queued up, thanks.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
