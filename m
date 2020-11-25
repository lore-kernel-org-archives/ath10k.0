Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khnpp-0008FL-5Q
 for ath10k@lists.infradead.org; Wed, 25 Nov 2020 05:59:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next 1/2] soc: qcom: ipa: Constify static qmi structs
References: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
 <20201122234031.33432-2-rikard.falkeborn@gmail.com>
 <20201124144721.3e80698c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Date: Wed, 25 Nov 2020 07:59:11 +0200
In-Reply-To: <20201124144721.3e80698c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 (Jakub Kicinski's message of "Tue, 24 Nov 2020 14:47:21 -0800")
Message-ID: <87h7pe9du8.fsf@codeaurora.org>
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>, "David S. Miller" <davem@davemloft.net>

Jakub Kicinski <kuba@kernel.org> writes:

> On Mon, 23 Nov 2020 00:40:30 +0100 Rikard Falkeborn wrote:
>> These are only used as input arguments to qmi_handle_init() which
>> accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
>> const to allow the compiler to put them in read-only memory.
>> 
>> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
>
> I can take this one if Alex acks it.
>
> The other patch is probably best handled by Kalle.

Yes, patch 2 is in my queue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
