Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jemqA-0000z0-Dq
 for ath10k@lists.infradead.org; Fri, 29 May 2020 21:46:59 +0000
Received: from [192.168.254.4] (unknown [50.34.197.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 4481313C2B0
 for <ath10k@lists.infradead.org>; Fri, 29 May 2020 14:46:57 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Potential issue with htt flags
Message-ID: <d8b142d3-74e9-4695-5eb9-b5307867045b@candelatech.com>
Date: Fri, 29 May 2020 14:46:56 -0700
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

While porting forward my patches to 5.7 , I noticed this:

#define HTT_TX_CMPL_FLAG_DATA_RSSI		BIT(0)
#define HTT_TX_CMPL_FLAG_PPID_PRESENT		BIT(1)
#define HTT_TX_CMPL_FLAG_PA_PRESENT		BIT(2)
#define HTT_TX_CMPL_FLAG_PPDU_DURATION_PRESENT	BIT(3)

#define HTT_TX_DATA_RSSI_ENABLE_WCN3990 BIT(3)
#define HTT_TX_DATA_APPEND_RETRIES BIT(0)
#define HTT_TX_DATA_APPEND_TIMESTAMP BIT(1)


Both of these are used against 'flags2', but as you see, some bits are defined to different
things.  In particular usage in,:

static int ath10k_get_htt_tx_data_rssi_pad(struct htt_resp *resp)

looks suspicious to me.

Maybe that ath10k_get_htt_tx_data_rssi_pad should be labeled specific for one particular
chipset?

I didn't look further, but maybe whoever added this could take a look?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
