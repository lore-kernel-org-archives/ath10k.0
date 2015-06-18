Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5TCg-0004aM-89
 for ath10k@lists.infradead.org; Thu, 18 Jun 2015 06:21:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 00/10] Add QCA99X0 support
References: <1434431542-14724-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Thu, 18 Jun 2015 09:20:51 +0300
In-Reply-To: <1434431542-14724-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Tue, 16 Jun 2015 10:42:12
 +0530")
Message-ID: <87wpz17d18.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> This patch set adds changes for QCA99X0 chip in pci probe,
> Copy Engine init and firmware downloads. Since it is still
> work in progress the support for this chip is not yet
> advertised in pci device table.
>
> Vasanthakumar Thiagarajan (10):
>   ath10k: Add a table to store hw specific values
>   ath10k: Add new reg_address/mask to hw register table
>   ath10k: Add hw register/values for QCA99X0 chip
>   ath10k: Copy Engine related changes for QCA99X0
>   ath10k: Make target cpu address to CE address conversion chip specific
>   ath10k: Add chip reset sequence for QCA99X0
>   ath10k: Extend CE src desc flags for interrupt indication
>   ath10k: Fix BMI communication timeout for QCA99X0
>   ath10k: Add support for code swap
>   ath10k: Add BMI param value to execute otp to hw_param

These patches don't apply and don't have proper sha1 ids. Please rebase.
And remember always to use ath.git master branch as the baseline, don't
apply any custom patches because that will break 3-way merge.

Applying: ath10k: Add a table to store hw specific values
Applying: ath10k: Add new reg_address/mask to hw register table
Applying: ath10k: Add hw register/values for QCA99X0 chip
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/core.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0003 ath10k: Add hw register/values for QCA99X0 chip

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
