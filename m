Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoBcl-0003PQ-TH
 for ath10k@lists.infradead.org; Mon, 19 Oct 2015 14:41:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Disable PCI PS for QCA988X and QCA99X0
References: <1443445278-11051-1-git-send-email-akolli@qti.qualcomm.com>
Date: Mon, 19 Oct 2015 17:40:40 +0300
In-Reply-To: <1443445278-11051-1-git-send-email-akolli@qti.qualcomm.com>
 (akolli@qti.qualcomm.com's message of "Mon, 28 Sep 2015 18:31:18
 +0530")
Message-ID: <87zizegbvb.fsf@kamboji.qca.qualcomm.com>
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
To: akolli@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

<akolli@qti.qualcomm.com> writes:

> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> This patch disables PCI PS for QCA988X and QCA99X0, Since PCI PS is
> validated for QCA6174, let it be enabled only for QCA6174. It would be
> better to execute PCI PS related functions only for the supported devices.
>
> PCI time out issue is observed with QCA99X0 on x86 platform, We will
> disable PCI PS for QCA988X and QCA99X0 until PCI PS is properly implemented.
>
> Taking and releasing ps_lock is causing higher CPU consumption. Michal Kazior
> suggested ps_lock overhead to be reworked so that ath10k_pci_wake/sleep
> functions are called less often, i.e. move the powersave logic up (only during
> irq handling, tx path, submitting fw commands).
>
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
