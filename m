Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXtQ-00024O-EB
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:48:48 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add dynamic tx mode switch config support for
 qca4019
Date: Tue, 19 Apr 2016 15:48:24 +0000
Message-ID: <87r3e1ioqg.fsf@kamboji.qca.qualcomm.com>
References: <1460472353-4317-1-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1460472353-4317-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Tue, 12 Apr 2016 20:15:53 +0530")
Content-Language: en-US
Content-ID: <DAFCBF01405870419C69DC97AB5991BB@qualcomm.com>
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
To: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Raja Mani <rmani@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<c_traja@qti.qualcomm.com> writes:

> From: Raja Mani <rmani@qti.qualcomm.com>
>
> push-pull mode needs certain amount the host driver involvement for
> managing queues in the host memory and packet delivery to firmware.
> qca4019 wifi firmware has an option to stay in push mode for less
> number of active traffic flow and then switch to push-pull mode when
> the active traffic flow goes beyond the certain limit.
>
> The advantage of staying in push mode for less active traffic is, the
> host cpu consumption is reduced. qca4019 firmware supports this
> flexibility of the mode switch. It takes the host driver interest
> (LOW_PERF/HIGH_PERF) via WMI_EXT_RESOURCE_CFG_CMDID,
>
>  LOW_PERF  - fw would stay in push mode and switch to push-pull
>                based on demand.
>  HIGH_PERF - fw would stay in push-pull mode from the boot.
>
> To make this configuration generic, new WMI services
> WMI_SERVICE_TX_MODE_PUSH_ONLY, WMI_SERVICE_TX_MODE_PUSH_PULL,
> WMI_SERVICE_TX_MODE_DYNAMIC are introduced to take dynamic tx mode
> switch support availability in firmware.
> Based on WMI_SERVICE_TX_MODE_DYNAMIC, LOW_PERF or HIGHT_PERF is
> configured to the firmware.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
