Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu29D-0007F8-96
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 17:46:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix invalid NSS for 4x4 devices
References: <1446531693-23453-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Wed, 4 Nov 2015 19:46:11 +0200
In-Reply-To: <1446531693-23453-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Tue, 3 Nov 2015 11:51:33 +0530")
Message-ID: <87pozpbqu4.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> The number of spatial streams that are derived from chain mask
> for 4x4 devices is using wrong bitmask and conditional check.
> This is affecting downlink throughput for QCA99x0 devices. Earlier
> cfg_tx_chainmask is not filled by default until user configured it
> and so get_nss_from_chainmask never be called. This issue is exposed
> by recent commit 166de3f1895d ("ath10k: remove supported chain mask").
> By default maximum supported chain mask is filled in cfg_tx_chainmask.
>
> Cc: stable@vger.kernel.org
> Fixes: 5572a95b4b ("ath10k: apply chainmask settings to vdev on
> creation")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

I'm planning to send this to 4.3-rc releases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
