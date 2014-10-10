Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xcalp-0008Ty-Ro
 for ath10k@lists.infradead.org; Fri, 10 Oct 2014 14:02:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: use bss_info as txpower source
References: <1412940780-25360-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 10 Oct 2014 17:01:32 +0300
In-Reply-To: <1412940780-25360-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Oct 2014 13:33:00 +0200")
Message-ID: <87ppe0aurn.fsf@kamboji.qca.qualcomm.com>
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

> This simply changes the source for txpower setup.
> It does not make ath10k use different txpower
> values for different vifs.
>
> This will make it easier to implement chanctx in
> ath10k in the future.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

In ath-next-test there was a conflict in ath10k_bss_info_changed().
Please check my resolution:

https://github.com/kvalo/ath/commit/86eea6fda33ce16a40f98d41c19ea4b0e157f5ba

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
