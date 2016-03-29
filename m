Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akrQF-0000iU-7n
 for ath10k@lists.infradead.org; Tue, 29 Mar 2016 11:02:55 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: latest ath10k pending tree bug's
Date: Tue, 29 Mar 2016 11:02:27 +0000
Message-ID: <1459249346817.95969@qti.qualcomm.com>
References: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1458647539-17213-2-git-send-email-rmanohar@qti.qualcomm.com>
 <8760wcdnws.fsf@kamboji.qca.qualcomm.com>
 <1458834773112.89396@qti.qualcomm.com>
 <87bn5xd96c.fsf@kamboji.qca.qualcomm.com>,
 <276aecc9-73a9-d71e-5aac-69c4eacf38d8@dd-wrt.com>
In-Reply-To: <276aecc9-73a9-d71e-5aac-69c4eacf38d8@dd-wrt.com>
Content-Language: en-US
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>

> the new introduced code which initialized the precal data for new
> chipsets will break QCA99XX support.
> so ath10k fails to initialize.
> i commented out
> ret = ath10k_core_pre_cal_config(ar);
> and
>   ret = ath10k_core_pre_cal_download(ar);
> 
> to get it working again. this might not affect real pcie cards. but on
> IPQ8064 based boards with on board wifi cards it shows that behaviour.
> 
Can you please try below change?

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index ca45da3..cf90c87 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -725,10 +725,8 @@ struct ath10k {
        const void *firmware_data;
        size_t firmware_len;

-       union {
-               const struct firmware *pre_cal_file;
-               const struct firmware *cal_file;
-       };
+       const struct firmware *pre_cal_file;
+       const struct firmware *cal_file;

        struct {
                const void *firmware_codeswap_data;

> in addition this message here floods the kernel log
> [125917.204121] ath10k_pci 0001:01:00.0: failed to increase tx mgmt
> pending count: -16, dropping
> but it has no further visible side effects
> 
Yeah... It is harmless but better to lower debug level.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
