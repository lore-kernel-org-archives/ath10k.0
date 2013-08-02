Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5A5t-0000Tv-4s
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 07:48:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add SoC power save option to PCI features map
References: <1375348187-18216-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 2 Aug 2013 10:47:44 +0300
In-Reply-To: <1375348187-18216-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 1 Aug 2013 11:09:47 +0200")
Message-ID: <877gg4pm8v.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Unify the PCI options location.
>
> By default the SoC PS option is disabled to boost the
> performance and due to poor stability on early HW revisions.
> In future we can remove the module parameter and turn on/off
> the PS for given hardware.
>
> This change also makes the pci module parameter for SoC PS static.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

A minor nitpick:

> +	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
> +		ath10k_do_pci_wake(ar); /* Force AWAKE forever */

if (foo)
        /* comment */
        function_call();

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
