Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VR2o7-0006w1-Nw
 for ath10k@lists.infradead.org; Tue, 01 Oct 2013 16:28:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Fix bug in max. VHT A-MPDU size
References: <1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380292567-2363-2-git-send-email-michal.kazior@tieto.com>
Date: Tue, 1 Oct 2013 19:27:52 +0300
In-Reply-To: <1380292567-2363-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 27 Sep 2013 16:36:06 +0200")
Message-ID: <87a9it6jnb.fsf@kamboji.qca.qualcomm.com>
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
Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> For VHT peers, the maximum A-MPDU size has to be calculated
> from the VHT capabilities element and not the HT-cap. The formula
> is the same, but a higher value is used in VHT, allowing larger
> aggregates to be transmitted.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This kills the TCP TX throughput with D-Link DIR-865L (ath10k x86 as the
client) from ~350 Mbps to ~120 Mbps. Sujith mentioned private there's a
workaround for this, this patch should have that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
