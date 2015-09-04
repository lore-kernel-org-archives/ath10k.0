Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.neratec.com ([46.140.151.2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXofP-0006qN-8b
 for ath10k@lists.infradead.org; Fri, 04 Sep 2015 10:56:24 +0000
Message-ID: <55E978BB.1030009@neratec.com>
Date: Fri, 04 Sep 2015 12:55:55 +0200
From: Zefir Kurtisi <zefir.kurtisi@neratec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath: use PRI value given by spec for fixed PRI
References: <1427475590-2198-1-git-send-email-poh@qca.qualcomm.com>
 <55191D89.2000300@neratec.com> <55198EA4.1010101@codeaurora.org>
 <551BC2B1.3030002@neratec.com> <55E88BA4.7010009@codeaurora.org>
In-Reply-To: <55E88BA4.7010009@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 09/03/2015 08:04 PM, Peter Oh wrote:
> Hi Zefir,
> 
> I believe the patch below is good to be checked in since you've already made
> change in DFS.
> Can you confirm it?
> 
> [...]
> 
Hi Peter,

yes, after adding the chirp detecting feature to ath9k, I did an internal
certification run with all your patches applied. All good for ETSI (FCC testing
ongoing), so full ACK for the changes.


Cheers,
Zefir



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
