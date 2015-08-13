Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPqji-000773-1t
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 11:31:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: don't remove peer that doesn't exist
References: <1438769724-29438-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 13 Aug 2015 14:31:20 +0300
In-Reply-To: <1438769724-29438-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 5 Aug 2015 12:15:23 +0200")
Message-ID: <87wpwzmnlj.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If peer creation failed during offchannel Tx the
> driver attempted to delete the peer nonetheless.
> This caused the ar->num_peers counter to be
> incorrectly decremented. This subsequently could
> cause the counter to drop below 0 and also
> eventually lead to firmware crash because host
> would think there are less peer entries created in
> firmware then there really were.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
