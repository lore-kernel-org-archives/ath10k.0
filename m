Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vka56-0003Yp-8E
 for ath10k@lists.infradead.org; Sun, 24 Nov 2013 13:50:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: use nss provided by mac80211
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385126819-15311-2-git-send-email-michal.kazior@tieto.com>
Date: Sun, 24 Nov 2013 15:50:07 +0200
In-Reply-To: <1385126819-15311-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Nov 2013 14:26:57 +0100")
Message-ID: <87k3fxsycw.fsf@kamboji.qca.qualcomm.com>
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

> Calculating STA NSS just from the rateset is not
> the greatest idea. The NSS could be possibly
> influenced by other things that only mac80211
> knows about.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Is there a bug which this patch fixes or what motivated you to do this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
