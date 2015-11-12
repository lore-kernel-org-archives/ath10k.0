Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwxAa-0008ON-Ji
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 19:04:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] update ath10k support for QCA9377 chips
References: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 12 Nov 2015 21:03:51 +0200
In-Reply-To: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 5 Nov 2015 09:50:39 +0100")
Message-ID: <874mgr6nvs.fsf@kamboji.qca.qualcomm.com>
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

> * Clarifying the naming scheme for QCA9377 targets
> * Adding the dev_id mathod (RFC) as a HW identification helper
> * updating missing hw_params for 1.1 target
>
> ---
>
> Notes:
>   v2:
>    * rebase
>    * fix the whitespace mess in patch 4/4 [Kalle]
>
> Bartosz Markowski (4):
>   ath10k: fix the currently supported QCA9377 target version name
>   ath10k: update missing hw_params of QCA9377 hw1.1
>   ath10k: introduce dev_id to hw_params
>   ath10k: add QCA9377 hw1.0 support

Applied to ath-current, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
