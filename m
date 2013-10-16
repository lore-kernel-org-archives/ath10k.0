Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWQXF-0007O5-FZ
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 12:49:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: fix WMI atomic usage
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
Date: Wed, 16 Oct 2013 15:48:42 +0300
In-Reply-To: <20131015184548.14123.56949.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Tue, 15 Oct 2013 21:46:37 +0300")
Message-ID: <87fvs1755h.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Some WMI calls were made in atomic contex, these patches fix
> those. Please review.
>
> ---
>
> Kalle Valo (2):
>       ath10k: fix ath10k_bss_assoc() to not sleep in atomic context
>       ath10k: add might_sleep() to ath10k_wmi_cmd_send()
>
> Michal Kazior (5):
>       ath10k: use workqueue to set WEP TX key
>       ath10k: fix add_interface failure handling
>       ath10k: track vif list internally
>       ath10k: fix scheduling while atomic config bug
>       ath10k: remove unnecessary checks

All patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
