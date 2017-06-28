Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQGEZ-0004QM-Bj
 for ath10k@lists.infradead.org; Wed, 28 Jun 2017 16:54:33 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add const to thermal_cooling_device_ops structure
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1498037010-21024-1-git-send-email-bhumirks@gmail.com>
References: <1498037010-21024-1-git-send-email-bhumirks@gmail.com>
Message-ID: <ba4938bc024149c4a5bbb36dd2c66fef@euamsexm01a.eu.qualcomm.com>
Date: Wed, 28 Jun 2017 18:54:01 +0200
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
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, julia.lawall@lip6.fr

Bhumika Goyal <bhumirks@gmail.com> wrote:

> Declare thermal_cooling_device_ops structure as const as it is only passed
> as an argument to the function thermal_cooling_device_register and this
> argument is of type const. So, declare the structure as const.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

1cdb6c9fd433 ath10k: add const to thermal_cooling_device_ops structure

-- 
https://patchwork.kernel.org/patch/9801291/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
