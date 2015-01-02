Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6wwC-0008CT-96
 for ath10k@lists.infradead.org; Fri, 02 Jan 2015 07:46:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Enable RX batching
References: <1419834084-11859-1-git-send-email-sujith@msujith.org>
Date: Fri, 2 Jan 2015 09:45:54 +0200
In-Reply-To: <1419834084-11859-1-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Mon, 29 Dec 2014 11:51:24 +0530")
Message-ID: <87fvbt62x9.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> This feature allows the FW to batch RX indications,
> reducing the rate of host interrupt generation, which
> in turn reduces CPU load. Currently, this is enabled
> only for the 10.2 firmware.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Any throughput improvements?

Also I simplified the patch a bit in ath-next-test:

--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3710,7 +3710,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
        struct wmi_init_cmd_10_2 *cmd;
        struct sk_buff *buf;
        struct wmi_resource_config_10x config = {};
-       u32 len, val, features = 0;
+       u32 len, val, features;
 
        config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
        config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
@@ -3764,7 +3764,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 
        cmd = (struct wmi_init_cmd_10_2 *)buf->data;
 
-       features |= WMI_10_2_RX_BATCH_MODE;
+       features = WMI_10_2_RX_BATCH_MODE;
        cmd->resource_config.feature_mask = __cpu_to_le32(features);
 
        memcpy(&cmd->resource_config.common, &config, sizeof(config));


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
