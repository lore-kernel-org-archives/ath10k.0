Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL5SX-0001ty-8S
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 12:00:22 +0000
Message-ID: <78adf728bab8943152dc4db311c50fedbe5710f1.camel@sipsolutions.net>
Subject: Re: [PATCH 1/6] mac80211: Add TXQ scheduling API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 09 Nov 2018 13:00:04 +0100
In-Reply-To: <1540033534-11211-2-git-send-email-rmanohar@codeaurora.org>
 (sfid-20181020_130555_381291_6F3867B0)
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-2-git-send-email-rmanohar@codeaurora.org>
 (sfid-20181020_130555_381291_6F3867B0)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>

On Sat, 2018-10-20 at 04:05 -0700, Rajkumar Manoharan wrote:
> 
> + * @txq: pointer obtained from station or virtual interface, or from
> + *       ieee80211_next_txq()

nit: please just indent by a single tab for continuation, trying to line
it all up doesn't really make it more readable

I see you're still discussing all this, so I'm going to assume you'll
resend this series eventually :-)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
