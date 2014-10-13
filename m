Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdaDy-0000Ag-PE
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 07:39:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/5] ath10k: split reset logic from power up
References: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
 <1412842950-14098-5-git-send-email-michal.kazior@tieto.com>
Date: Mon, 13 Oct 2014 10:38:54 +0300
In-Reply-To: <1412842950-14098-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 9 Oct 2014 10:22:29 +0200")
Message-ID: <87k344a06p.fsf@kamboji.qca.qualcomm.com>
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

> The power up procedure was overly complex due to
> warm/cold reset workarounds and issues.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +	ret = ath10k_pci_wait_for_target_init(ar);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to wait for target after cold reset: %d\n",
> +				ret);

Checkpatch warns:

ath10k/pci.c:1849: CHECK: Alignment should match open parenthesis

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
