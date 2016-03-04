Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablIq-0006va-Ox
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:41:41 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix erroneous return value
Date: Fri, 4 Mar 2016 08:41:15 +0000
Message-ID: <8760x2zlcn.fsf@kamboji.qca.qualcomm.com>
References: <1455123535-26751-1-git-send-email-a.s.protopopov@gmail.com>
In-Reply-To: <1455123535-26751-1-git-send-email-a.s.protopopov@gmail.com>
 (Anton Protopopov's message of "Wed, 10 Feb 2016 11:58:55 -0500")
Content-Language: en-US
Content-ID: <79582C88FC1A8E4296C2A2DC849892A6@qualcomm.com>
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
To: Anton Protopopov <a.s.protopopov@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Anton Protopopov <a.s.protopopov@gmail.com> writes:

> The ath10k_pci_hif_exchange_bmi_msg() function may return the positive
> value EIO instead of -EIO in case of error.
>
> Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
