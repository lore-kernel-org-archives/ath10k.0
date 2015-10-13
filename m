Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zlv0A-0004c4-Uw
 for ath10k@lists.infradead.org; Tue, 13 Oct 2015 08:32:07 +0000
Message-ID: <1444725101.1961.2.camel@sipsolutions.net>
Subject: Re: [PATCH] Revert "mac80211: remove exposing 'mfp' to drivers"
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 13 Oct 2015 10:31:41 +0200
In-Reply-To: <1444194604-12637-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1444194604-12637-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: c_traja@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Wed, 2015-10-07 at 10:40 +0530, c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> This reverts commit 5c48f1201744233d4f235c7dd916d5196ed20716.
> 
> Some device drivers (ath10k) offload part of aggregation including 
> AddBA/DelBA
> negotiations to firmware. In such scenario, the PMF configuration of
> the station needs to be provided to driver to enable encryption of
> AddBA/DelBA action frames.
> 
Applied.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
