Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSBNc-0004Sh-O5
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:54:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 3/3] ath10k: add cal_data debugfs file
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203152.12514.95332.stgit@potku.adurom.net>
Date: Thu, 11 Sep 2014 23:53:42 +0300
In-Reply-To: <20140911203152.12514.95332.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 11 Sep 2014 23:31:52 +0300")
Message-ID: <87mwa52815.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Provide calibration data used by the firmware to user space via a debugfs file.
> This makes it easier to debug calibration related problems.
>
> Example:
>
> sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> +	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
> +	if (ret) {
> +		ath10k_warn("failed to read hi_board_data address: %d\n", ret);

This and rest of the fuction is missing 'ar' parameter. Obviously it's
too late for me :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
