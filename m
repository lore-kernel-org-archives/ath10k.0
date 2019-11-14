Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV9mP-0005Zc-He
 for ath10k@lists.infradead.org; Thu, 14 Nov 2019 07:43:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: add cleanup in ath10k_sta_state()
References: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
 <20191113192821.GA3441686@builder>
Date: Thu, 14 Nov 2019 09:42:52 +0200
In-Reply-To: <20191113192821.GA3441686@builder> (Bjorn Andersson's message of
 "Wed, 13 Nov 2019 11:28:21 -0800")
Message-ID: <87eeyax5s3.fsf@codeaurora.org>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wenwen Wang <wenwen@cs.uga.edu>, govinds@codeaurora.org, jeffrey.l.hugo@gmail.com, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Thu 15 Aug 14:04 PDT 2019, Wenwen Wang wrote:
>
>> If 'sta->tdls' is false, no cleanup is executed, leading to memory/resource
>> leaks, e.g., 'arsta->tx_stats'. To fix this issue, perform cleanup before
>> go to the 'exit' label.
>> 
>
> Unfortunately this patch consistently crashes all my msm8998, sdm845 and
> qcs404 devices (running ath10k_snoc).  Upon trying to join a network the
> WiFi firmware crashes with the following:
>
> [  124.315286] wlan0: authenticate with 70:3a:cb:4d:34:f3
> [  124.334051] wlan0: send auth to 70:3a:cb:4d:34:f3 (try 1/3)
> [  124.338828] wlan0: authenticated
> [  124.342470] wlan0: associate with 70:3a:cb:4d:34:f3 (try 1/3)
> [  124.347223] wlan0: RX AssocResp from 70:3a:cb:4d:34:f3 (capab=0x1011 status=0 aid=2)
> [ 124.402535] qcom-q6v5-mss 4080000.remoteproc: fatal error received:
> err_qdi.c:456:EF:wlan_process:1:cmnos_thread.c:3900:Asserted in
> wlan_vdev.c:_wlan_vdev_up:3219
>
> Can we please revert it for v5.5?

Yes, let's revert it. And thanks for sending the patch to do that:

https://patchwork.kernel.org/patch/11242743/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
