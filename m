Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWMTb-0003d2-DE
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 09:33:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/9] ath10k: mostly cleanups
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 23 Sep 2014 12:33:04 +0300
In-Reply-To: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 18 Sep 2014 15:21:18 +0200")
Message-ID: <87tx3yel67.fsf@kamboji.qca.qualcomm.com>
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

> Here's a bunch of clean up patches for WMI and a
> single fix. I'm including the fix in this patchset
> because one of the clean up patches depends on it.
>
>
> Michal Kazior (9):
>   ath10k: fix tx/rx chainmask init
>   ath10k: remove unused pdev_set_channel command
>   ath10k: deduplicate wmi_channel code
>   ath10k: deduplicate host mem chunk code
>   ath10k: relocate wmi attach/deatch functions
>   ath10k: deduplicate wmi service ready logic
>   ath10k: clean up phyerr code
>   ath10k: unify wmi event function names
>   ath10k: re-work scan start command building

Thanks, all nine patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
