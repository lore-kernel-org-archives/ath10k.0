Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aukct-0003dl-Jx
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 17:48:52 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/8] ath10k: refactor firmware components
Date: Mon, 25 Apr 2016 17:48:26 +0000
Message-ID: <87wpnl1swm.fsf@kamboji.qca.qualcomm.com>
References: <20160420164301.8801.12099.stgit@potku.adurom.net>
In-Reply-To: <20160420164301.8801.12099.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 20 Apr 2016 19:44:22 +0300")
Content-Language: en-US
Content-ID: <DACB4819905E4A42BF65DD787E416EC0@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> This series refactors various ath10k firmware components into struct
> ath10k_fw_components which contains everything firmware related (board
> files, meta data and so on). This makes it possible to kill
> ath10k_tm_fetch_utf_firmware_api_2() from testmode.c.
>
> Also REALLY old FW API 1 (firmware.bin and otp.bin) support is
> removed.
>
> v2:
>
> o patch 1: remove all unused "firmware.bin" and "otp.bin" defines
>
> o patch 2: remove a lefover FIXME comment, create local variable for
>   ar->normal_mode_fw.fw_file.firmware
>
> o patch 2: fix block comment styles
>
> o patch 2: fix long lines
>
> drivers/net/wireless/ath/ath10k/testmode.c:200: line over 90 characters
> drivers/net/wireless/ath/ath10k/testmode.c:201: line over 90 characters
>
> ---
>
> Kalle Valo (8):
>       ath10k: remove deprecated firmware API 1 support
>       ath10k: refactor firmware images to struct ath10k_fw_components
>       ath10k: move fw_version inside struct ath10k_fw_file
>       ath10k: move fw_features to struct ath10k_fw_file
>       ath10k: move wmi_op_version to struct ath10k_fw_file
>       ath10k: move htt_op_version to struct ath10k_fw_file
>       ath10k: switch testmode to use ath10k_core_fetch_firmware_api_n()
>       ath10k: remove enum ath10k_swap_code_seg_bin_type

Applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
