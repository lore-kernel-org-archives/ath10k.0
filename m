Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkJ1n-0007Ox-1w
 for ath10k@lists.infradead.org; Tue, 13 May 2014 20:10:19 +0000
Message-ID: <53727C12.2060100@candelatech.com>
Date: Tue, 13 May 2014 13:09:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFTv2 4/5] ath10k: wait for mgmt tx when flushing too
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397040531-6224-5-git-send-email-michal.kazior@tieto.com>
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
Cc: ath10k@lists.infradead.org

On 04/09/2014 03:48 AM, Michal Kazior wrote:
> The 10.1 firmware uses WMI to Tx management frames
> but ath10k_flush() didn't care. This could lead to
> some frames not being sent.
> 
> Although there are no Tx completions for WMI
> mangement frames it's still better to at least
> wait for ath10k queue to be drained.

This and others in this series do not appear to be in Kalle's
tree yet.  Are these to be dropped, or are they still pending?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
