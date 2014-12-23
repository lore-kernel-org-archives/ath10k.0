Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3RHv-0000JD-AC
 for ath10k@lists.infradead.org; Tue, 23 Dec 2014 15:22:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/8] ath10k: Add thermal mitigation support
References: <20141217101755.15964.2625.stgit@potku.adurom.net>
Date: Tue, 23 Dec 2014 17:21:47 +0200
In-Reply-To: <20141217101755.15964.2625.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 17 Dec 2014 12:20:35 +0200")
Message-ID: <87k31ie6ic.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> The following patches add thermal sensor and thermal cooling device
> support in ath10k. For sensor, hwmon interface is used. For controlling
> temperature cooling device interface is used. For thermal mitigation,
> tx throttling is done using hw MAC quiet time setting.
>
> v2:
>
> * use ATH10K_FW_IE_WMI_OP_VERSION instead of a feature flag
>
> * add separate wmi mappings for 10.2.4
>
> * bump up FW API to 4
>
> * new patch: ath10k: set max_num_vdevs based on wmi op version
>
> * new patch: ath10k: use wmi op version to check which iface
>   combination to use
>
> * new patch: ath10k: print ath10k wmi op version
>
> ---
>
> Kalle Valo (3):
>       ath10k: set max_num_vdevs based on wmi op version
>       ath10k: use wmi op version to check which iface combination to use
>       ath10k: print ath10k wmi op version
>
> Rajkumar Manoharan (5):
>       ath10k: add 10.2.4 firmware support
>       ath10k: add wmi support for pdev_set_quiet_mode
>       ath10k: add thermal cooling device support
>       ath10k: add wmi interface for pdev_get_temperature
>       ath10k: add thermal sensor device support

All eight patches applied, thanks Rajkumar.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
